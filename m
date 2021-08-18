Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AFC7A3F02C2
	for <lists+xen-devel@lfdr.de>; Wed, 18 Aug 2021 13:32:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.168200.307089 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGJo7-0005Ln-18; Wed, 18 Aug 2021 11:32:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 168200.307089; Wed, 18 Aug 2021 11:32:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGJo6-0005Iq-Tg; Wed, 18 Aug 2021 11:32:30 +0000
Received: by outflank-mailman (input) for mailman id 168200;
 Wed, 18 Aug 2021 11:32:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MkKE=NJ=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mGJo5-0005Ik-9N
 for xen-devel@lists.xenproject.org; Wed, 18 Aug 2021 11:32:29 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f7764268-0017-11ec-a547-12813bfff9fa;
 Wed, 18 Aug 2021 11:32:28 +0000 (UTC)
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
X-Inumbo-ID: f7764268-0017-11ec-a547-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1629286348;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=/zKdjQDHuBkmeGYVEs8zbZhM/WwCx7y/IQH6PoO0oVE=;
  b=TbxIXz0yKNXEl4BLN6Excs5r7FZ5Xfibu+mMNdZcdNGrCMwGzTPuxEgn
   gS80HpcyEWIJkOLxoadg0C4EQzJUUz8395xDE1CUs8xAPiQ1PHzAq10c4
   CQGkysBzIXAKxb+zu5z56hjUNFYdYYS9gsbvaFLZvapVhdgyXTS3rL6LS
   s=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: OwSaMcOZ12dbJ4NrNhn/OWGFFKaN6CJvDdpMTAnHC0PRAnHTSTY6YvNnivZKDXDby6oYFSDvz1
 /UpdZftj5GJJapqoavWCzYhVfB8C+gi7Pph0swT/44dCcSCHrzWPdSkpie7YZue4F6goqqQp8h
 2vPBODkNaeOzWt9DcelkaZYOAkExQA/AccCB1leJTcl0w6Ccn0RmuOrs2XN8zbmr03BgzWM/pD
 b9wM6VrJL8/upenTmXhYT+wIH0qCLwvLxMnp7g4UYg3GWEr2H3rzxjKwH6SMI4YkJX+dmaAda8
 CX300HZD1aiO23YsorNAitt1
X-SBRS: 5.1
X-MesageID: 51113648
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:zYLs+aG+9HZMRdcHpLqFxpLXdLJyesId70hD6qkvc20pTiXIrb
 HVoB1E726OtN9IYgBqpTnhAsW9qXO1z+8H3WBjB8bpYOCGghr2EGgG1+GSvwEIdBeOgdK1uZ
 0QApSWTeeARWSS7vyKvjVQcexQtuVvmZrA7YquqAYKPHkaFNAf0+46MHfTLqQffmJ77PECZe
 ihD7981k6dkAMsH7GG7xc+Lpj+T1ShruOeXfaJbyRJmSOzZe/B0s/QL/CKtS1xbxp/hZMZtU
 TVmQ3w4auu99uhzAXH6mPV55NK3PP819pqHqW3+5goAwSprjztSJVqWrWEsjxwivqo8kwWnN
 7FpAplF9hv6knWYnq+rXLWqlrdOXcVmi3fIG2j8C/eSP/CNWUH4g169NRkmy7imh8dVRdHoY
 t2NiyixrJq5Fj77WnADpDzJl1XfkjemxsfeLko70C3F7FuOYO49eYkjSBo+JBqJlOZ1Ggge9
 Meaf014J1tADenRnjHvnZmytmlRG4yEReNSlUDvMv96UkWoJh0onFoivA3jzMJ65IjQ5NA7/
 7fMqtpnrlSTskQBJgNS9spUI+5DHfATgnLN3/XKVP7FLsfM3aIsJLv5q4pjdvaI6Dg4aFCwa
 gpamko7VLaunieTPGmzdlO6FTAUW+9VTPixoVX4IV4oKT1QP7uPTeYQF4jnsO8q7FHa/erBs
 qbKdZTGbvuPGHuEYFG00n3XIRTM2AXVIkQtswgU1yDr8rXIsnht/DdcvzUOL3xeAxUAF/XEz
 8GRnz+Nc9A5kekVjvxhwXQQWrkfgjl8Zd5AMHhjq4uIUg2R8pxWy0u+AiED+2wWH5/W50NDQ
 9Dyenc4+OGTEGNjCT101k=
X-IronPort-AV: E=Sophos;i="5.84,330,1620705600"; 
   d="scan'208";a="51113648"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i5qahST/jR0/AtXUJNeLz3je/hNvBAaZsfbDilDEQRyPStsxQlQFksg7AL9xWNuq17b6YC1eYwDH+s1XjbBESeA6h6tsjqTt26COYf9DzAlVcSayVlRiZJTZnzmiCULYSevwW0s/Q7eWhfcoHLD9PlZGkk2DAkVr8Fxjhxm339rvy1ENyez7aquoH2sUR+nroBryn+ujlttHODqDHLQnZ0Cy6xOj2wv9KKnaPFTxw29pZ8v8WdX39xpvJvFKXjZvcEsUu+AffF701TZTMUhjMKaoULA5sqftlIp6cmHgiBVkyWt1lJ9zteH2tUZ/ilcQ/4SK2kkIULDcmilmWPdc7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/zKdjQDHuBkmeGYVEs8zbZhM/WwCx7y/IQH6PoO0oVE=;
 b=IRj5fYzzDX0VMITB4TMFzCh7sGpZMrVtEc90PouAdSblji6ZkMA2fvrTC7eR0fUpQVsvWGFpj49Fx9/IRyXjMDhGdrU9Htb9MVojmdtg1sihITcLGC3PfMWu7AQBNUt9bg2I/3qG+M1FexrGX8hxi7R4dObe2CP26adFuFo/c0P0PkRiQVosPZDWsUtqIWwak0LAlrdcw/o4I1oRWJfUZ6DQcDtWLoIJCeez60+vMx3riuVdQhTvGvYZu0VoiIn/ukF6iaMbW/o3KZ2Pd9vt+izdQVA4C2rBQiDuIhXbBYCnAuSehuD/BcQpkyW1+8WWXelp5bEqlNT5YKbXqz7LbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/zKdjQDHuBkmeGYVEs8zbZhM/WwCx7y/IQH6PoO0oVE=;
 b=s0+GPYaAM/0InjaJ6qVUGKPmVpOPiznDUDjumiAmhy3QrOjElSXwIyzrh42SGRQHv7SDrjQ8euDixIp7B+HP+pE5aKt4pq0ZRQljHc83mKV5rCNuydwq+aa7i+pevhI1J4QHjl/QRBY+OfHej6oO/wWC0DMm106yJGQzO8IxGKM=
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Kevin Tian <kevin.tian@intel.com>,
	=?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?= <marmarek@invisiblethingslab.com>
References: <07ded368-5c12-c06e-fd94-d7ae52d18836@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] VT-d: Tylersburg errata apply to further steppings
Message-ID: <8a2edae0-bf00-a8fc-51a1-689cfd04e08a@citrix.com>
Date: Wed, 18 Aug 2021 12:32:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <07ded368-5c12-c06e-fd94-d7ae52d18836@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0133.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:193::12) To BN7PR03MB3618.namprd03.prod.outlook.com
 (2603:10b6:406:c3::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2237d489-acaf-44dc-5bd3-08d9623bda1d
X-MS-TrafficTypeDiagnostic: BN7PR03MB3617:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-Microsoft-Antispam-PRVS: <BN7PR03MB361747D5535204D36C686738BAFF9@BN7PR03MB3617.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cVvQLZgmzadWlEPbPIjpSk47WnR1kI4fdYwGN+RuAEusaqpJcA0tZsTkoZPaUdRqFHzMDLuT2OUM4+avcwsAhcZHaXxg7bsiIP6KiOdssHnpUooEatLwEEfIrRFac9oQIaPcIh2GPu/IBr/l7pcqWstzXk3sdW72JM9WxoHTU3KJ3DA5YF4FdwUF7T3WATFdCcF+JxVcwUNBQOoI8yWz1FvVSbXudpiZeciXc5PrL06qojq4JBBLMXnHatp70Jz7DRIly9YGb9AWwiug801omlM3wS+WPDQQTFpXskEQJtI4L3zkcFL9URChm6+bytJk63TjhXoFalWBPRagatubK3ZHuxBJjeTZXFD45l4R/wylA8mpP/HtRJ5jnrvzEmOMOgoXnk/evFwNph+APjbtAufYW/Qb/+QGMQPtlE3Ajb9ujOWJbEKfNB3Sk8lUZJgC8+AJiUArhAsxxlV91yjGbhbgOvaNp+IagYMv7JTVKMpl1m9/udgEMrtEXCwotlHnVdGWT8HiySKKuQdJJ3XFiJTFfgiy5APlvKZ7lkDIYQVN2ESEerQU79su1ufS3AUseQLmJhckjYbSDZDiUdRjlppfplZMo4qtMp+B6RcMw47AGUktuaMvHt8hiSlOCecuZpNDVTnLHXvUtR1LiWv/OiITtzN0yWMcTa4EiJclMaHV0lljGV6E7x8/7quLivDFRSlp9yBNkSMlbotG4+RT9sU+fIYyzVNcdmKjF+XPF3g=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR03MB3618.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(136003)(39860400002)(346002)(396003)(366004)(26005)(38100700002)(2616005)(956004)(86362001)(4326008)(8936002)(53546011)(6486002)(110136005)(186003)(66946007)(16576012)(66556008)(66476007)(31686004)(8676002)(54906003)(36756003)(478600001)(31696002)(83380400001)(6666004)(316002)(66574015)(5660300002)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aGI5cW1aYkFiV0oxWnZEZ2xwVEtCQVoyQy93U3FRRkkvcFhiSGFTdHZRQko4?=
 =?utf-8?B?a2FYL2J2a3JtcDNINnNRa2NENnArV01KMlo4NjY5RmN1emprangrWHZwRFZ6?=
 =?utf-8?B?TmxuenFGZ3N3L3VtSzlQTnl3N0Y2S2U2eUhDNlduUmhMdGo4c2YvUlRLYTV4?=
 =?utf-8?B?bWMrYWpWQ1BnejNGQVN0MENydm9oWFpaTTU0ZWR3OTZvelFkM1Y2emdxOGpo?=
 =?utf-8?B?SlI5V3BSbDF1Ny8rNFRWT0VxZStOVXJMQjhPQnRrT1Zudy9nUnd4dkxML0hl?=
 =?utf-8?B?SjMrenlYRFVTdzRTQ2JFTWtMOHFOZXJuR2JrUE10SWh6M1JUbkVnZzROUGNZ?=
 =?utf-8?B?eVprTm0wVVJpM25YS2VEckM0VlUzck9nUTBjbllhNzBtcHJ6Z2F4S280VlFU?=
 =?utf-8?B?WW5hRTBCbTl1LytzaGNLZkpkNkk3eXBTMlBKajR0Ryt3N3ZaVUR4NGVZYXJj?=
 =?utf-8?B?U1NVdHhCN3JGVlVZQUIxNFErTDVzSnQrTXRBVlZmdDlYdjF4c1lGRjdVUndQ?=
 =?utf-8?B?MS9iRW55VTZ5aGxxOTJxaEFPczB5T2s4ZHJxamV2NXBKTVNGU0JrZnF4dGhs?=
 =?utf-8?B?TlZ3VStNZHRFcEJQYXFSbVlhd3lhc3IvRzUzMFZ2U0VnWUNRTTJYOWlKOGwr?=
 =?utf-8?B?dUw4VjQvaDlBQjVLbTNuUHUvSEpYVG85ZC9tSFNtQXNqQVFyVzZ0TjV2NUE2?=
 =?utf-8?B?TUw5bTJSeG52YnBwWjhadUZqclFSeWs2VDNVbmUwNUxGNUFRVHRSaDMwMmJ5?=
 =?utf-8?B?SnFiWVpmU0M1K0FtbWZGMUkyMWFYYWdsK2NZNEkzd2VzWkZoVmlkTUxheXND?=
 =?utf-8?B?c0Riem9WQThubmZTYnM4UGwxblo4WkFlTmtkUDJmUzBjUjBqZWdkTEJCRmox?=
 =?utf-8?B?bVEwTGVYMHV4czY5amdacENsVFhPUlFWaHFpYWxzUXNNaTZVSWtDSDcvbWhj?=
 =?utf-8?B?dHRTNkxjWFBvSVVseWtVMU4zVFFYbFdBZEd4dm4xazBkMS9HdTBvUzZndXp3?=
 =?utf-8?B?eVRqWDg1V0dKWkx6dmdzNU9EWldpcHdCeHBGVW1RbVJZbERKdyt5cklnVVAz?=
 =?utf-8?B?alZMTjhNcC84RWdjOHR2UjEvdk8xTGFTMUZTNmRBUUZsa1UrYWxxOEFJdk9X?=
 =?utf-8?B?S2RUT294OWpsRE9idEo3a3RjSlU4enpJZEMzc0tzWWJPOVRKUW8xeE56dk55?=
 =?utf-8?B?ZEd1d1BtVWZFWkVSMW1pZzFtL3h5ZVB3eHFNYUw4U1Q3YUQxbEVmQVd6azlw?=
 =?utf-8?B?YTV1Z0J0WXdPbmJJQ0EwL3ZNWmY1cTVhcXA5OWpheDZHdFpCQ3RzSWlkQ0d6?=
 =?utf-8?B?VGhhdHZTVmlJVXhPOWxqZ09ueHJNLytrK0tOMFBWcHNDL2lwdWFGRkVPY294?=
 =?utf-8?B?V0lEd1VPSjIzSFF1UEN4WXBkUW5aRFlpT05wNEF4ZVByMFBZaEVUc1BiU29q?=
 =?utf-8?B?SjBUenVrUTJvbDI2TTBRQlR4M2RqL1A3MHZ3ekNtSkx5Mkl5YXdLK0VZS2Zo?=
 =?utf-8?B?aWU2QUxSQXJIb0VCTUJ2QmpIVmw2cU5aTFVUdks0YmV5MlpJWkt6bm1vZmxZ?=
 =?utf-8?B?Zk5mTW5TaGFiL0F3aC9kRFpSNk9rZWk0bGhGZlcrc2pQSlNkRU40b1kzSFpx?=
 =?utf-8?B?dVY3QTRKNXBrWk1Fc0xnUVJxS0V2Yjg0bEZSM3cwc00yR21LQ1J4dDMxM285?=
 =?utf-8?B?NmlaT2JUeTBYb1hidlIrNHFZVWpaK01MMWhueGx1K29GSDN2a3drTGJiRGwr?=
 =?utf-8?Q?fx3APyaEOF15oBRuJzGtD4duTQ1c6EVsrA6WiS1?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2237d489-acaf-44dc-5bd3-08d9623bda1d
X-MS-Exchange-CrossTenant-AuthSource: BN7PR03MB3618.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2021 11:32:25.3184
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1a5+H7N7rnmlHkuvsqC8V5pxiAyio0FDwNkCO0MPzGlBkn2OpykQtlO5hP8PBwWlZ3VbE4oayK6YeAHVwWBfx7LJJi/xv9Wt+abdvSR3SG4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR03MB3617
X-OriginatorOrg: citrix.com

On 03/08/2021 12:13, Jan Beulich wrote:
> While for 5500 and 5520 chipsets only B3 and C2 are mentioned in the
> spec update, X58's also mentions B2, and searching the internet suggests
> systems with this stepping are actually in use. Even worse, for X58
> erratum #69 is marked applicable even to C2. Split the check to cover
> all applicable steppings and to also report applicable errata numbers in
> the log message. The splitting requires using the DMI port instead of
> the System Management Registers device, but that's then in line (also
> revision checking wise) with the spec updates.
>
> Fixes: 6890cebc6a98 ("VT-d: deal with 5500/5520/X58 errata")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> As to disabling just interrupt remapping (as the initial version of the
> original patch did) vs disabling the IOMMU as a whole: Using a less
> heavy workaround would of course be desirable, but then we need to
> ensure not to misguide the tool stack about the state of the system.

This reasoning is buggy.

This errata is very specifically to do with interrupt remapping only.=C2=A0
Disabling the whole IOMMU in response is inappropriate.

> It uses the PHYSCAP_directio sysctl output to determine whether PCI pass-
> through can be made use of, yet that flag is driven by "iommu_enabled"
> alone, without regard to the setting of "iommu_intremap".

The fact that range of hardware, including Tylersburg, don't have
interrupt remapping, and noone plumbed this nicely to the toolstack is
suboptimal.

But it is wholly inappropriate to punish users with Tylersburg hardware
because you don't like the fact that the toolstack can't see when
interrupt remapping is off.=C2=A0 The two issues are entirely orthogonal.

Tylersburg (taking this erratum into account) works just as well as and
securely as several previous generations of hardware, and should behave
the same.

~Andrew


