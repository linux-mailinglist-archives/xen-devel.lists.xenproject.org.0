Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39C243FF002
	for <lists+xen-devel@lfdr.de>; Thu,  2 Sep 2021 17:21:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.177327.322709 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLoVY-0006wf-Rk; Thu, 02 Sep 2021 15:20:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 177327.322709; Thu, 02 Sep 2021 15:20:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLoVY-0006rp-NL; Thu, 02 Sep 2021 15:20:04 +0000
Received: by outflank-mailman (input) for mailman id 177327;
 Thu, 02 Sep 2021 15:20:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+wyV=NY=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mLoVW-0006a7-UF
 for xen-devel@lists.xenproject.org; Thu, 02 Sep 2021 15:20:02 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3d1e1c10-0c01-11ec-ae7d-12813bfff9fa;
 Thu, 02 Sep 2021 15:20:00 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id A9BF96023F;
 Thu,  2 Sep 2021 15:19:59 +0000 (UTC)
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
X-Inumbo-ID: 3d1e1c10-0c01-11ec-ae7d-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1630595999;
	bh=zBOKCPFNms5m2rbidR117XlvEpQMb/G1xiLl/tUDypQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=bI6VUHcBYp+Ke4KVgkZXS1diLy7T43k2Z6YTD+AnFAItvVCel2R4Ac4kYHhBFYc/2
	 LKz3CYU2jiQLSeiBjtU/vIFdC20uvEK+qNB1qkvitDMy4r68FD9rrhaeMZe92YHih1
	 cS3Qyx9S2imtwS5/YPfdXdOiR+ib0IeTWtAc7CKwS8uUWoVVkQJ0KjKH5vGHMN6P/L
	 MGovG3SyCOL/nDXJ04mpDuzA2/tZRSg20f3jjUC3G9GZRDwMpBqYcQurcfmx4TM0b8
	 HDxhg4XXygwbhbg6F8dNQz+CDqG/V796vnWSK0Z725xpPOKEGQB0V0MQfPMEiV5FPR
	 sJSWv5s7Yjg4Q==
Date: Thu, 2 Sep 2021 08:19:59 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Wei Chen <Wei.Chen@arm.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    "julien@xen.org" <julien@xen.org>, 
    Bertrand Marquis <Bertrand.Marquis@arm.com>
Subject: RE: [XEN RFC PATCH 24/40] xen/arm: introduce a helper to parse device
 tree NUMA distance map
In-Reply-To: <DB9PR08MB68572F556DB52ADCA4DA07349ECE9@DB9PR08MB6857.eurprd08.prod.outlook.com>
Message-ID: <alpine.DEB.2.21.2109020816120.17925@sstabellini-ThinkPad-T480s>
References: <20210811102423.28908-1-wei.chen@arm.com> <20210811102423.28908-25-wei.chen@arm.com> <alpine.DEB.2.21.2108301740500.17851@sstabellini-ThinkPad-T480s> <DB9PR08MB685715E39333597911BAB6FD9ECC9@DB9PR08MB6857.eurprd08.prod.outlook.com>
 <alpine.DEB.2.21.2108311428040.18862@sstabellini-ThinkPad-T480s> <DB9PR08MB6857F9954D269AE5EC45093B9ECD9@DB9PR08MB6857.eurprd08.prod.outlook.com> <alpine.DEB.2.21.2109010920220.17925@sstabellini-ThinkPad-T480s>
 <DB9PR08MB68572F556DB52ADCA4DA07349ECE9@DB9PR08MB6857.eurprd08.prod.outlook.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-2029384931-1630595860=:17925"
Content-ID: <alpine.DEB.2.21.2109020819020.17925@sstabellini-ThinkPad-T480s>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-2029384931-1630595860=:17925
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.21.2109020819021.17925@sstabellini-ThinkPad-T480s>

On Thu, 2 Sep 2021, Wei Chen wrote:
> Hi Stefano,
> 
> > -----Original Message-----
> > From: Stefano Stabellini <sstabellini@kernel.org>
> > Sent: 2021年9月2日 0:22
> > To: Wei Chen <Wei.Chen@arm.com>
> > Cc: Stefano Stabellini <sstabellini@kernel.org>; xen-
> > devel@lists.xenproject.org; julien@xen.org; Bertrand Marquis
> > <Bertrand.Marquis@arm.com>
> > Subject: RE: [XEN RFC PATCH 24/40] xen/arm: introduce a helper to parse
> > device tree NUMA distance map
> > 
> > On Wed, 1 Sep 2021, Wei Chen wrote:
> > > Hi Stefano,
> > >
> > > > -----Original Message-----
> > > > From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf Of
> > > > Stefano Stabellini
> > > > Sent: 2021年9月1日 5:36
> > > > To: Wei Chen <Wei.Chen@arm.com>
> > > > Cc: Stefano Stabellini <sstabellini@kernel.org>; xen-
> > > > devel@lists.xenproject.org; julien@xen.org; Bertrand Marquis
> > > > <Bertrand.Marquis@arm.com>
> > > > Subject: RE: [XEN RFC PATCH 24/40] xen/arm: introduce a helper to
> > parse
> > > > device tree NUMA distance map
> > > >
> > > > On Tue, 31 Aug 2021, Wei Chen wrote:
> > > > > Hi Stefano,
> > > > >
> > > > > > -----Original Message-----
> > > > > > From: Stefano Stabellini <sstabellini@kernel.org>
> > > > > > Sent: 2021年8月31日 8:48
> > > > > > To: Wei Chen <Wei.Chen@arm.com>
> > > > > > Cc: xen-devel@lists.xenproject.org; sstabellini@kernel.org;
> > > > julien@xen.org;
> > > > > > jbeulich@suse.com; Bertrand Marquis <Bertrand.Marquis@arm.com>
> > > > > > Subject: Re: [XEN RFC PATCH 24/40] xen/arm: introduce a helper to
> > > > parse
> > > > > > device tree NUMA distance map
> > > > > >
> > > > > > On Wed, 11 Aug 2021, Wei Chen wrote:
> > > > > > > A NUMA aware device tree will provide a "distance-map" node to
> > > > > > > describe distance between any two nodes. This patch introduce a
> > > > > > > new helper to parse this distance map.
> > > > > > >
> > > > > > > Signed-off-by: Wei Chen <wei.chen@arm.com>
> > > > > > > ---
> > > > > > >  xen/arch/arm/numa_device_tree.c | 67
> > > > +++++++++++++++++++++++++++++++++
> > > > > > >  1 file changed, 67 insertions(+)
> > > > > > >
> > > > > > > diff --git a/xen/arch/arm/numa_device_tree.c
> > > > > > b/xen/arch/arm/numa_device_tree.c
> > > > > > > index bbe081dcd1..6e0d1d3d9f 100644
> > > > > > > --- a/xen/arch/arm/numa_device_tree.c
> > > > > > > +++ b/xen/arch/arm/numa_device_tree.c
> > > > > > > @@ -200,3 +200,70 @@ device_tree_parse_numa_memory_node(const
> > void
> > > > *fdt,
> > > > > > int node,
> > > > > > >
> > > > > > >      return 0;
> > > > > > >  }
> > > > > > > +
> > > > > > > +/* Parse NUMA distance map v1 */
> > > > > > > +int __init
> > > > > > > +device_tree_parse_numa_distance_map_v1(const void *fdt, int
> > node)
> > > > > > > +{
> > > > > > > +    const struct fdt_property *prop;
> > > > > > > +    const __be32 *matrix;
> > > > > > > +    int entry_count, len, i;
> > > > > > > +
> > > > > > > +    printk(XENLOG_INFO "NUMA: parsing numa-distance-map\n");
> > > > > > > +
> > > > > > > +    prop = fdt_get_property(fdt, node, "distance-matrix", &len);
> > > > > > > +    if ( !prop )
> > > > > > > +    {
> > > > > > > +        printk(XENLOG_WARNING
> > > > > > > +               "NUMA: No distance-matrix property in distance-
> > > > map\n");
> > > > > > > +
> > > > > > > +        return -EINVAL;
> > > > > > > +    }
> > > > > > > +
> > > > > > > +    if ( len % sizeof(uint32_t) != 0 )
> > > > > > > +    {
> > > > > > > +        printk(XENLOG_WARNING
> > > > > > > +               "distance-matrix in node is not a multiple of
> > > > u32\n");
> > > > > > > +        return -EINVAL;
> > > > > > > +    }
> > > > > > > +
> > > > > > > +    entry_count = len / sizeof(uint32_t);
> > > > > > > +    if ( entry_count <= 0 )
> > > > > > > +    {
> > > > > > > +        printk(XENLOG_WARNING "NUMA: Invalid distance-
> > matrix\n");
> > > > > > > +
> > > > > > > +        return -EINVAL;
> > > > > > > +    }
> > > > > > > +
> > > > > > > +    matrix = (const __be32 *)prop->data;
> > > > > > > +    for ( i = 0; i + 2 < entry_count; i += 3 )
> > > > > > > +    {
> > > > > > > +        uint32_t from, to, distance;
> > > > > > > +
> > > > > > > +        from = dt_read_number(matrix, 1);
> > > > > > > +        matrix++;
> > > > > > > +        to = dt_read_number(matrix, 1);
> > > > > > > +        matrix++;
> > > > > > > +        distance = dt_read_number(matrix, 1);
> > > > > > > +        matrix++;
> > > > > > > +
> > > > > > > +        if ( (from == to && distance != NUMA_LOCAL_DISTANCE) ||
> > > > > > > +            (from != to && distance <= NUMA_LOCAL_DISTANCE) )
> > > > > > > +        {
> > > > > > > +            printk(XENLOG_WARNING
> > > > > > > +                   "Invalid nodes' distance from node#%d to
> > node#%d
> > > > > > = %d\n",
> > > > > > > +                   from, to, distance);
> > > > > > > +            return -EINVAL;
> > > > > > > +        }
> > > > > > > +
> > > > > > > +        printk(XENLOG_INFO "NUMA: distance from node#%d to
> > node#%d
> > > > > > = %d\n",
> > > > > > > +               from, to, distance);
> > > > > > > +        numa_set_distance(from, to, distance);
> > > > > > > +
> > > > > > > +        /* Set default distance of node B->A same as A->B */
> > > > > > > +        if (to > from)
> > > > > > > +             numa_set_distance(to, from, distance);
> > > > > >
> > > > > > I am a bit unsure about this last 2 lines: why calling
> > > > numa_set_distance
> > > > > > in the opposite direction only when to > from? Wouldn't it be OK
> > to
> > > > > > always do both:
> > > > > >
> > > > > > numa_set_distance(from, to, distance);
> > > > > > numa_set_distance(to, from, distance);
> > > > > >
> > > > > > ?
> > > > > >
> > > > > I borrowed this code from Linux, but here is my understanding:
> > > > >
> > > > > First, I read some notes in
> > Documentation/devicetree/bindings/numa.txt
> > > > > 1. Each entry represents distance from first node to second node.
> > > > > The distances are equal in either direction.
> > > > > 2. distance-matrix should have entries in lexicographical ascending
> > > > > order of nodes.
> > > > >
> > > > > Here is an example of distance-map node in DTB:
> > > > > Sample#1, full list:
> > > > > 		distance-map {
> > > > > 			 compatible = "numa-distance-map-v1";
> > > > > 			 distance-matrix = <0 0  10>,
> > > > > 					   <0 1  20>,
> > > > > 					   <0 2  40>,
> > > > > 					   <0 3  20>,
> > > > > 					   <1 0  20>,
> > > > > 					   <1 1  10>,
> > > > > 					   <1 2  20>,
> > > > > 					   <1 3  40>,
> > > > > 					   <2 0  40>,
> > > > > 					   <2 1  20>,
> > > > > 					   <2 2  10>,
> > > > > 					   <2 3  20>,
> > > > > 					   <3 0  20>,
> > > > > 					   <3 1  40>,
> > > > > 					   <3 2  20>,
> > > > > 					   <3 3  10>;
> > > > > 		};
> > > > >
> > > > > Call numa_set_distance when "to > from" will prevent Xen to call
> > > > > numa_set_distance(0, 1, 20) again when it's setting distance for <1
> > 0
> > > > 20>.
> > > > > But, numa_set_distance(1, 0, 20) will be call twice.
> > > > >
> > > > > Normally, distance-map node will be optimized in following sample#2,
> > > > > all redundant entries are removed:
> > > > > Sample#2, partial list:
> > > > > 		distance-map {
> > > > > 			 compatible = "numa-distance-map-v1";
> > > > > 			 distance-matrix = <0 0  10>,
> > > > > 					   <0 1  20>,
> > > > > 					   <0 2  40>,
> > > > > 					   <0 3  20>,
> > > > > 					   <1 1  10>,
> > > > > 					   <1 2  20>,
> > > > > 					   <1 3  40>,
> > > > > 					   <2 2  10>,
> > > > > 					   <2 3  20>,
> > > > > 					   <3 3  10>;
> > > > > 		};
> > > > >
> > > > > There is not any "from > to" entry in the map. But using this
> > partial
> > > > map
> > > > > still can set all distances for all pairs. And numa_set_distance(1,
> > 0,
> > > > 20)
> > > > > will be only once.
> > > >
> > > > I see. I can't find in Documentation/devicetree/bindings/numa.txt
> > where
> > > > it says that "from > to" nodes can be omitted. If it is not written
> > > > down, then somebody could easily optimize it the opposite way:
> > > >
> > > >  			 distance-matrix = <0 0  10>,
> > > >  					   <1 0  20>,
> > > >  					   <2 0  40>,
> > > >  					   <3 0  20>,
> > > >  					   <1 1  10>,
> > > >  					   <2 1  20>,
> > > >  					   <3 1  40>,
> > > >  					   <2 2  10>,
> > > >  					   <3 2  20>,
> > > >  					   <3 3  10>;
> > > >
> > >
> > > Yes, you're right. Spec doesn't say opposite way is unallowed.
> > >
> > > > I think the code in Xen should be resilient and able to cope with a
> > > > device tree like the one you wrote or the one I wrote. From a code
> > > > perspective, it should be very easy to do. If nothing else it would
> > make
> > > > Xen more resilient against buggy firmware.
> > > >
> > > >
> > >
> > > I don't disagree with that.
> > >
> > > > > > But in any case, I have a different suggestion. The binding states
> > > > that
> > > > > > "distances are equal in either direction". Also it has an example
> > > > where
> > > > > > only one direction is expressed unfortunately (at the end of the
> > > > > > document).
> > > > > >
> > > > >
> > > > > Oh, I should see this comment first, then I will not post above
> > > > > comment : )
> > > > >
> > > > > > So my suggestion is to parse it as follows:
> > > > > >
> > > > > > - call numa_set_distance just once from
> > > > > >   device_tree_parse_numa_distance_map_v1
> > > > > >
> > > > > > - in numa_set_distance:
> > > > > >     - set node_distance_map[from][to] = distance;
> > > > > >     - check node_distance_map[to][from]
> > > > > >           - if unset, node_distance_map[to][from] = distance;
> > > > > >           - if already set to the same value, return success;
> > > > > >           - if already set to a different value, return error;
> > > > >
> > > > > I don't really like this implementation. I want the behavior of
> > > > > numa_set_distance just like the function name, do not include
> > > > > implicit operations. Otherwise, except the user read this function
> > > > > implementation before he use it, he probably doesn't know this
> > > > > function has done so many things.
> > > >
> > > > You can leave numa_set_distance as-is without any implicit operations.
> > > >
> > > > In that case, just call numa_set_distance twice from numa_set_distance
> > > > for both from/to and to/from. numa_set_distance could return error is
> > >
> > > I am OK for the first sentence. But...
> > >
> > > > the entry was already set to a different value or success otherwise
> > > > (also in the case it was already set to the same value). This would
> > >
> > > ... I prefer not to check the previous value. Subsequent
> > numa_set_distance
> > > call will override previous calls. Keep numa_set_distance as simple as
> > > it can. And when you pass new data to numa_set_distance, it doesn't
> > > know whether the previous data was correct or the new data is correct.
> > > Only caller may have known.
> > 
> > That might be OK but if not numa_set_distance then somebody else needs
> > to check against overwriting previous values. That is to be able to spot
> > bad device tree cases like:
> > 
> >   0 1 20
> >   1 0 40
> 
> 
> How about we check it still in NUMA distance parse function?
> Before setting the numa_set_distance for one pair nodes (e.g. a -> b),
> we can get its opposite way distance first.
> 
> distance_b_a = __node_distance(b, a); ==> get opposite way distance.
> if (distance_b_a == 0) ==> opposite way distance has not been set
> {
>     numa_set_distance(a, b, 20); ==> set both
>     numa_set_distance(b, a, 20)
> } else {
>     if (distance_b_a == 20) ==> opposite way distance has been set
>        numa_set_distance(a, b, 20); ==> set this way only
>     else ===> opposite way distance has been set, but is unmatched
>        // What can we do here?
>        Panic the system? or Just warning users? Or choose the bigger
>        distance for both ways?
>        
>        And distance_b_a == NUMA_NO_DISTANCE would be a special case
>        here.
> }

Yes, I think something like this would work. If we detect an error in
device tree I would probably print a warning and disable NUMA. It would
also be acceptable to panic.
--8323329-2029384931-1630595860=:17925--

