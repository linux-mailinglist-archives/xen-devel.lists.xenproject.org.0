Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E700CA55C2F
	for <lists+xen-devel@lfdr.de>; Fri,  7 Mar 2025 01:49:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.904438.1312317 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqLtz-0004P0-4a; Fri, 07 Mar 2025 00:49:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 904438.1312317; Fri, 07 Mar 2025 00:49:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqLtz-0004NT-1h; Fri, 07 Mar 2025 00:49:23 +0000
Received: by outflank-mailman (input) for mailman id 904438;
 Fri, 07 Mar 2025 00:49:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Nrba=V2=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tqLty-0003mY-86
 for xen-devel@lists.xenproject.org; Fri, 07 Mar 2025 00:49:22 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ff1d4426-faed-11ef-9898-31a8f345e629;
 Fri, 07 Mar 2025 01:49:17 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 815C4A4535F;
 Fri,  7 Mar 2025 00:43:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F6CDC4CEE5;
 Fri,  7 Mar 2025 00:49:15 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: ff1d4426-faed-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741308555;
	bh=nzu4MBOshbka4yvyEkAlVonFwNV1K4fmA6QYEemB+dM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=MLRx55nL/bylyF0m+wR0Kn39Ck2rkfE3xEjMSHD3dk8CWgSJ5YVFo3ncyIk1Iiy8k
	 yaZRk3fFQxiuxreJWjC0MW3pmH7oGTisVO/LENQWHzNFoK79uTpXJ36F2F91hIqwL1
	 7J3F7E14nDujWXcWINSaAUa4Owx0FBqMsmNIvQwRFFi4vqpULqNPB5pj+4yZB88W8z
	 yfYem6aRzP3zEgs71BLqHlIBfoUAE3ijZ3tttNlCN9QYtWPZyXejXmJvkasmTiPpGW
	 +ykgLRqZEVk550obwo+GnztVWdTtAzl7VjuOkt04nXK9zfbZWUhV1Gcs0tF935sQJ4
	 dODUnkOQ8BTZQ==
Date: Thu, 6 Mar 2025 16:49:14 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Stefano Stabellini <sstabellini@kernel.org>
cc: Luca Miccio <luca.miccio@amd.com>, xen-devel@lists.xenproject.org
Subject: Re: [ImageBuilder] uboot-script-gen: handle reserved memory
 regions
In-Reply-To: <alpine.DEB.2.22.394.2503061606020.2600338@ubuntu-linux-20-04-desktop>
Message-ID: <alpine.DEB.2.22.394.2503061648360.2600338@ubuntu-linux-20-04-desktop>
References: <20250228150733.3945774-1-luca.miccio@amd.com> <alpine.DEB.2.22.394.2503061606020.2600338@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 6 Mar 2025, Stefano Stabellini wrote:
> On Fri, 28 Feb 2025, Luca Miccio wrote:
> > Currently, the uboot-script-gen does not account for reserved memory
> > regions in the device tree. This oversight can lead to scenarios where
> > one or more boot modules overlap with a reserved region. As a result,
> > Xen will always crash upon detecting this overlap. However, the crash
> > will be silent (without output) if earlyprintk is not enabled, which is
> > the default setting at the moment.
> > 
> > To address this issue, add a function that iterates over the
> > reserved-memory nodes and populates an array. This array will be used
> > later to calculate the load address for any given file.
> > 
> > Signed-off-by: Luca Miccio <luca.miccio@amd.com>
> 
> Hi Luca,
> 
> Thanks for the nice patch! I was waiting for the 4.21 development window
> to open.
> 
> 
> > ---
> >  scripts/uboot-script-gen | 59 ++++++++++++++++++++++++++++++++++++++--
> >  1 file changed, 56 insertions(+), 3 deletions(-)
> > 
> > diff --git a/scripts/uboot-script-gen b/scripts/uboot-script-gen
> > index db2c011..cd0d202 100755
> > --- a/scripts/uboot-script-gen
> > +++ b/scripts/uboot-script-gen
> > @@ -468,6 +468,42 @@ function device_tree_editing()
> >      fi
> >  }
> >  
> > +function fill_reserved_spaces_from_dtb()
> > +{
> > +    if [ ! -f $DEVICE_TREE ]
> > +    then
> > +        echo "File $DEVICE_TREE doesn't exist, exiting";
> > +        cleanup_and_return_err
> > +    fi
> > +
> > +    addr_cells=$(fdtget -t x $DEVICE_TREE /reserved-memory '#address-cells')
> > +    size_cells=$(fdtget -t x $DEVICE_TREE /reserved-memory '#size-cells')

One more comment. If the DT doesn't have any reserved memory regions:

Error at '/reserved-memory': FDT_ERR_NOTFOUND
Error at '/reserved-memory': FDT_ERR_NOTFOUND
Error at '/reserved-memory': FDT_ERR_NOTFOUND

It would be best to silence these errors


> missing "local" for both variables
> 
> 
> > +    for node in $(fdtget -l $DEVICE_TREE /reserved-memory); do
> > +        reg_values=($(fdtget -t x $DEVICE_TREE /reserved-memory/$node reg))
> 
> missing "local"
> 
> 
> > +        for ((i=0; i<${#reg_values[@]}; i+=addr_cells+size_cells)); do
> > +            addr=0
> > +            size=0
> 
> missing "local" for addr and size, and also i and j
> 
> 
> > +            for ((j=0; j<addr_cells; j++)); do
> > +                addr=$((addr << 32 | 0x${reg_values[i+j]}))
> > +            done
> > +            
> > +            for ((j=0; j<size_cells; j++)); do
> > +                size=$((size << 32 | 0x${reg_values[i+addr_cells+j]}))
> > +            done
> > +            
> > +            addr=$(printf "0x%X" $addr)
> > +            size=$(printf "0x%X" $size)
> > +        done
> > +
> > +        # Add the reserved space to the list and avoid duplicates
> > +        if [[ ! " ${RESERVED_MEM_SPACES[@]} " =~ " ${addr},${size} " ]]; then
> 
> I think this is too imprecise as a check because it would match with a
> similar element of the array with a higher number of zeros. If I read
> this right:
> 
> 0x1000,0x1000 would match 0x1000,0x10000
> 
> I would either remove this check, as it might be OK to have duplicates,
> or I would turn it into a proper numeric check, one item at a time in
> the list.
> 
> 
> > +            RESERVED_MEM_SPACES+=("${addr},${size}")
> > +        fi
> > +    done
> > +}
> > +
> >  # Read effective image size from a header, which may be larger than the filesize
> >  # due to noload sections, e.g. bss.
> >  function get_image_size()
> > @@ -505,9 +541,24 @@ function add_size()
> >          size=${image_size}
> >      fi
> >  
> > -    memaddr=$(( $memaddr + $size + $offset - 1))
> > -    memaddr=$(( $memaddr & ~($offset - 1) ))
> > -    memaddr=`printf "0x%X\n" $memaddr`
> > +    # Try to place the file at the first available space...
> > +    local new_memaddr=$(( (memaddr + size + offset - 1) & ~(offset - 1) ))
> > +
> > +    # ...then check if it overlaps with any reserved space
> > +    for reserved_space in "${RESERVED_MEM_SPACES[@]}"; do
> > +        local reserved_start=${reserved_space%,*}
> > +        local reserved_size=${reserved_space#*,}
> > +        local reserved_end=$((reserved_start + reserved_size))
> > +
> > +        if [[ $new_memaddr -le $reserved_end ]] && \
> > +           [[ $((new_memaddr + size)) -ge $reserved_start ]]; then
> > +            # In that case, place the file at the next available space
> > +            # after the reserved one
> > +            new_memaddr=$(( (reserved_end + offset) & ~(offset - 1) ))
> > +        fi
> > +    done
> > +
> > +    memaddr=$(printf "0x%X\n" $new_memaddr)
> >      filesize=$size
> >  }
> >  
> > @@ -1373,6 +1424,8 @@ uboot_addr=$memaddr
> >  memaddr=$(( $memaddr + $offset ))
> >  memaddr=`printf "0x%X\n" $memaddr`
> >  
> > +fill_reserved_spaces_from_dtb
> > +
> >  if test "$os" = "xen"
> >  then
> >      xen_file_loading
> > -- 
> > 2.25.1
> > 
> 

