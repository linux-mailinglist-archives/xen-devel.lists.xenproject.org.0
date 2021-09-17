Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EADB40F921
	for <lists+xen-devel@lfdr.de>; Fri, 17 Sep 2021 15:29:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.189424.339123 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mRDvZ-0005UV-LG; Fri, 17 Sep 2021 13:29:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 189424.339123; Fri, 17 Sep 2021 13:29:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mRDvZ-0005RP-GH; Fri, 17 Sep 2021 13:29:17 +0000
Received: by outflank-mailman (input) for mailman id 189424;
 Fri, 17 Sep 2021 13:29:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2OQJ=OH=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mRDvY-0005RJ-1x
 for xen-devel@lists.xenproject.org; Fri, 17 Sep 2021 13:29:16 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 402a7cd0-17bb-11ec-b6a4-12813bfff9fa;
 Fri, 17 Sep 2021 13:29:15 +0000 (UTC)
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
X-Inumbo-ID: 402a7cd0-17bb-11ec-b6a4-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1631885354;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=q5It2uaMZ9gTW/mN1H3bafbIZWfxVecyJARSdZ/IT/g=;
  b=YgKP5xWiJoz2b/4sXdfnt3l5CwTkXGHuDvzg+N9FkXBTFoYLTJYVjEn6
   Gz88DOOmSIo+Lwg6ykOB1yuXrWRLnYaoBQ4MBB00OVw7jBF7hlmLXJZl6
   VOJSfREMQoVDVZR5ho60rp5O9DLLurHeb+059jclcEg1WvwaCNxZUJ6oK
   4=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: XsUgqEzkGOvXZ+bbzB/UuN6vkjGHb6NjvdKS1EHlwfoGekNVJEx/5SuxZhRQXnft+MhJ0z9scE
 7nN5NJsVplM0jyDaI9ZUOiPPqmL0gPUG+euxrIowUdI1zPHd+gBed41fDarYUkgQ+x6SaSTTKQ
 wCpY9iYfHvRvpU8Tplocg8dsxgZQqMSqMDY+IsMunAAQ/jxRFYt9/MyQronndEl0JvlWeLdS1d
 ssIxZP0vw90FOsDj7LdM+BocS02t5eYhP1L5CmXjJTeB7qMMaa7Nzup8JZLPb9Zj7ht2A60oiL
 xgnMZECkasu+Sd8r94ZmfmWr
X-SBRS: 5.1
X-MesageID: 52973320
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:RsRbiqwKMhoPTGhKZGp6t+e2wSrEfRIJ4+MujC+fZmUNrF6WrkVVm
 mEYCDvTMvaCZWb3KIokbISx/U8G65CEyIM1TlA6/yAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnvopW1TYhSEUOZugH9IQM8aZfHAsLeNYYH1500s7yrdm2tQAbeWRWGthh
 /uj+6UzB3f9s9JEGjp8B3Wr8U4HUFza4Vv0j3RmDRx5lAa2e0o9VfrzEZqZPXrgKrS4K8bhL
 wr1IBNVyUuCl/slIovNfr8W6STmSJaKVeSFoiI+t6RPHnGuD8H9u0o2HKN0VKtZt9mGt9lXl
 O5thZrrcwEGJfPqldgWWUV9MD4raMWq+JefSZS+mcmazkmAeHrw2fR+SkoxOOX0+M4uXzsIr
 6ZBbmlQMFbT3Ipaw5riIgVoru0lINPmI8U0vXZ4wCuCJf0nXYrCU+PB4towMDIY25ofQq2FP
 ZJxhTxHSR3GYT9UZ3QsOZMQrMu5gCHNegZFtwfAzUYwyzeKl1EguFT3C/LOYcCDT8hRmkeep
 0rF8n7/DxVcM8aQoRKE7XCEluLJhTn8Wo8ZCPu/7PECqF+Zy3EXCRYWfUCmuvT/gUm7M/pAL
 2QE9yxoqrI9nGS7Q9+4UxCmrXqsuh8HR8EWA+A88BuKyKff/0CeHGdsZjJPYdMptcgyRBQxy
 0SE2djuAFRHsqCRSH+b3qeZq3W1Iyd9EIMZTXZaF01fuYCl+dxtyEKUJjp+LEKrptTTRQrQ8
 zbRli4RnOs1gPIA3fme3k+S1lpAuaP1oh4JChT/Bzz+t1MiNd/9PeRE+nCAsq0Rd9/xok2p+
 SFewpnAtrhm4YSlyXTVKNjhCo1F8Bps3Nf0uldpA5Bp3DCk4XfLkWt4sWwmeRsB3irpf1bUj
 K7vVeF5v8Q70JiCN/Yfj2eN5yMCl/OIKDgdfqqIBueim7AoHON9wM2LWaJ39zu2+HXAbIllY
 cvLGSpSJS9CVMyLMwZat89CiOR2l0jSNEv4RIzhzgTP7FZtTCfOEt843K+1Rrlhtsus+VyNm
 /4Gbpfi40gPAYXWP3iMmaZOfA9iEJTOLc2vwyChXrXYeVQO9aBII6K5/I7NjKQ+w/0Ox7uXp
 yrkMqKaoXKm7UD6xcyxQikLQJvkXIplrGJ9OiopPF2y3GMkb5rp56AaH6bbt5F+nAC65fIrH
 fQDZeuaBfFDFmbO9zgHNMGvp41+bhW7wwmJOnP9MjQ4epdhQS3P+8PlIVSzpHVfUHLvuJtsu
 aCk2yPaXYEHG1ZoAvHJZa/91Fi2p3Ucxr5/BhOaPtlJdUzw24F2MCit3OQvKsQBJEyblDuX3
 gqbGzkCouzJr9Nn+dXFn/nc/YyoD/F/DgxRGGyCteS6MizT/2yCx45cUbnXIWCBBT2soKj7P
 Ldb1fDxNvEDjW1miYskHuY517866vvuu6ReklZuEkLUYgn5EbhnOHSHg5VC7/Uf2r9DtAKqc
 UuT4d0Ga66RMcboHVNNdgooauOPiaMdljXItKlnJUz74Gl8/aadUFUUNB6J0XQPILxwOYIj4
 OEgpM9JtFDv1kt0ao6L3nJO6mCBDn0cSKF25JgVDbjihhcv1lwfM4fXDTX74c3XZthBWqXwz
 uR4WEYWa2xg+3f/
IronPort-HdrOrdr: A9a23:lEaMYKsRijKSzOPv7NhMkjTq7skCJIAji2hC6mlwRA09TyXGra
 GTdaUguyMc1gx/ZJh5o6H+BEGBKUmskqKdkrNhQ4tKPTOW+FdASbsD0WKM+UyaJ8STzJ856U
 4kSdkDNDSSNyk4sS+Z2njDLz9I+rDum8rE6Za8vhVQpENRGtxdBmxCe2Cm+zhNNXF77O0CZe
 OhD6R81l6dUEVSSv7+KmgOXuDFqdGOvonhewQ6Cxku7xTLpS+06ZbheiLonCs2Yndq+/MP4G
 LFmwv26uGIqPeg0CLR0GfV8tB/hMbh8N1eH8aB4/JlbwkEyzzYILiJaYfy+gzdk9vfsWrCV+
 O8+yvICv4DrE85uFvF+icFlTOQigrGoEWSuGNwyUGT0fARAghKVvaoQeliA0TkA41KhqAh7E
 sD5RPri7NHSRzHhyjz/N7OSlVjkVe1u2MrlaoJg2VYSpZ2Us4fkWUzxjIZLH47JlO31GnnKp
 gZMOjMoPJNNV+KZXHQuWdihNSqQ3QoBx+DBkwPoNac3TRalG1wixJw/r1fol4QsJYmD5VU7e
 XNNapl0LlIU88NdKp4QOMMW9G+BGDBSQ/FdGiSPVPkHqcaPG+lke+43JwloOWxPJAYxpo7n5
 rMFFteqG4pYkrrTdaD2ZVamyq9CllVnQ6dgf22wqIJzYEUaICbRBFreWpe2/dI+c9vcPEzc8
 zDTK5+Erv/JWGrHY5I2mTFKtBvFUU=
X-IronPort-AV: E=Sophos;i="5.85,301,1624334400"; 
   d="scan'208";a="52973320"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EvQvhb1d/qPMzoBzjMQ+9+lrSY6E+hAVf0ezOVBk9n+GUcxs3LCuCTltzEpRFT/oETiT4aFWUljej1E4TAYTz5SdxpVwhk0G7eaXiqmxbuBk/6HcneRYsI15Z6Gv7UWXuLf4C7uphit6W1mVd7zEBOPQQlMXDnjAPwSm8dI4BLU0+RyZUjeRciF81TU1rUMiRw4e3yEjyTnEbx3GeQZ8nBltKvzh2PXN/kMtcqdUfB4XZGM5JxzHPyRIC3zXgKrqILJ0MEqVW1AbaWA3JZDtFwPMJAiAeo9DLVsSBheRAFLelQX/SEbq/Hxd8LTSY6wMuIPNAGEJ5XvTokOTSJGhRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=NKQPTZs0jxTjQ9A1ySBjY71pxV11rHjXty003ceqxio=;
 b=cJvEVU7Sisbef9lFhXzObRXsLTmrmfYmZ+GSp5/wl9ZqWf+LgO7whD3roOydJiXpNNBGeru3AFYpzPfssBsem445s3MdeNecZTnKDBSnuo56zE4hb7XfDZAQoVPQh2yUBGvDLjZP0jfBsLgBhR4elc/ev/W+NxdaED8LoGtNuc47daYcUPCuSYFVScIYoPKBlE3tZQQevbRgaYu3GBvI7E20nfBknoUGbUW2J5GaTSPVrAxZiR8QhoXLWuZQFDe4BjGjncXBfz5ALfMd4i9dPGKmN4L9/fZ7jOfl1Xz/8mxMUSCdPkBurelOoCbQFyYm7Q5An5bkfwHFKM//8KgGsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NKQPTZs0jxTjQ9A1ySBjY71pxV11rHjXty003ceqxio=;
 b=uvZFmeCHdoazqRIlYQLKlaGsDgcHM1j6xvKoFSngiwZ6ev22HDb1hGj0t4VXymzhIXqjzoYpHp3/Du9LtpHuzNSPF3gif4fKfYZKuwm8NpNRkHygG6WDCsIifdl1UC5nWQqv/6E0fj4Bc8dMZon5TLK4gK5Muu53HLYTW8mfJRA=
Subject: Re: [PATCH 3/6] xen/credit2: Remove tail padding from TRC_CSCHED2_*
 records
To: Jan Beulich <jbeulich@suse.com>
CC: George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Julien Grall <julien@xen.org>, Dario Faggioli
	<dfaggioli@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20210917084559.22673-1-andrew.cooper3@citrix.com>
 <20210917084559.22673-4-andrew.cooper3@citrix.com>
 <66d0cd95-a9db-05ca-3a4c-b728a2f5cdbd@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <ffb38e63-e18b-c143-9b30-46d6cb2cc8a9@citrix.com>
Date: Fri, 17 Sep 2021 14:28:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <66d0cd95-a9db-05ca-3a4c-b728a2f5cdbd@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0299.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:196::16) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5ade5775-0eb5-4411-5e71-08d979df1e8a
X-MS-TrafficTypeDiagnostic: BYAPR03MB3557:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB355702B6B4A59A18DAC2CA00BADD9@BYAPR03MB3557.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IjaSaEinXo7XU6zkgAZSkw3CiHtbLysO8W11AR6hfoEuEPH8G/F9XERP9A+W0uWk1pD52NklJyplF0S/96iRs66ijlg/rrR11j+BLClr7hMTR3fPE6vaBVS7g0j7kZwTOc3/XRocqnk/aXFhujhRlqmcdsPWrGqpFIlhay7vkJYLMQIDKqGKinBlYASR9UBCQqnmlFFtdF+DG4VIQw/FjaqUItJ33dNxMs8PgMmiHwzwg8lp8eJn3+xQkVdVAg9MZwEkwQvZSWtKxm0/y82zU6boEmHGQcN2ksgtZ0OO3993uB7JxTs4kb8AV16Gi3TbAdlxJwe5uumK6ZDcTtneKFNsqyaOrliQvXBjPAxswC8TuIZV+b62M6LqYBGjU4dVbsVOUtQiEyLXEZnV0zfHML+J2aZ9LI/mMRlCCpbzQ3U3ZxubppWkvqn5M+SeyHoQxHk4E+TRzyMujuEOpN249RirMj9d4gM5z3X3B5xcmiozxpPriuxPtO1HGFG8VWukQf0vdm16mm2Kg1dZFP3dDbYcxUyZDoKXU3v/UTGzWB0ZfSZ78bXXB92vbBfA+mpv0g7ak8mLY+H2YFuYh8CjWNP2yzs08YX2S26cWfBslFeF4gV1DOmUibYBZObbcm34M7Sx5Iw18DfHBJD1to+/Fh80drH+4IRp0PgRfvEbdtRwuAeLhimFe9cnRVcRLKio5bESEmdudEyeKY202I8UsDiUKfI4Y/35hZ/+1S2e244=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(8936002)(508600001)(83380400001)(4326008)(2906002)(86362001)(31696002)(6486002)(4744005)(2616005)(36756003)(54906003)(316002)(66946007)(31686004)(66476007)(66556008)(26005)(8676002)(186003)(53546011)(16576012)(38100700002)(5660300002)(6916009)(55236004)(6666004)(956004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TGFOM01zUUZEV3BYd0hqNllQVytvbU1lTjdEWGFDL1BVRCtyS3VQK0F6TCtu?=
 =?utf-8?B?REtVSTlmaU1ndURHVXYyc3p2azRKNUk2TklXZVM2aUVDVFAzMDREbVlza1JE?=
 =?utf-8?B?alQrY1lHdlc4dVVtd2dyaEllQndtUjZ1V3RFR1JSZ2J6YW5sdlY2L1NqazZz?=
 =?utf-8?B?K1lwOUxpdHI3NGcwK2ZLcGowemtHMmxGOGhpbEVZY1lkYWdnZFZ4Z0NlUkJP?=
 =?utf-8?B?MktteFREcHBSU0tleHo2SHdGY0ZPZks0UGUzU2J4SkhzRXpEd3ZXeDVVRWp1?=
 =?utf-8?B?UGpGVHNqSUtXN2c3aDFXa004SUtaNUNBQ3NPSkRzb3ZEaFAxOXQ2SWtIZkQ2?=
 =?utf-8?B?N2JvcHJ2TittQ3lmeHNMZEZYTnQ1L2RDQ3lDSVg1SzVpdXVzeVVacmtvUTM1?=
 =?utf-8?B?d3dvdGxyZVVBT0J0Y1Q4RkJiVjB4dlhTQUp5aGdjZkZoWjNHZWFxRERQdmZX?=
 =?utf-8?B?VkxiL1J4eWVZaTRkNmNTSlYvVmtpOWhvWG1yK2FLLzRmS2l1L0VqYTZQRHFa?=
 =?utf-8?B?OHV2cFgvaldHQ0VoaVEwVGV6U0VzT045aTcvWHRJeDVLS3ByMnI5WGlsVito?=
 =?utf-8?B?UnFFbXJmVFdIdWxVVXIzZlhJelNSTGNhRjlXWFlZSWNHL2o5VDhJM2hId2p4?=
 =?utf-8?B?SGpKWndkVkVWYjJKeENwVDhXRzVOUGhMd2VJWEduQnVoVkJtSGdVcHMrMVNC?=
 =?utf-8?B?R1VrekF6LzJtNDh5c2xtdE4rcVpxZnlQVXBEUXNGa2twdURYRjdtemtabHpx?=
 =?utf-8?B?S3VVVks3TWJDSThwUFF4dVBNTHBuclpjRnNPNGVJbGYwbzhZaE9uT0JTWXo2?=
 =?utf-8?B?Tk9ZRXc3WGNaR0RVbFVuQ1pPc1YybzJvK2RndE9nbjZIRmllSEtZNlJaNi9j?=
 =?utf-8?B?QWdITlpub2JoSnR1dzU0R2VGLzNaUmR1UHM4VE9yMDFrRzJCbmxreVdERkZl?=
 =?utf-8?B?bkRDbkhoeXJjUktvUXJGZWlvOTZaOG1IZHVlK0cxWXdWcjY5WkhWRmVYUUJv?=
 =?utf-8?B?cWN6dGpKTWJyZlU4aGxuRkd4ei90a25nRUJrbmhSY0VIeWpmcXdZMEJOMEVs?=
 =?utf-8?B?RnFMMXBHWnpLVlczc2NSbTJXVVJkVUZjOVlCZERkRnlUSkJOOVYzdVFMYWEy?=
 =?utf-8?B?V1JZRUNsUXBmOTdEWm1HQ3JRZmErOHVZYXpxOWIzMGxSRlZUcHF2T25hUmEr?=
 =?utf-8?B?THhMYlk0ZHliZWpSWndVc0FQQ1hJVEQ1M0s5c3FWd28yM0w4NXl6QUVka0Iv?=
 =?utf-8?B?cUduNG44b0I0VldGMmlwaUFHcUNpUzlOODlXVW5zckUwL1ZvSVlpazM3UnBp?=
 =?utf-8?B?MHFWSkQvVmxDc0JKRXlZS0R6WGhHbStLaFlFMVpOaGV4NWZiNjlFSHVUK0cr?=
 =?utf-8?B?anFRdE1aclgyTlBmbUwzNDREVnZxRVdqT3pvQUJNd01ON2crc1dWdlZVeEZk?=
 =?utf-8?B?R2kwYk81clVHUmhUbS9XRXZYbWJNUy9DVXZESTFGcUdmMFdDZkNJbTBVcXU1?=
 =?utf-8?B?WG9mT1grelVHTW52Sy8vbGh3QkdtM1IwRC9FOXBRWmhDSmtzSFFwUXdFZlNn?=
 =?utf-8?B?OU5RMlJneFpWU1Z2b0VKTnh2UHhYR2RVSTkyUmYzcmdtV084VGdIcFVnc0tC?=
 =?utf-8?B?S3BidmxFZkdaTWZiTUUxVWFoSHFrTFJ2UFk1RVhKZGRKYUFIcU92WnhSbXN3?=
 =?utf-8?B?SUlXRnMxM0VKZitTZis1a0IrR1hndzk4LzJHV1ZjWUJXdHBnMjI4Rmp3d09P?=
 =?utf-8?Q?BncJH/p2DsXA7IMlL9DPouWhB3Lzohhlut/CtFU?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ade5775-0eb5-4411-5e71-08d979df1e8a
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2021 13:29:04.8957
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gZewf/Qr+/40JqBiM5gM/JshoLrbMOiuwd4e76SZoNEIKqQmknTIEjBYTuQBTKoj0GNrEe647+0GOEiF2KIXzRO7iZ1DpAG0Eb0XYsZkoXI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3557
X-OriginatorOrg: citrix.com

On 17/09/2021 14:10, Jan Beulich wrote:
> On 17.09.2021 10:45, Andrew Cooper wrote:
>> @@ -1336,13 +1338,16 @@ update_runq_load(const struct scheduler *ops,
>>      {
>>          struct {
>>              uint64_t rq_avgload, b_avgload;
>> -            unsigned rq_load:16, rq_id:8, shift:8;
>> -        } d;
>> -        d.rq_id = rqd->id;
>> -        d.rq_load = rqd->load;
>> -        d.rq_avgload = rqd->avgload;
>> -        d.b_avgload = rqd->b_avgload;
>> -        d.shift = P;
>> +            uint16_t rq_load; uint8_t rq_id, shift;
> Split into two lines? Preferably with this adjustment
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks.

> I'd like to note that the remaining uses of "unsigned int" or plain
> "int" in some of the instances you don't touch assume
> sizeof(int) == 32, while generally we assume only sizeof(int) >= 32.
> This is one of the cases where fixed width types are imo mandatory
> to use.

See patch 5.  There was far too much cleanup to merge with this patch.

~Andrew

