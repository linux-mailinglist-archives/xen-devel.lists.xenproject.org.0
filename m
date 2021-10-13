Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CF0342BEEE
	for <lists+xen-devel@lfdr.de>; Wed, 13 Oct 2021 13:31:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.208259.364318 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1macSl-0004D1-Gv; Wed, 13 Oct 2021 11:30:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 208259.364318; Wed, 13 Oct 2021 11:30:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1macSl-0004AN-Da; Wed, 13 Oct 2021 11:30:23 +0000
Received: by outflank-mailman (input) for mailman id 208259;
 Wed, 13 Oct 2021 11:30:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EFKL=PB=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1macSj-0004AH-Jj
 for xen-devel@lists.xenproject.org; Wed, 13 Oct 2021 11:30:21 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 65dad2ca-42c3-445b-a7cb-57c499c23457;
 Wed, 13 Oct 2021 11:30:19 +0000 (UTC)
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
X-Inumbo-ID: 65dad2ca-42c3-445b-a7cb-57c499c23457
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1634124619;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=hepfCb6IOMzF5/6eeMYgNkwjUmiMZsGwPw6WDhyR/Ko=;
  b=bM31l9NvVhfEeUJdleJ5cZGacthV9TJAJAECXGI/W/5YfRX2u7TuvLvv
   Q+gUWpB1+/7yrBUhWhhioQUrc6txtmhfyhZDr+g2YPlQvOJmvIJ1RtYFY
   gsr9mN1BeP2pJPsa7ZaFYv3nx2TKeBbrxLEqrvNAfhKjeV+pjAe3lb0wa
   Y=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: GXeTiB2SgyDvJm3fPzDtkzy0g6gT0dKMvnX2obLRZhe0olS2wK8UJZwxWJJm+lJGd/mQgQvjm1
 7tMik9700+oYOztd/ScvLYDlT3Q8D4u9TzGf0o8HQNcbYUb+3sXBewCVAOlC0MyDfjddcvoQQA
 6KRCC7uCaV8Dcd98w3LKMjM+QecTUNABLfZEmo2HXBwErztugCYaj3zJK2TEjrNiI/x8vH3hVF
 7nwmiHfxbwMLBtnMykvV7XznN4MNvSZYqaXNG7p4Fn/c8oBCJ4E5ib3mgl1PPvStQLTcuP22K0
 Nmd7ZinQbvHnhHwMG040ELMn
X-SBRS: 5.1
X-MesageID: 56954599
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:+YSsh6wmWtlzEcfpu4p6t+cAwCrEfRIJ4+MujC+fZmUNrF6WrkUHm
 DNJX2iFa/6PY2ShcoxwPNuy9RsHusPTxtJrGwY/pCAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnvopW1TYhSEUOZugH9IQM8aZfHAsLeNYYH1500s6w7di2tcAbeWRWGthh
 /uj+6UzB3f9s9JEGjp8B3Wr8U4HUFza4Vv0j3RmDRx5lAa2e0o9VfrzEZqZPXrgKrS4K8bhL
 wr1IBNVyUuCl/slIovNfr8W6STmSJaKVeSFoiI+t6RPHnGuD8H9u0o2HKN0VKtZt9mGt/9d5
 vVOn6a/cxl3Gq7Pkr8WaV5AOj4raMWq+JefSZS+mcmazkmAeHrw2fR+SkoxOOX0+M4uXzsIr
 6ZBbmlQMFbT3Ipaw5riIgVort4kI8TxepsWp1lrzC3DDOZgSpfGK0nPzYIGjWps25EfdRrYT
 +swVzFzcj3cXztoMW00U7QgxMOqqFCqJlW0r3rK/PFqsgA/1jdZ0rLgLd7UcdyiXthOkwCTo
 Weu103jHhwfA/mOxjOE/2yEi/fGmGXwX4d6PLe17OJwiVufgGkaEgQLVECTqOO8zEW5Xrp3L
 EgZ+TEnq6Qow0WtQsPgRB2zoHOCvRk0VsJZFqsx7wTl4rDd4xudQHMFSDFBQNU8sYk9QjlC/
 kGOm9TlFDl+qoqfQHiW9qqXhT6qMC1TJmgHDQcUQA1A79T9rYUbihPUUs0lAKOzlsfyGzz73
 3aNtidWr7wVgdRRj/3j1V/CijOo4JPOS2Yd5BjTX2+jxhN0YsiifYPAwV/f4PVbJYCVVG6dr
 WMEkMiT6uMJJZyVnSnLS+IIdJmy/OqMOjDYhV9pHrEi+i6r9nrleppfiAySP28wbJxCI2WwJ
 haO50UBv/e/IUdGc4dYT6yRCO4QwpL+S/DmVfqPZeAJerFuIVrvED5VWWac2GXkkU4JmK45O
 IuGfcvEMUv2GZiL3xLtGL9Die5DKjQWgDqJH8iinkvPPa+2PSbNEd843E2ygvfVBU9uiD7e9
 MpDLIO0whFbXfyWjsL/oNNLcw5iwZTWA/nLRy1rmgyrflQO9IIJUaa5LVYdl2pNxPs9egDgp
 CDVZ6Og4ACj7UAr0C3TApyZVJvhXIxksVUwNjE2MFCj1hALONj0sP9BK8FvJ+V8qISPKMKYq
 dFeJK1s5dwVG1z6F8k1N8Gh/OSOijz67e5xA8ZVSGdmJMMxL+A40tTlYhHu5EEz4tmf7qMDT
 0mb/lqDG/IrHl06ZO6PMa7H5w7h7BA1xbMpN2OVc4Y7RakZ2NUzQ8AHpqRseJ9kxNSq7mby6
 jt69j9B/bOT/NRvrIWQ7U1Gxq/we9ZD8oNhNzCzxZ69NDXA/3rlxolFUe2SeivaWn+y86KnD
 di5BdmnWBHetFoV4Yd6DZhxyqcyu4nmq7NAl1w2F3TXdVW7TLhnJyDej8VIs6RMwJ5fuBe3B
 R3TqoULZ+3RNZO3CkMVKSokcv+HiaMelA7N4KlnO079/iJ2ouaKCB0AIxmWhSVBB7JpK4d5k
 /w5scsb5lXn2BonO9qLlA5O8GGIIiBSWqkrrMhCUoTqlhAq2hdJZpmFUn3655SGatNtNEg2I
 2DL2Pqe1uoEnkebKig9D3nA2+ZZlK8ighESwQ9QPUmNl/rEmuQzgE9b/wMoQ1kH1R5Aye9yZ
 DRmbhUnOaWU8j50r8FfRGTwSRpZDRiU90GtmVsEkGrVExuhWmDXdTBvPO+M+AYS8n5Gfygd9
 7adkT63XTHvdcD3/y0zRU869KCzEY0vrlXPyJK9AsCIP5gmej600KahaF0BpwbjHc5s1lbMo
 vNn/booZKD2XcLKT3bX12VOOWwsdS25
IronPort-HdrOrdr: A9a23:rRUdoKtTgif8e4Ucrf1zJbJt7skCkoMji2hC6mlwRA09TyXGra
 +TdaUguSMc1gx9ZJhBo7G90KnpewK6yXdQ2/hqAV7CZnichILMFu9fBOTZsl/d8kHFh4tgPO
 JbAtVD4b7LfCZHZKTBkXCF+r8bqbHtmsDY5pau854ud3ATV0gJ1XYHNu/xKDwReOApP+tcKH
 LKjfA32wZINE5nJfiTNz0gZazuttfLnJXpbVovAAMm0hCHiXeN5KThGxaV8x8CW3cXqI1SvF
 Ttokjc3OGOovu7whjT2yv66IlXosLozp9mCNaXgsYYBz3wgkKDZZhnWZeFoDcpydvfomoCoZ
 3pmVMNLs5z43TeciWcpgbs4RDp1HIU53rr2Taj8A3eiP28YAh/J9tKhIpffBecwVEnpstA3K
 VC2H/cn4ZLDDvb9R6NqeTgZlVPrA6ZsHAimekcgzh0So0FcoJcqoQZ4Qd8DIoAJiTn84oqed
 MeQ/003MwmMW9yUkqp/VWGmLeXLzYO91a9MwQ/U/WuonlrdCsT9Tpc+CQd9k1wg67VBaM0o9
 gsCZ4Y542mePVmGZ6VNN1xMfdfNVa9My4kEFjiaGgPR5t3c04klfbMkcAIDaeRCds18Kc=
X-IronPort-AV: E=Sophos;i="5.85,370,1624334400"; 
   d="scan'208";a="56954599"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bH0uIt9Hzp73WU3OlxPwDSI5uxWYFIBOiXP+0c1rbotHMVcjBVq2jAGXPhPmUg4ZsBxMilWvMtQXb4DgjSY7XzbKN9cvE/piLvV1DfD443sd5EdIzYHm/HoiQ1T+LxDffZomyvZab8/L54EIIbjR88SJ8BTpVqLnfT6Xk4OQpf3aUQohcAmV0k4N4qtiySjct5VhVmCLyf912USqUCfNtrgyncREyaeB8u40U6JG2lSlmTCMvzxeasR4dUYoCWnJq8b7dQwFTO+Au0pkFKthiyiugvZYEb6PX8OIjuLUGKOfjfff4xThBysBR+fHdem4FU8TcFkmrobICpC3LKSiuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TA/FmPNRk0cZoku0olp3BhDSjnZ2hhtSB3jGX+fnJq0=;
 b=oZ7fcSPVel/1Uann8c3UuPT9LrX5WA/o7p2aNUxT+8SATd5AD5igfbwDipm6kpdDE1vKAg19cyYmZe0E/cRfYCvBpPidYuFWlECpQOoO6ibSZCb0pbcOOFQ0zXTMOcNSQzhmrBOI3C5jfMuLPyXxaJbxnP3LKg2mZYNa2t7hUDw5Jr36jzdEYL0QEJ1hY+tWxUkaJgMvxbLZQosfRhGoqv/eLtIDlh0ANNH+sAT5CgTFAm7q+BoUYgh20eEAgaAo6pH7w1zpAwSkhTJ1HeHT9gLU8c/BD9dmzPY8YBIb3gCCqkJaUfkhW0bAoNYiwkhzIjVAcC/+EU8WzDDNOCut1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TA/FmPNRk0cZoku0olp3BhDSjnZ2hhtSB3jGX+fnJq0=;
 b=KJ6uF11gydZpVesouTZWDYl64U4oByfBMnvFX+S215JuLOcxUNEBXqzgfS+74pSNnjdJPWvJBPx0JMYRkXzkix46kFJKLFX3UTbNj9aic7aJHUi+jwLEqGSC5jbfCU5ajagGhTp14bUTRdG99M17GnXTI+XwmpWCWUEf8vd5FqI=
Date: Wed, 13 Oct 2021 13:29:55 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Oleksandr Andrushchenko <andr2000@gmail.com>
CC: <xen-devel@lists.xenproject.org>, <julien@xen.org>,
	<sstabellini@kernel.org>, <oleksandr_tyshchenko@epam.com>,
	<volodymyr_babchuk@epam.com>, <Artem_Mygaiev@epam.com>, <jbeulich@suse.com>,
	<bertrand.marquis@arm.com>, <rahul.singh@arm.com>, Oleksandr Andrushchenko
	<oleksandr_andrushchenko@epam.com>
Subject: Re: [PATCH v3 02/11] vpci: Add hooks for PCI device assign/de-assign
Message-ID: <YWbDMwC+6ehmGurS@MacBook-Air-de-Roger.local>
References: <20210930075223.860329-1-andr2000@gmail.com>
 <20210930075223.860329-3-andr2000@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210930075223.860329-3-andr2000@gmail.com>
X-ClientProxiedBy: LO4P123CA0409.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:189::18) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b4450ff1-cfed-48c7-d747-08d98e3ccb21
X-MS-TrafficTypeDiagnostic: DM6PR03MB5324:
X-Microsoft-Antispam-PRVS: <DM6PR03MB5324DD0DF300EC0E1005EDEA8FB79@DM6PR03MB5324.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: o7ULoj2PnXtYLm9USTe91V3QqsXUKfmYJSpDVwJGsQ1+ioiBQaaOfmRMaCeCYrDzW1norMAF4ONu3vk+GuUe/vo47rCU/KRRFyuOmjjbzSjmIsNeWHximnqgzq4nJ2/KdHyY8fcCelhx7IeoKtOvHdVG6ZsWlieWyWNVkJm5y+3LH3OYm45EJK9yHIa1gYMVtzaiCbI5VywL/2cph5Lg2jWxQZFij8L8fHtCndS+c3yTqPuU8iSkWCaEAH8n582seEARnpcRLfWz4imICjoXiIeeUBIeHVoT8jfPCslkOHUsN3KBocMvZ9vOIlHtXGUQN0xxtiJ8LKNwWRdAEOi57yrIUsH3df+QrgviONutTmXoFkSq+R0AsodRfccoXM0QtMAt3ThBdeIGuWptKwUuEsFD36OZ6NiBP/l4ComExUkQYmTPk+5akAMYMEhvhjWnDTZfmP90Cl7SdKTsWbLRVLybHtYcBHSmBC2JKniKb2XI5G4xmQwEJ2QaLqCToIviEALcwN1NytYFCccbN8sOVm8N5qkmf8w21qS0d7Xv8+MuWLJsnukZgT2e06RD9sW6veiGsJs+J28+TkdQhnTPeAG9RWt6lpwYvmRvmHVy/IaeLN9bXZLms1TLgkUSklo6jDiiKC8d0pGUOkIpwOtA8HXr4XLGp3MCR8If1bKD0nMEMx1PUNf+Q3fqf28wFp5MuCpK4+U5C1UECL1D+bl9NA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(956004)(6666004)(508600001)(85182001)(26005)(82960400001)(38100700002)(5660300002)(186003)(8936002)(2906002)(86362001)(316002)(6916009)(66946007)(66476007)(7416002)(66556008)(6496006)(6486002)(9686003)(4326008)(83380400001)(8676002)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WEpMMEh2TnRjSUJ5MWMrdzBVMnllNGxGRzJnbmk2VmRGQzFzSkRuY2wvVzh4?=
 =?utf-8?B?WTVBME5lMm9IdkgveXRYMWp3U2cyQ0xxelVsS0o1b05za2s1Zmo0UE9TcUlm?=
 =?utf-8?B?RHZjUjFwOEJ6bHNaSXFsZjg0NGtqOFlQWk02UEdXZ1UrdnZYbTIyRll6djJ4?=
 =?utf-8?B?b2M4cWFtZitqcDd5aU1pbkpEbTdjSDNpRWwyaVduTWM0emw5WS9QZGR0VzdN?=
 =?utf-8?B?ajNaWWRsYlloWGF3bFdidHgzRVhxSEd6RW9mZjdBREJzN0tPZHFFdUh4ODBD?=
 =?utf-8?B?cXpQZTRHWXc0eTZpNFpOZHJLNkp0ZTZGYVhidmRFY2lYUk5LenE2bXlMc0l4?=
 =?utf-8?B?TmxUTm1LUDcvZlRNV08ybVpKci8zMkNMWDF4RnBuWHk4RkFDSXlrRzR3b0ps?=
 =?utf-8?B?enl4dytLSXJ1YkJZOTdxdkJIVnFaUXpJL2lTamJsd2syK21xQlpRZ2Q0TVJE?=
 =?utf-8?B?Zit6M0hzTUJOUk5Ya0ZIWWVQWFh5RkdLSnlSSFhZOGpjU1g1Wk40Y2ZBaVdP?=
 =?utf-8?B?ekt1c0t4QW5reWxUY00wYzVOQjlEaGtCT0dmOXZ3TmFoRzlzalVhaG11N0xY?=
 =?utf-8?B?UG9MWEZHR3BpNEJQOExrMXRNb0NFV0VxRkhUUkhYbkRmeHhuaDVKT29paFF5?=
 =?utf-8?B?eVJySmZ0Q3ZZS2VrY3k5UlVsM3VqeitTZ1NmcFpjc3NFQk90L05SNHc0MFM3?=
 =?utf-8?B?QXpSMWlETkFydDVGN0tMMm1xb25vWm8yQlM5VExDQnh1OTMwSUtOQUtOWmVF?=
 =?utf-8?B?eWRWL0VuRTRua3EzUXpnby9hQWIvckJvT1gwcHJPbEFQNkt5ellvZ1VCS3cr?=
 =?utf-8?B?WmVMZlJEaG1BZ0pnSUQ5NHBRSTdTUjRlUEJPQ0RFdGVua0xSUWxibk83MFNV?=
 =?utf-8?B?dVhFaWxrSmsxdDA5Q3Rsa1ZKd0tSNHNmV3kyNmtOaDdDejhXcXBzMGZ2SGZU?=
 =?utf-8?B?OWUxcjd1aEJwSk10OUNOWkVRZURUdWg4eWJaM0JFTmNpL1R3N1huTmYrWHli?=
 =?utf-8?B?Rmc1cXluZUhWdnVXRDRFd2c2ZklVaGVQempacjUwYjZjYzFSa09yZzNOSktG?=
 =?utf-8?B?RkZEU3NKcHNzRnYvbFpiamN2MFdCSzM5a3F1MktkNkM2THBMQnRqVkVHSWdv?=
 =?utf-8?B?MmxIWFR4OERwZzNsVEVPWmg3SHYxU0xwd2s0ZjlFRGpHUm5SMTJ5TDVyVWlq?=
 =?utf-8?B?dlp4T0s1RUs1bTAzZEFESkJORWNPc2kwVE9yZmV4RzFLWFpPM3RLRE5LSC9Z?=
 =?utf-8?B?NHAvUE5LSG9TcWFlUmJOeExDYmlVMzR0UGVLNHNmM2F1dGxGdyt5b1RHU2lM?=
 =?utf-8?B?VHBmaVdWOHVVZEZxVUZIRDdOc0t1M1A5MnNacDVwSmFIM2RZQnV1VFA5VDI3?=
 =?utf-8?B?ZEwwQnJsWStPeEhFbjdLaXVlN2NMekNUWE9rOUNYWlJEYnV1Yld0dlVIK2ZJ?=
 =?utf-8?B?azMwRGpvS0tRUDF4eUlzUEl6SEFsa2F4WmJaeUhtaWhQSFd0TXhkS2xFSktw?=
 =?utf-8?B?NHVWd3E5emQ0NnFGOGFVUXkyNDRicU5Wb0hGaVd1WjFwOHVWdVBHZThGaEZy?=
 =?utf-8?B?enA3MlNsbmU5d1JiOWZpR0tQY1R6M3B2S2RacllZam5iUGVlQTlqNEo1aGRv?=
 =?utf-8?B?OWQ2Q0Ixb21mV3kyZVk5MG9WdU00WjBXUjhIRHoyRWozMnZNTzRGL2RJK0Vq?=
 =?utf-8?B?L2RBdGhRRXNabWpRZitsbXdjT3RJNVNsOGRWa1R2SGdLY3dZajgrczFYTjU5?=
 =?utf-8?Q?zSLEwW7D5/iGHAnm0l/L5o0e9eT2IOODOOFdV97?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b4450ff1-cfed-48c7-d747-08d98e3ccb21
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2021 11:30:00.7865
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y+8zLKj68qHWlikkDyaFcQlsShhIicHZspEbiBLQBK1PzAN1Uj+77r08U51/LkAn8CFLs9cDuMR3bHgpq9QY0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5324
X-OriginatorOrg: citrix.com

On Thu, Sep 30, 2021 at 10:52:14AM +0300, Oleksandr Andrushchenko wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> When a PCI device gets assigned/de-assigned some work on vPCI side needs
> to be done for that device. Introduce a pair of hooks so vPCI can handle
> that.
> 
> Please note, that in the current design the error path is handled by
> the toolstack via XEN_DOMCTL_assign_device/XEN_DOMCTL_deassign_device,
> so this is why it is acceptable not to de-assign devices if vPCI's
> assign fails, e.g. the roll back will be handled on deassign_device when
> it is called by the toolstack.

It's kind of hard to see what would need to be rolled back, as the
functions are just dummies right now that don't perform any actions.

I don't think the toolstack should be the one to deal with the
fallout, as it could leave Xen in a broken state. The current commit
message doesn't provide any information about why it has been designed
this way.

> 
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> ---
> Since v2:
> - define CONFIG_HAS_VPCI_GUEST_SUPPORT so dead code is not compiled
>   for x86
> Since v1:
>  - constify struct pci_dev where possible
>  - do not open code is_system_domain()
>  - extended the commit message
> ---
>  xen/drivers/Kconfig           |  4 ++++
>  xen/drivers/passthrough/pci.c |  9 +++++++++
>  xen/drivers/vpci/vpci.c       | 23 +++++++++++++++++++++++
>  xen/include/xen/vpci.h        | 20 ++++++++++++++++++++
>  4 files changed, 56 insertions(+)
> 
> diff --git a/xen/drivers/Kconfig b/xen/drivers/Kconfig
> index db94393f47a6..780490cf8e39 100644
> --- a/xen/drivers/Kconfig
> +++ b/xen/drivers/Kconfig
> @@ -15,4 +15,8 @@ source "drivers/video/Kconfig"
>  config HAS_VPCI
>  	bool
>  
> +config HAS_VPCI_GUEST_SUPPORT
> +	bool
> +	depends on HAS_VPCI

I would assume this is to go away once the work is finished? I don't
think it makes sense to split vPCI code between domU/dom0 on a build
time basis.

> +
>  endmenu
> diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
> index 9f804a50e780..805ab86ed555 100644
> --- a/xen/drivers/passthrough/pci.c
> +++ b/xen/drivers/passthrough/pci.c
> @@ -870,6 +870,10 @@ static int deassign_device(struct domain *d, uint16_t seg, uint8_t bus,
>      if ( ret )
>          goto out;
>  
> +    ret = vpci_deassign_device(d, pdev);
> +    if ( ret )
> +        goto out;
> +
>      if ( pdev->domain == hardware_domain  )
>          pdev->quarantine = false;
>  
> @@ -1429,6 +1433,11 @@ static int assign_device(struct domain *d, u16 seg, u8 bus, u8 devfn, u32 flag)
>          rc = hd->platform_ops->assign_device(d, devfn, pci_to_dev(pdev), flag);
>      }
>  
> +    if ( rc )
> +        goto done;
> +
> +    rc = vpci_assign_device(d, pdev);
> +
>   done:
>      if ( rc )
>          printk(XENLOG_G_WARNING "%pd: assign (%pp) failed (%d)\n",
> diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
> index 1666402d55b8..0fe86cb30d23 100644
> --- a/xen/drivers/vpci/vpci.c
> +++ b/xen/drivers/vpci/vpci.c
> @@ -86,6 +86,29 @@ int __hwdom_init vpci_add_handlers(struct pci_dev *pdev)
>  
>      return rc;
>  }
> +
> +#ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
> +/* Notify vPCI that device is assigned to guest. */
> +int vpci_assign_device(struct domain *d, const struct pci_dev *dev)
> +{
> +    /* It only makes sense to assign for hwdom or guest domain. */
> +    if ( is_system_domain(d) || !has_vpci(d) )
> +        return 0;
> +
> +    return 0;
> +}
> +
> +/* Notify vPCI that device is de-assigned from guest. */
> +int vpci_deassign_device(struct domain *d, const struct pci_dev *dev)
> +{
> +    /* It only makes sense to de-assign from hwdom or guest domain. */
> +    if ( is_system_domain(d) || !has_vpci(d) )
> +        return 0;
> +
> +    return 0;
> +}
> +#endif /* CONFIG_HAS_VPCI_GUEST_SUPPORT */
> +
>  #endif /* __XEN__ */
>  
>  static int vpci_register_cmp(const struct vpci_register *r1,
> diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
> index 2e910d0b1f90..ecc08f2c0f65 100644
> --- a/xen/include/xen/vpci.h
> +++ b/xen/include/xen/vpci.h
> @@ -242,6 +242,26 @@ static inline bool vpci_process_pending(struct vcpu *v)
>  }
>  #endif
>  
> +#if defined(CONFIG_HAS_VPCI) && defined(CONFIG_HAS_VPCI_GUEST_SUPPORT)

You don't need to check for CONFIG_HAS_VPCI, as
CONFIG_HAS_VPCI_GUEST_SUPPORT already depends on CONFIG_HAS_VPCI being
set.

> +/* Notify vPCI that device is assigned/de-assigned to/from guest. */
> +int __must_check vpci_assign_device(struct domain *d,
> +                                    const struct pci_dev *dev);
> +int __must_check vpci_deassign_device(struct domain *d,
> +                                      const struct pci_dev *dev);
> +#else
> +static inline int vpci_assign_device(struct domain *d,
> +                                     const struct pci_dev *dev)
> +{
> +    return 0;
> +};
> +
> +static inline int vpci_deassign_device(struct domain *d,
> +                                       const struct pci_dev *dev)
> +{
> +    return 0;
> +};

You need the __must_check attributes here also to match the prototypes
above.

Thanks, Roger.

