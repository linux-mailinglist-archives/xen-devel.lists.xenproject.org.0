Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B73D24DA75F
	for <lists+xen-devel@lfdr.de>; Wed, 16 Mar 2022 02:29:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.291007.493726 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUISL-0005TF-Cw; Wed, 16 Mar 2022 01:28:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 291007.493726; Wed, 16 Mar 2022 01:28:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUISL-0005QF-7x; Wed, 16 Mar 2022 01:28:05 +0000
Received: by outflank-mailman (input) for mailman id 291007;
 Wed, 16 Mar 2022 01:28:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SzCg=T3=aim.com=brchuckz@srs-se1.protection.inumbo.net>)
 id 1nUISJ-0005Q9-2b
 for xen-devel@lists.xenproject.org; Wed, 16 Mar 2022 01:28:03 +0000
Received: from sonic308-8.consmr.mail.gq1.yahoo.com
 (sonic308-8.consmr.mail.gq1.yahoo.com [98.137.68.32])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 506d0f73-a4c8-11ec-853b-5f4723681683;
 Wed, 16 Mar 2022 02:28:00 +0100 (CET)
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic308.consmr.mail.gq1.yahoo.com with HTTP; Wed, 16 Mar 2022 01:27:58 +0000
Received: by kubenode521.mail-prod1.omega.ne1.yahoo.com (VZM Hermes SMTP
 Server) with ESMTPA ID 7cb405e66a15f40978b8915c0788dcd7; 
 Wed, 16 Mar 2022 01:27:55 +0000 (UTC)
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
X-Inumbo-ID: 506d0f73-a4c8-11ec-853b-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netscape.net; s=a2048; t=1647394078; bh=i74NpBZTlnJtZy5cWd/xbyKRu8h0jzVV3zJBMfLtQgM=; h=Date:Subject:To:Cc:References:From:In-Reply-To:From:Subject:Reply-To; b=ooWS9h4yYOK/rqq6SCm/mQa8Mbo+wMsyzPhB1czDfoxk/07n0Uy5oS6BWlTG6xu+1MkBnYS1QqVvB59MnaqElD3Nnx6CA+KDMVx15+eZ867gh49WmDmn5GY0g2kEQ35vJyJ6z448VPF663N2NDgWYuW+BNoprzHEhhLpcw3t8kfdf1PzCGutZSO/+e897VXBfOWjtYvPBVQf4PDIT56IJkjOhJPf1mY8Rm1lDLQUS3MOwUBzwZuTd0bVNGe51TqBu15qaH+X4JJdOtufWBSRLPt2RBWvEZ8zo3gT+SbTOonowjFwLtvLota4kmXlZEgGXPiP5FnPLMCXtxprbOWfMg==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1647394078; bh=rTv3Zj1YkWRRzqqTDJyFXpSBpytOJiFz6EDNIiGrTtB=; h=X-Sonic-MF:Date:Subject:To:From:From:Subject; b=bcrkbK2rnzSnP6IlYA3RQU+kDns7qrO2AfN7lg2No+x7La79AT4XTAqofixJXvhSH+xFpGM5N3CShTlzbBB+iuN8Zu0FDWz+xWyWfQYUOdqDGBlPVAyzH0+3/7FIRcjxkSK1y8nYU3nWUQJyz9CyVWG1jqzgoToQWUbgq5cUO/eokCp8RTjpE+gCcNNvVPsSuCVgEmngHtXorPobajzc9ojAL824ATZ9wRL/u65SL2UZLQWN5Vdr2a97EAEUz8EYECugb8uru025XIEHq9K8pwYzbopPloIeDvIvZ+ZuGtmwQvUWONC3l/Epe/WGWAtKbA5fEDDdQKYTf/51ST+NqA==
X-YMail-OSG: kmjE2uUVM1n5mUISPaoaHJzednOQMni5YMCmTuyOPpZPAQ3Pl02JHe_B7gQBExM
 xAUT2OnD9rTU4.3QI0BuOqiIUGU5zyQL0VoBlqZKK2U8nSMw0.oIjfKiQZ7zyMvOqtDDTQHXYwzZ
 kwmrgaa_XiCqoEwhOL.v9TfAlYuw57QkzUlh265We7vcMrZa2T1M.dXR2J.4jLWIYaC4YAKnFGMo
 C.7v1PLOQ6UL4g0d4kh2K4q4vzHaD4ciSHUCzsKYOl2la3tyuHkh0bGeGaiNtL5sAS0.0S2LVpiF
 UM9HiwkUGTk86TbKSwSi4J_jsNSwg9jaUHFVu66qAVqYKPQ94BI_czfc7oDQB9YpKALkz9az1lgP
 tqz_PijJILfth_TXFguUTB0qPm5lxo1zIK2Dyw63mEdvQ36RYAI0MwTnjgq8G6jZGupweuFnHTiU
 0zbcmygtZUQvdUxWpjG_OBsRW0QowTfp1DQfm66fbaJbnUMQh5rJ0bBSVbyAMpLWVr4AHBnMX1z6
 _ANyNCMwUK5taytjjcodoO1p3fpQY2KvU77OhZvlFDxz6L7MHGxZO.hVBKx9Je0I9QIHorH.z9t3
 k4HE7J3Gk6Qgpe.e55y1XHjJOeY418t_Dw38s0h5z.QrnfiAErwGw3YBqFfkYbDbxhuT.GPPoLT6
 e18du394Qs6KNCjqh.jWa0rc8Q84kaI_8LjTAVQiBVLa47u1GIYg8Fw82JCVNRYeQ8XBbyuTFiJB
 gQa.VovHkA.rt4aJZypPUPoaZRve3k6mUSBl7KTPZ1OkitJPmn1WvMyO76UhO3G2PLuULB4jVWDH
 rjoSbnP.B.ngq353ptYNw2VrH.rj7PyecFC.S0bAIWdjs9yMngMdR2jJSc7xbIBF8jl6ieXIsPcJ
 h8tMrEvhM7uFsyid2_VuOr15ounL0DSvCBb3q913uJumY_ii4KTCBqH3rqEXxhqTFja1_z8jaypg
 wMPKjQYEqLuj7lOsnqnlIuhNVyNzsLWVSGwnZDp6EkvJZTHG.3O2S.mDb04PAsyxxPbCAG8jn.uG
 hiYvUNlK21qqvO7VK4WQkHM8f3sVE_eQM7_oAo6hFwYwdoudjpOnS2tsBaCPSfazFm6_ZBBpEXn1
 3n.ak22Y83c3eekffoVM6M0m4aUSpl5XPxsqDbDvmYGaVdfc_zpBWhycrp01k_QtsB6jvz33SGmf
 mQ.eZLdDruVzYAP7WPnGIX3C2ZTGoVEuGSn.5NZl8USg.fjHNwBOFmjmNBQ5xg76BtxbKv1EPnE.
 ll5ws0G9dj8OIG7JKGpWv2m8OL2Flb685BfiHXKXL24b_.McCBH0uJsijffAapFBsvbyHmC4Kdx.
 qDWtlG90tFAUPWRX4lKiOIIfH7vrJ7S3fLnRD7odtzC2GkNc0kDP5PJLFbM6rb60UvnzQ7jbhgFq
 qz00iRl2GMvXlwgX4OK7Ar5PN2FZ5kiH8bkC_BRsUXA9qHU7YvlciSbRvGHwnK1vBhftGD8sbLs4
 cdrRrx4_gv6E130HrlYXlJIlRcW2qx1JsRUAuB4gxOvSfUj5b1BApLxHDJQlwtiqFRy18X.Rl2id
 _Jgl6.dclhiNeR1v2_qpXKiWIIIWrsES_uYtwjdmIWhYZ.eBhzhaVscrGHxm1rvPxONrTW6qbVN2
 1bhvex9XlNeGoJlI1u7ZaT.lhewTLi_I4PvjQ7.nPPXI5e.lUs.AeZKVluWHYgD0cKnM.EE7psk5
 N4Ox8RCT.bO_Ih0wkHp5trtIgkwm3ickd2dgQzrEMwi7E8u2rP0.tiOfVrdh1Z9dojcYrm8.0eNB
 LmSMn8nD.5OY683FEjQgUj0arxCS9pTkKdF0v8u0NGYKvuf9BZfsWGRwa_IoW6oM1NRh4K4MQhca
 rjzj5dv6VrfcCtDVFn6ydN_WPR_X0BsbsVX4ioMLt8DhhPEz32p.9_PpVM3SZj_cmuNzd4yD79Kl
 Og.M18BRgYRNQivc1S4dm.HMl4OjHNxuXMg52Mxe3wkiiQVQo_gjMZ6QwbWbVzF8wjwOjA8Ng3vt
 w9Qz7MfFeLshHyhhjY4j6yyHMWlBVM0iILcxWxzoZtQIPC9YUNSilYmiVnfejTAaE1johd4U7UQd
 2jCU7qBXZvi9RNbswV3TzjwTtGpA29JiF3OF9Cmt_l5Xemi2u0ZBKlVIhsIy_VvmCqSTaVpK_HVQ
 JD9ooO55FEkIp20GMfEXfCXIkGuxdAJFY7HfW58XDJ7Q0x8o5P2HId4OJGN3MRN0z_KeZUuOnRCr
 7Sur2f5g5
X-Sonic-MF: <brchuckz@aim.com>
Message-ID: <da166412-9765-039f-9248-869204d78c36@netscape.net>
Date: Tue, 15 Mar 2022 21:27:54 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [XEN PATCH] tools/libs/light/libxl_pci.c: explicitly grant access
 to Intel IGD opregion
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
References: <b62fbc602a629941c1acaad3b93d250a3eba33c0.1647222184.git.brchuckz.ref@netscape.net>
 <b62fbc602a629941c1acaad3b93d250a3eba33c0.1647222184.git.brchuckz@netscape.net>
 <23f5afb4-c712-f872-acee-7f18b98b73e6@suse.com>
From: Chuck Zmudzinski <brchuckz@netscape.net>
In-Reply-To: <23f5afb4-c712-f872-acee-7f18b98b73e6@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailer: WebService/1.1.19878 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.aol



On 3/15/22 7:38 AM, Jan Beulich wrote:
> On 14.03.2022 04:41, Chuck Zmudzinski wrote:
>
>> @@ -610,6 +612,45 @@ out:
>>       return ret;
>>   }
>>   
>> +static uint32_t sysfs_dev_get_igd_opregion(libxl__gc *gc,
>> +                                           libxl_device_pci *pci)
>> +{
>> +    char *pci_device_config_path =
>> +            GCSPRINTF(SYSFS_PCI_DEV"/"PCI_BDF"/config",
>> +                      pci->domain, pci->bus, pci->dev, pci->func);
>> +    size_t read_items;
>> +    uint32_t igd_opregion;
>> +    uint32_t error = 0xffffffff;
> I think this constant wants to gain a #define, to be able to correlate
> the use sites. I'm also not sure of the value - in principle the
> register can hold this value, but of course then it won't be 3 pages.
>

I have one more comment to add here. I am not intending
to define igd_opregion as a data structure 3 pages (12k)
long, much less as a pointer to such a structure. However,
it would be nice to have access to the actual data structure
in libxl, because we could use it to validate its contents.
I looked in the code for the i915 Linux kernel module, and
the IGD opregion does have a signature that we could check
if we have access to it. That would mitigate my concerns
expressed in my first version of the patch about a false
positive when identifying an Intel IGD. Hvmloader should
probably also do this check before it maps the Intel IGD
into guest memory if that is possible. However, I expect
that it is not a memory that libxl has access to. It is
probably a structure in kernel space, but it might be
possible for libxl to ask the hypervisor for access to it.
Perhaps the libxl maintainers can shed some light on that
possibility. If this is possible, I will include such a check for
the validity of the contents in the IGD in version 2 of the
patch.

Regards,

Chuck

