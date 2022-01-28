Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5649749F802
	for <lists+xen-devel@lfdr.de>; Fri, 28 Jan 2022 12:13:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.261949.453862 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nDPBQ-0001D5-Nx; Fri, 28 Jan 2022 11:12:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 261949.453862; Fri, 28 Jan 2022 11:12:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nDPBQ-0001Au-Kv; Fri, 28 Jan 2022 11:12:48 +0000
Received: by outflank-mailman (input) for mailman id 261949;
 Fri, 28 Jan 2022 11:12:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=i1b2=SM=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1nDPBP-0001Ao-IL
 for xen-devel@lists.xenproject.org; Fri, 28 Jan 2022 11:12:47 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 32abf890-802b-11ec-8eb8-a37418f5ba1a;
 Fri, 28 Jan 2022 12:12:45 +0100 (CET)
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
X-Inumbo-ID: 32abf890-802b-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1643368365;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Hi0X0gqQtp0aUUIkI7+NkQoHa6l3pTPoLgVoG5UVM1c=;
  b=bXeCqogoAEqzMiShG344/yBjPp0Fd+2a1/88h/SR05Nn27mJv1eNsG2E
   SXpuc3YJgEaOH63N9pTnDvNqwlvH/8uflf169AnaShEJcIm3pW94abTnx
   Pgne/iUQf7NuYdloTOhZieb/bYm9lkPit8nTdGtJknkD0zK1vurOtFVhc
   g=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: XcUHZ6w6WhlnFR6mIDe/aRXhtJl2m3EhNhUHJtgYYlcZx5InAFZzrDiSelWIFIwg4LNG4ceDhl
 bqGgThoj8ezwtdna3boEpGx33hTEWsSQY1DamXNeDvARQVOF8oXmzCO8dIPF8ZoN3PmU302nL/
 BP52/tAAHFhh961DLna7KlKFjQRBtJjNl9exbwXxYVlCI5mhOkLw8bEUrtQA95ifNb/AquDWvE
 U2qNXiG0JHoZvBhEZr0ymV5tJAlZBmK68qgVvUcdpN2JXKrRaoazF3q9y+NEk8r7URpDWuQFY/
 ArEcqecaXJQhM3nMwzfk9GHL
X-SBRS: 5.2
X-MesageID: 63381032
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:8jCpSKtWEIYeNV8qlsW2jOkusufnVKVZMUV32f8akzHdYApBsoF/q
 tZmKT2Ga/nfNmT1LtwjYNvg9RtQvcWDn4RiHVNl/ChnQX9H+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZQP0VOZigHtIQMsadUsxKbVIiGHdJZS5LwbZj2NYx24jhWGthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 Npl6IeoZyIxF/X1h9teaRRyOj5xZoRp0eqSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DNYUDunZm3HfBAOwvW5zrSKTW/95Imjw3g6iiGN6AP
 JFJMGI0NnwsZTVdIVUaDoI9kN2h3EvzUQx3sHySi5Iotj27IAtZj+G2bYu9lsaxbdpRtlaVo
 CTB5WuRKhMVLtuE0hKe72mhwOTImEvTWowfFLm5+dZxnUaegGcUDXU+WVWyrva4jUq/c8lCM
 EFS8S0rxYAi+UruQtTjUhmQpH+fogVaS9dWC/c96gyG1uzT+QnxO4QfZmcfMpp87pZwHGF0k
 A/S9z/0OdBxmOCOUVy47p7MlCyNehIYB0YdanQtYiJQtrEPv7oPph7IS99iFou8gdv0BSz8z
 li2kcQuu1kApZVVjvvmpDgrlxrp/8GUFVBtum07S0r4tlsRWWKzW2C/BbE3B95kJZ3RcFSOt
 WNsdyO2vLFXVsHleMBgrYww8FCVCxStbWW0bb1HRcBJG9GRF5iLJ904DNZWfx8BDyr8UWW1C
 HI/QCsIjHOpAFOkbLVsf6W6ANkwwK7rGLzND66INYAVOsMvKVfarUmCgHJ8OUi3ziDAdolkY
 f+mnTuEVy5GWcyLMhLoLwvi7VPb7n9nnj6CLXwK5x+mzaCfdBaopUQtazOzghQCxPrc+m39q
 o8HX+PTkkk3eLCgPkH/rNBCRXhXfSlTLc2n8KR/K7/cSjeK7Ul8UZc9N5t7Jdw890mU/8+Vl
 kyAtrhwkQqm2iafeFzUMxiOqtrHBP5CkJ7yBgR0VX7A5pTpSdz2hEvGX5doL7Qh6sJ5yvt4E
 6sMd8maW6wdQTXb4TUNK5L6qdU6JhisgAuPOQujYSQ+IME8F1CYpIe8c1u97jQKAwq2qdA6/
 ++q2DTETMdRXA9lFsvXNq6ilgvjoXgHletudELUOd0PKl70+Y1nJnWp3P86Ks0BMzvZwT6e2
 1rECBsUv7CV8YQ07MPIleaPqILwS7lyGU9THm/667eqNHaFojr/kNEYCOvRJGLTTmL5/qmmd
 N559fCkPa1VhktOvqp9D61vkfA06ezwquII1Q9jBnjKMQimU+syPnmc0MBTnaRR3bsF6xCuU
 0eC99QGa7WEPMTpTAwYKAY/N7nR0PgVnn/Z7OgvIVW87yhypeLVXUJXNhiKqSpcMLoqb991n
 bZ/4JYbu16llx4nEtealSQFpW2DI0sJX7gjqpxHUpTgjRAmyw0abJHRYsMsDEpjtzmY3pEWH
 wKp
IronPort-HdrOrdr: A9a23:MS89R6P50KPhacBcTsOjsMiBIKoaSvp037Eqv3oRdfVwSL3+qy
 nOpoV+6faaslossR0b9uxofZPwJ080lqQFhLX5X43SPzUO0VHAROoJgLcKgQeQeREWntQtrJ
 uIGJIfNDSfNzZHsfo=
X-IronPort-AV: E=Sophos;i="5.88,323,1635220800"; 
   d="scan'208";a="63381032"
Date: Fri, 28 Jan 2022 11:12:14 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Dario Faggioli <dfaggioli@suse.com>
CC: <xen-devel@lists.xenproject.org>, James Fehlig <jfehlig@suse.com>, Wei Liu
	<wl@xen.org>, Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v2] tools/libs/light: don't touch nr_vcpus_out if listing
 vcpus and returning NULL
Message-ID: <YfPPjkfPK/VpZcQW@perard>
References: <164335968477.24662.7673734521447971250.stgit@work>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <164335968477.24662.7673734521447971250.stgit@work>

On Fri, Jan 28, 2022 at 09:48:05AM +0100, Dario Faggioli wrote:
> If we are in libxl_list_vcpu() and we are returning NULL, let's avoid
> touching the output parameter *nr_vcpus_out, which the caller should
> have initialized to 0.
> 
> The current behavior could be problematic if are creating a domain and,
> in the meantime, an existing one is destroyed when we have already done
> some steps of the loop. At which point, we'd return a NULL list of vcpus
> but with something different than 0 as the number of vcpus in that list.
> And this can cause troubles in the callers (e.g., nr_vcpus_on_nodes()),
> when they do a libxl_vcpuinfo_list_free().
> 
> Crashes due to this are rare and difficult to reproduce, but have been
> observed, with stack traces looking like this one:
> 
> #0  libxl_bitmap_dispose (map=map@entry=0x50) at libxl_utils.c:626
> #1  0x00007fe72c993a32 in libxl_vcpuinfo_dispose (p=p@entry=0x38) at _libxl_types.c:692
> #2  0x00007fe72c94e3c4 in libxl_vcpuinfo_list_free (list=0x0, nr=<optimized out>) at libxl_utils.c:1059
> #3  0x00007fe72c9528bf in nr_vcpus_on_nodes (vcpus_on_node=0x7fe71000eb60, suitable_cpumap=0x7fe721df0d38, tinfo_elements=48, tinfo=0x7fe7101b3900, gc=0x7fe7101bbfa0) at libxl_numa.c:258
> #4  libxl__get_numa_candidate (gc=gc@entry=0x7fe7100033a0, min_free_memkb=4233216, min_cpus=4, min_nodes=min_nodes@entry=0, max_nodes=max_nodes@entry=0, suitable_cpumap=suitable_cpumap@entry=0x7fe721df0d38, numa_cmpf=0x7fe72c940110 <numa_cmpf>, cndt_out=0x7fe721df0cf0, cndt_found=0x7fe721df0cb4) at libxl_numa.c:394
> #5  0x00007fe72c94152b in numa_place_domain (d_config=0x7fe721df11b0, domid=975, gc=0x7fe7100033a0) at libxl_dom.c:209
> #6  libxl__build_pre (gc=gc@entry=0x7fe7100033a0, domid=domid@entry=975, d_config=d_config@entry=0x7fe721df11b0, state=state@entry=0x7fe710077700) at libxl_dom.c:436
> #7  0x00007fe72c92c4a5 in libxl__domain_build (gc=0x7fe7100033a0, d_config=d_config@entry=0x7fe721df11b0, domid=975, state=0x7fe710077700) at libxl_create.c:444
> #8  0x00007fe72c92de8b in domcreate_bootloader_done (egc=0x7fe721df0f60, bl=0x7fe7100778c0, rc=<optimized out>) at libxl_create.c:1222
> #9  0x00007fe72c980425 in libxl__bootloader_run (egc=egc@entry=0x7fe721df0f60, bl=bl@entry=0x7fe7100778c0) at libxl_bootloader.c:403
> #10 0x00007fe72c92f281 in initiate_domain_create (egc=egc@entry=0x7fe721df0f60, dcs=dcs@entry=0x7fe7100771b0) at libxl_create.c:1159
> #11 0x00007fe72c92f456 in do_domain_create (ctx=ctx@entry=0x7fe71001c840, d_config=d_config@entry=0x7fe721df11b0, domid=domid@entry=0x7fe721df10a8, restore_fd=restore_fd@entry=-1, send_back_fd=send_back_fd@entry=-1, params=params@entry=0x0, ao_how=0x0, aop_console_how=0x7fe721df10f0) at libxl_create.c:1856
> #12 0x00007fe72c92f776 in libxl_domain_create_new (ctx=0x7fe71001c840, d_config=d_config@entry=0x7fe721df11b0, domid=domid@entry=0x7fe721df10a8, ao_how=ao_how@entry=0x0, aop_console_how=aop_console_how@entry=0x7fe721df10f0) at libxl_create.c:2075
> 
> Signed-off-by: Dario Faggioli <dfaggioli@suse.com>
> Tested-by: James Fehlig <jfehlig@suse.com>
> ---
> This change should be backported to all supported branches.
> ---
> Changes from v1:
> - dropped patch 1; this one is enough of a fix
> - removed an assert() deemed non necessary
> - kept GC_FREE just before return in libxl_list_vcpu()
> - nr_vcpus is now unsigned
> - fix some typos
> ---

Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

