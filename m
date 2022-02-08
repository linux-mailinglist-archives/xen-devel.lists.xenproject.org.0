Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD0E74AD5D5
	for <lists+xen-devel@lfdr.de>; Tue,  8 Feb 2022 11:51:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.268125.461920 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHO60-0005LD-PH; Tue, 08 Feb 2022 10:51:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 268125.461920; Tue, 08 Feb 2022 10:51:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHO60-0005JL-Le; Tue, 08 Feb 2022 10:51:40 +0000
Received: by outflank-mailman (input) for mailman id 268125;
 Tue, 08 Feb 2022 10:51:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JWzo=SX=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1nHO5z-0005J1-Mx
 for xen-devel@lists.xenproject.org; Tue, 08 Feb 2022 10:51:39 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 16273b4a-88cd-11ec-8eb8-a37418f5ba1a;
 Tue, 08 Feb 2022 11:51:38 +0100 (CET)
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
X-Inumbo-ID: 16273b4a-88cd-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1644317498;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ox0uNlqHW4ULvVZYBBjZXTM1qA4YfXL7QBaxKxHfwUg=;
  b=MQsGPUACwNZUBwHB92lji5X0aB1CNkgqV4KvXBqOEkLcQE0VkS0d9FbC
   bafKMu0yeIOjRVdjOqFtyiiFrWhnTiQzmwK3jl6njsJolIQJVl0vhAU2P
   G3/SR7sKGCKz/GV1L/geSBcEiM+7UCXKl82boBwQonucinnn/J7gpHzIc
   w=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: xe/G4h5WK2pJSUywLkEIJifiuyN5LNkPvpPaPx6w3QHE5afocw5OCYXMUmm09ZCH9cU4KnJAlz
 zqxr6lateR2+JqUHR5Y2/oF4JR/Ts3ny6No6XT5DZNO3hhVolnM1X6tYjOGn6UHdf2HEgBoAsY
 UDyv9ssRCfGo9it0hU11egemsVkXfr5mf71oBHp/khc7OhStFlhfr4vivSdiNOTPm1LOipfpo5
 U7YGlYrQeVo+iS1UnckdreqnC2ok4afvEDie5HVmlci/63rDDqS0RcUMM0A1T/DQnAwsyQ9AHr
 CeCTLWgHwohtRXRvy2VheOQt
X-SBRS: 5.1
X-MesageID: 64125637
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:MCVtD6wyY2dsL0zzDhp6t+fxwSrEfRIJ4+MujC+fZmUNrF6WrkUFy
 TYaWWCCOqzfYjOkLdsjO46+80sPsJfdxt5hSVFl/iAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnvopW1TYhSEUOZugH9IQM8aZfHAhLeNYYH1500g7wbZp2tcAbeWRWGthh
 /uj+6UzB3f9s9JEGjp8B3Wr8U4HUFza4Vv0j3RmDRx5lAa2e0o9VfrzEZqZPXrgKrS4K8bhL
 wr1IBNVyUuCl/slIovNfr8W6STmSJaKVeSFoiI+t6RPHnGuD8H9u0o2HKN0VKtZt9mGt/826
 vVnqJ6Vcx0oB/LFoPlNT1p+MxgraMWq+JefSZS+mcmazkmAeHrw2fR+SkoxOOX0+M4uXzsIr
 6ZBbmlQMFbT3Ipaw5riIgVors0lMMnsOpJZonx6xCvVJf0nXYrCU+PB4towMDIY2JwXR6uAP
 JVxhTxHMAyYX0FMHVorFr0Os+WsvGGhXGcCkQfAzUYwyzeKl1EguFT3C/LKfvSaSMMTmVyXz
 krW8mK8DhwEOdi3zTue7mnqluLJhTn8Wo8ZCPu/7PECqF+c3GsIEzUNSEC25/K+jyaDt8l3c
 hJOvHB09O5rqRLtHoKVswCETGCskVk+e/BNEcgA8gC0laPs/laFRU4kd2sUADA5j/MeSTsv3
 16PutrmAz1zrbGYIU6gGqeoQSCaYnZMczJbDcMQZU5cuoS4/tlv5v7aZos7SMaIYsvJ9SYcK
 txghAw3nP0tgMECzM1XFniX0mv39vAlouPYjzg7v15JDCskPuZJhKTysDA3CMqsy67DHzG8U
 IAswZT20Qz3JcjleNaxaOsMBqq1wP2OLSfRh1Vid7F4qWjxoi/6JN4BumglTKuMDirjUWW4C
 HI/RCsLvMMDVJdURfMfj32N5zQCkvG7SIWNugH8ZdtSeJlhHDJrDwk1DXN8K1vFyRB2+YlmY
 M/zWZ/1UR4yVPQ2pBLrFrx1+eJ6mUgWmziJLbillEvP7FZrTCPMIVvzGADVNb5RAWLtiFi9z
 uuzwOPQk0oGC7ClMnCMmWPRRHhTRUUG6VnNg5Q/Xoa+zsBOQwnN0tfdnuEsfZJLhaNQmrua9
 32xQBYAmlH+mWfGOUOBbXU6MOHjWpN2rHQaOy0wPAn3hyh/MNj3tKpPJYEqebQH9fB4yaImR
 fcyZMjdUO9ETS7K+mpBYMCl/pBibhmimSmHIzGhPGokZ5dlSgGQoo3kcwLj+TMgFC2yscdi8
 bSs2hmCGcgIRhh4DdaQY/WqlgvjsX8YkeN0fk3JPtgMJxm8rNk0c3T816ZlLdsNJBPPwiqh+
 zyXWRpI9/PQp4IV8cXSgfzWpYmeDOYjTFFRGHPW7OjqOHCCrHaj24JJTM2BYSvZCDHv4Kyna
 OhYk6P8PfkAkAoYuoZwCe82n6c35t+prL5G1AV0Wn7Mag3zWL9nJ3CH2+hJt7FMmeAF6VfnB
 BrX94kII6iNNePkDEUVdVgsYem03P0JniXfsKYuK0Lg6S4rpLeKXC2+5fVXZPCx+FetDL4Y/
 A==
IronPort-HdrOrdr: A9a23:9wssiqq4ZPUXPZ0CcdR9iTkaV5oreYIsimQD101hICG8cqSj+f
 xGuM5rsSMc6QxhPU3I9ursBEDtex/hHNtOkO4s1NSZLWvbUQmTTL2KhLGKq1aLJ8S9zJ8/6U
 4JSdkZNDSaNzlHZKjBjzWFLw==
X-IronPort-AV: E=Sophos;i="5.88,352,1635220800"; 
   d="scan'208";a="64125637"
Date: Tue, 8 Feb 2022 10:51:32 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Juergen Gross <jgross@suse.com>
CC: <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v3 5/5] tools/include: remove xen-external directory
Message-ID: <YgJLNHd9v7+FJIoW@perard.uk.xensource.com>
References: <20220208070638.5909-1-jgross@suse.com>
 <20220208070638.5909-6-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220208070638.5909-6-jgross@suse.com>

On Tue, Feb 08, 2022 at 08:06:38AM +0100, Juergen Gross wrote:
> There is no user of tools/include/xen-external/* left. Remove it.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Acked-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

