Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B7B749FDA2
	for <lists+xen-devel@lfdr.de>; Fri, 28 Jan 2022 17:08:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.262095.454180 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nDTmp-0006Zb-4x; Fri, 28 Jan 2022 16:07:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 262095.454180; Fri, 28 Jan 2022 16:07:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nDTmp-0006Xb-1k; Fri, 28 Jan 2022 16:07:43 +0000
Received: by outflank-mailman (input) for mailman id 262095;
 Fri, 28 Jan 2022 16:07:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=i1b2=SM=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1nDTmo-0006XV-Er
 for xen-devel@lists.xenproject.org; Fri, 28 Jan 2022 16:07:42 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 69fa331e-8054-11ec-8eb8-a37418f5ba1a;
 Fri, 28 Jan 2022 17:07:40 +0100 (CET)
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
X-Inumbo-ID: 69fa331e-8054-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1643386060;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=S1nhx64OKYyVQEv92E+rfDdVEL60qDliMuqhbZ7LC00=;
  b=Kvx78nkJKQsauJX4uPfdDK55AirTqBLo96Wztvo8bN1RVeQ0FD3EYSL6
   WoqVdjDldRU9FkgicYf7exPvenx6li0Sjgfm+T25XU9EVHZ1QTA7QrbGr
   LG5JO2ayW89tBwVnCPzA630HjiPYqkhcIQFHadZDR1i7Qge63L/IwP8R9
   0=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: o8VY+dRwdqg3H2T9qp94o1LwbDKI7gP3W+HobQv3CXR+ak+42Ukb0drpy3hRYraG7HEx1tQteC
 VMpI2Y25QEoHgQymhQQOT4a0nTkWb4N4iyBPrp4r2VBTlEm8psRG9/KC0E1y2uY+PG8Lt8kBAd
 LhLMhoIyjWW7+5MIYDq643YkTW9KfLO3TUTTrXs+ZSzW7zbSdQUi8f/pWAf2AnvHX+KgqqJQIq
 3WSP3q1YzYS2TXAa/qaiqG4Su7XlLDwmV3nSP7Ivx9pYF1uBRv+BIOQNZuCTYWHbzmFOSGf9qg
 tjYJkhALTLOXhbUH6RWjhrxF
X-SBRS: 5.2
X-MesageID: 65175340
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:SHuNgqx/dzBAA8wR0h56t+ebwSrEfRIJ4+MujC+fZmUNrF6WrkUCz
 TBKDzzVOf/eYzfyL9x2YN/i/B9T6MLSx9VnHgY+rCAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnvopW1TYhSEUOZugH9IQM8aZfHAhLeNYYH1500g7wrRp2tIAbeWRWGthh
 /uj+6UzB3f9s9JEGjp8B3Wr8U4HUFza4Vv0j3RmDRx5lAa2e0o9VfrzEZqZPXrgKrS4K8bhL
 wr1IBNVyUuCl/slIovNfr8W6STmSJaKVeSFoiI+t6RPHnGuD8H9u0o2HKN0VKtZt9mGt9VI7
 dthmp6ccj44I5KdisAtfhsBTj4raMWq+JefSZS+mcmazkmAeHrw2fR+SkoxOOX0+M4uXzsIr
 6ZBbmlQMFbT3Ipaw5riIgVors0lMMnsOpJZonx6xCvVJf0nXYrCU+PB4towMDIY2J0XQquFO
 5JxhTxHUjPuUgFNF28sD8w1pMy6nFDedWdgtwfAzUYwyzeKl1EguFT3C/LJc9mDXu1JnUKVo
 G3X8mC/CRYfXPSH0Tuf+Xuoj+XStSn6RI4fGrC++vNwxlaUwwQ7ARwNXFq/qNGzi1KyVtxSL
 UAZ4Gwlqq1a3FSiU93VTxC+5nmesXY0WdBdDuk74wGl0bfP7kCSAW1sZi5MbpkqudE7QRQu1
 0SVhJX5CDp3qrqXRHmBsLCOoluaJiw9PWIEIygeQmM4D8LL+d9pyEiVF5A6TfDz3oad9SzML
 y6iqREbiZk8j+Iw7rSmwgHVpwKBpMGUUVtgjunIZV6N4gR8bY+jQoWn71nH8PpNRLqkokm9U
 GsswJbHsr1XZX2ZvGnUGbhWQun1jxqQGGCE2TZS848dGyNBEpJJVaRZ+3lAKUhgKa7okhe5M
 RaI6Wu9CHK+VUZGjJObgarsU6zGLoC6TLwJs8w4iPIUP/CdkyfcpElTiba4hTyFraTVufhX1
 W2nWcitF20GLq9s0SC7QewQuZdymHxlnziLHs6ml0n2uVZ7WJJzYe1bWLdpRrthhJ5oXS2Pq
 4oPXyd040s3vBLCjtn/rtdIcAFiwYkTDpHqsc1HHtNv0SI9cFzN/8T5mOt7E6Q8xvw9vr6Ro
 hmVBxEEoHKi2yyvAVjaOxhLNeK0Nb4i/C1TAMDZFQvys5TVSdzxvP53mlpeVeRPydGPOtYtE
 aFdJZ3cU6seItkFkhxEBaTAQEVZXEzDrWqz0+CNOlDTprZsGF7E/MHKZAzq+HVcBya7r5Jm8
 bahyhnaUdwIQAE7VJTab/emzlWQu3kBmb0tAxuUc4cLIEi8opJ3LyHRj+MsJ51eIxv02TbHh
 R2dBg0VpLeRrtZtosXJn62Ns6ygD/B6QhhBB2De4LvvbXva82OvzJVuSuGNeTyBBmr49L/7P
 bdezu3mMe1Bl1FP6tIuH7FuxKM4xt3uu74FkVg0QCSVNwymU+oyLGOH0M9Dsrx26oVY4QbmC
 FiS/tR6OKmSPJ+3GlAmOwd4PP+I0usZm2eO4K1tcln6/iJ+4JGOTV5WY0uXkCVYIbZ4bNElz
 OMmtJJE4gCzkEN3YNOPjyQS/GWQNH0QFa4gs8hCUoPsjwMqzHBEYIDdVXCqsM3eNY0UPxl4O
 CKQiYrDm69YlxjLfHcEHHTQ2fZQ2MYVsxdQwV5ef1mEl7IpXBPsMMG9Jdjvcjlo8w==
IronPort-HdrOrdr: A9a23:EvbWzKEVPbKB5RBqpLqE6seALOsnbusQ8zAXP0AYc31om+ij5q
 eTdZUgpHvJYVkqNE3I9eruBEDEewK7yXcX2/h1AV7BZniEhILAFugLhuGO/9SjIVydygc079
 YYT0EUMr3N5DZB4/rH3A==
X-IronPort-AV: E=Sophos;i="5.88,324,1635220800"; 
   d="scan'208";a="65175340"
Date: Fri, 28 Jan 2022 16:07:33 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, Roger Pau
 =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Paul Durrant <paul@xen.org>, Tamas K Lengyel
	<tamas@tklengyel.com>, Petre Pircalabu <ppircalabu@bitdefender.com>,
	Alexandru Isaila <aisaila@bitdefender.com>
Subject: Re: [PATCH v3 1/2] IOMMU/x86: disallow device assignment to PoD
 guests
Message-ID: <YfQUxVUEEPuQzewP@perard>
References: <6fe7b036-2bdb-b391-4e6c-1b5d7e05a119@suse.com>
 <b0a77526-17f2-a5ab-6f7f-1b3caeb4a59b@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <b0a77526-17f2-a5ab-6f7f-1b3caeb4a59b@suse.com>

On Tue, Jan 04, 2022 at 10:41:32AM +0100, Jan Beulich wrote:
> While it is okay for IOMMU page tables to get set up for guests starting
> in PoD mode, actual device assignment may only occur once all PoD
> entries have been removed from the P2M. So far this was enforced only
> for boot-time assignment, and only in the tool stack.
> 
> Also use the new function to replace p2m_pod_entry_count(): Its unlocked
> access to p2m->pod.entry_count wasn't really okay (irrespective of the
> result being stale by the time the caller gets to see it).
> 
> To allow the tool stack to see a consistent snapshot of PoD state, move
> the tail of XENMEM_{get,set}_pod_target handling into a function, adding
> proper locking there.
> 
> In libxl take the liberty to use the new local variable r also for a
> pre-existing call into libxc.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

