Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D62DB9458C4
	for <lists+xen-devel@lfdr.de>; Fri,  2 Aug 2024 09:29:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.770227.1181179 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZmj9-0003l1-Tw; Fri, 02 Aug 2024 07:29:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 770227.1181179; Fri, 02 Aug 2024 07:29:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZmj9-0003iI-Qm; Fri, 02 Aug 2024 07:29:27 +0000
Received: by outflank-mailman (input) for mailman id 770227;
 Fri, 02 Aug 2024 07:29:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4koO=PB=yahoo.com=avikalpa@srs-se1.protection.inumbo.net>)
 id 1sZmj7-0003iA-Qo
 for xen-devel@lists.xenproject.org; Fri, 02 Aug 2024 07:29:26 +0000
Received: from sonic302-19.consmr.mail.sg3.yahoo.com
 (sonic302-19.consmr.mail.sg3.yahoo.com [106.10.242.139])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ee1a556d-50a0-11ef-bc03-fd08da9f4363;
 Fri, 02 Aug 2024 09:29:24 +0200 (CEST)
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic302.consmr.mail.sg3.yahoo.com with HTTP; Fri, 2 Aug 2024 07:29:16 +0000
Received: by hermes--production-bf1-774ddfff8-46ck7 (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 22e68a62375d431a6c60c9207cc618d3; 
 Fri, 02 Aug 2024 07:29:11 +0000 (UTC)
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
X-Inumbo-ID: ee1a556d-50a0-11ef-bc03-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1722583756; bh=eMvvhr2emu9Yi2Wwmr5B0PnMbjsUolUEcbRDdgYkuQg=; h=Date:Subject:To:Cc:References:From:In-Reply-To:From:Subject:Reply-To; b=jjCLNffA8LuoDc9KzT+j+j9CVg54X9Koc8T+CukjMEnOsVPruCxJnn7Hu7dAAJeT+Sxbw+BjbmpDnJnu72ff/ocrKdKkzY+6qeFxcw+jEsfmSoL1fzScZn+Tc7oLizraPGnUMEPaKwzLPONap1XFz5af6KGuiLsZllZ2odVr8khWNFXHJImVz7hDpcbjVecUm0tRN7BYoFPdkQSZH4A9mTh/S1lCCMGyqbCu8X+lFGFS9Xr0VIMy2pDGUZfHCcPYFqOH/wGPjbG0O5dqm94D2CtrwOzexA1yrhT/3NTwy0R1imUp1DEv4EtN3Ny5gBGES1qwbYPgMrzNM8LCMZAL4g==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1722583756; bh=pzE2CCxU5D+pPlP4vAc/N7qGFOrF+HOqIyN9LdX6bdD=; h=X-Sonic-MF:Date:Subject:To:From:From:Subject; b=h6M7ivYMB3vIpPMotnLUefDvjVty9d43PWA7U6ZwIUwoHVLadStiaVMKDwiHFaDbnBO7m0s4ljg4Z9YLANBjlrOUzvbkH0YFYjaF1Y6GieY/cZSuvAlA4k5sBvYWXLwiDucH/WEE+3AAq0VqUEf3GRcXLqpiv7qekfitlA698obSce8O/T4YYolKX2mOjaTal5ItBxDsixyxDHevUcMXIY7FDe5nicgVgSISwnGCUBp4wFqgqr0uusxnfKSd6Jp2oN2noqdXfzr1BIU0s/0+JwygbjcI1N1mHQIMW8dwJqmuSnEUfSbWPufGv8RbFHLPUGXhPuQBbZNOBNBwt3JPPg==
X-YMail-OSG: GNqsGbgVM1lrTBY45WvWWrGr.ZkaUcUMygavkHdDkBa9ss1FoYLso63gqjP81gg
 5ngMlNJ5AYjg5gY6RD6DtKvHkfs.2Rcb_lIy2s9gL9nL.MWOoCMjL45vsWPyjZXh7LT9xHmhdl5K
 xf5_goepg5zLlmgMjZnXI4fFolWeyMOaQyRo_hSSG3pbAcnm.uzff0XoXGo2dbgQx0_Z0rvD.YvC
 GVlHiyjc95VHVTxMBc4xE0xSa6rABXehEs6xwIsKGxUwiUthy3qAK_NL1A19ctvr0QreomKnrvoJ
 x8s1ViT9TRC0JErdc9UvsgDhtfTVkjjpxp5GCLw6kaGveIBQEywDt8h3oBG0m8u4Y72d3p5smvOb
 nW8SQB2acdxMvmELXPvw.55SmfJVWXK8JlKsIP_cLoThDdiQAWy8lko7QfVlZ_wVQkmnNsiTfZ1e
 44EY0dMT4ggW5Q2g3CDJaPcMIui5b1b1F0eC8CUzsmTv.h5eJn5NMatnuh9LpD7GTFcWrkzPeTDl
 s1in0IKSaEY4jd0ZwqUoUGNBv5RgJEARacog6LEyzFHzw7B513UGlWOwa4VCPceW4OGMnI4SJeAe
 Wx2D5SiDtj62KNCwoBc5taH0N4c05YB9VUmo5S.LLwUsvIi4QtRkrF7mHSO_cvPwLgU_1IE4W8e0
 RVn9f0WPOY.5XaMf_29kzrQjNQ2kEWtAiKqFS4x8a3NExX5T9cFqIPtnGvvWkgZKb_MJyHLhR6z9
 PVkt5NUg9AJaVyE6D29t3znLTp0_oJJzdCquWpNflqLJqg5ZF3DpFKPd0.zbYzNQvMzJRVQTvrt5
 _qVSXgajUBy.47TZmNwTkFxkg1lF3y4pL1rBNYVKJaOCR5X8.Mjoqg5b1pFhw4Kv8h_EfKTBOC7i
 0WLpAliEL14l.Panx3mSeiGNLXch3Gk7hV7cZSLv9au9xD1sxzFrPKt3MnASzGvKVy9uQT.t9wil
 GTB0Rp58qX8xSkbqGdL0tWbK6a6wAkb1LgNDtC2.rK105B5YSu8JlS6BT0NRMeMJ1Y_WVQS5d6a4
 10kawxudl9YH5Y2.1O8xTJ_Ipyy0jLs3MW5D4z_tllwoTqN3jqdK172N__ae0sQO8QPfcV7BJWQe
 arTVozGq1UL9Q2.iYjWGkn_kZcRoLWwA4qLKKtE3oczXkryZb3Bera3vXuq3sMssD0GAF8v39i4I
 5VfwoHcPeu5YPMpAXOrXlRSAZpl7BnPvafnncdGtejuXEIVgP5p3DqX5JYxT5KSLrAnHaoRIUSDM
 eicGG2Qgd1KEnc2nNIlwfmhMuGun_dzaffJi4RDKOvw6ijiOOrTTS0ig2jZpOkvR20dVwPrpBE9c
 iUw8SlS5KRbiVuTy3ICLw0.arRGtAfo2Lfx9Yg1pRpfiNd9Ji7HDzmD7XTlIpthHGeVJqm7.JirH
 3aJnAef8eLlu8htF5y9jMTTL0Knt1C8Tzf4C2PYIoGs4nE2jaIEmU.mSTXo2_zYVLQWOulC.hxbW
 DN36gNzvbSanKL99Jz3zPBOXFGU8h4yzSM2VAL0NJoj22JaULJ8LlyLtAva7lGIJl1vrO5zWZJpq
 DrUJy6xY2oNfSMhVZiCZEhJeQKiUkN8RKokuTi1bKaOqp_tWVX7NGhJCJftdYiFQHuyTJqo0vfLH
 1Cy_3BmxyxheDU1aL9Ak_kAeWVXHpHYihflYmkYySYfmPGr5YVc1nUzxbHW9FNDvnuOr1FSI6LIw
 6JvzeuC0oaNn6U9Gw7bPpgWFpue62k.0bhdx6UBFnAaqAxux0DP5SWK6eqoFwbOpv3ETMiziVbmB
 oZAzhUujdXC67uF3rf35cpf4MEcmkJvX6M.8jNa.2PkP90s.Z6et2WKbdM7qo9XH2d1xa6.hIqYd
 GxlNqknVZ_fED0bGwIvakSk2aj13EeR35N_GEyf8HPV0lJO3GLjNH0bwr4PDGrulXl8R2U0lJ6C3
 RUViADy.3_3h.BnFt0NEVj9Hj8LMKl4dUwxPKTqEnW_rwTKOA1o3m.txbZ6JftgmAmlPD8ZwBYXf
 nZBa9p5rx_2c0ghbhFudsbZU7V4o_Pv2NfkmvVRAdntV0m1Gwg_ZxcUDMuMPiNUW0jDDSB_SVktV
 iEk1KHKicSyabK0IoiDHGp52c7nvbZobHnZNATTsX6DtaNlsjvxIK_1JpQq0w7eUD1ULuzXT9Gno
 l3yh_R02IO8mmqauc0lGCLeQxeBgOYDqBApkgsanlHT_ce_3j6clhFuon6PhMisWq8_6usXw-
X-Sonic-MF: <avikalpa@yahoo.com>
X-Sonic-ID: 0d0771c0-fd8a-4579-a947-07309565edcd
Message-ID: <abaceb99-4b80-49d7-ab7f-b190f73e858d@yahoo.com>
Date: Fri, 2 Aug 2024 12:58:51 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: kexec failure with Xen 4.19-rc4 and 4.20-dev on linux host
To: Baoquan He <bhe@redhat.com>
Cc: kexec@lists.infradead.org, horms@verge.net.au,
 xen-devel@lists.xenproject.org
References: <05395ed2-3bf3-4926-8e24-c2e7ff37ed26@yahoo.com>
 <cebc7800-df78-4f90-9f8e-82e3f9120b6e@yahoo.com>
 <ZqxUMgcEHakeFPaU@MiWiFi-R3L-srv>
Content-Language: en-US
From: A Kundu <avikalpa@yahoo.com>
In-Reply-To: <ZqxUMgcEHakeFPaU@MiWiFi-R3L-srv>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailer: WebService/1.1.22544 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.yahoo

Done.


On 8/2/24 09:06, Baoquan He wrote:
> On 07/31/24 at 06:34pm, A Kundu wrote:
>> I am experiencing issues using kexec to load Xen 4.17(debian's apt version),
>> Xen 4.19-rc4 (compiled from source) and 4.20-dev (compiled from source) on a
>> debian host.
> You should CC this to XEN dev list so that XEN dev knows this and may
> provide help. Not everyone is interested in and knows XEN.
>
>> System information:
>> $ uname -a
>> Linux host 6.9.10-amd64 #1 SMP PREEMPT_DYNAMIC Debian 6.9.10-1 (2024-07-19)
>> x86_64 GNU/Linux
>>
>> $ kexec --version # compiled from source tarball with ./configure --with-xen
>> kexec-tools 2.0.29
>>
>> Steps to reproduce:
>>
>> 1. Set variables:
>>
>> XEN_HYPERVISOR="/boot/xen.gz"
>> XEN_CMD="dom0_mem=6G dom0_max_vcpus=6 dom0_vcpus_pin cpufreq=xen"
>>
>> 2. Attempt to load Xen 4.19-rc4:
>>
>> # kexec -l "$XEN_HYPERVISOR" --command-line="$XEN_CMD"
>> Could not find a free area of memory of 0x3b6001 bytes...
>> elf_exec_build_load_relocatable: ELF exec load failed
>>
>> 3. Attempt to load Xen 4.20-dev:
>>
>> # kexec -l "$XEN_HYPERVISOR" --command-line="$XEN_CMD"
>> Could not find a free area of memory of 0x3f8001 bytes...
>> elf_exec_build_load_relocatable: ELF exec load failed
>>
>> 4. Attempt to load Xen 4.17 (from debian rrepositories):
>> # kexec -l /boot/xen-4.17-amd64.gz --command-line="$XEN_CMD"
>> Could not find a free area of memory of 0x3b4001 bytes...
>> elf_exec_build_load_relocatable: ELF exec load failed
>>
>> If you need any further information to investigate this problem,
>> please let me know.
>>
>> PS: If I used apt's pacakged version (which might be compiled
>> --without-xen),
>> it shows,
>>
>> # kexec -l "$XEN_HYPERVISOR" --command-line="$XEN_CMD"
>> Cannot determine the file type of /boot/xen-4.17-amd64.gz
>>
>> # kexec -l "$XEN_HYPERVISOR" --command-line="$XEN_CMD" --type=bzImage
>> Cannot determine the file type of /boot/xen-4.17-amd64.gz
>>
>>
>> Thank you for your attention to this matter.
>>
>> A Kundu
>>
>> _______________________________________________
>> kexec mailing list
>> kexec@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/kexec
>>

