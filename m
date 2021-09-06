Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EC1740205F
	for <lists+xen-devel@lfdr.de>; Mon,  6 Sep 2021 21:20:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.180217.326783 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNKAh-0001zY-Nu; Mon, 06 Sep 2021 19:20:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 180217.326783; Mon, 06 Sep 2021 19:20:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNKAh-0001wW-KO; Mon, 06 Sep 2021 19:20:47 +0000
Received: by outflank-mailman (input) for mailman id 180217;
 Mon, 06 Sep 2021 19:20:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4nFA=N4=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mNKAg-0001wO-5F
 for xen-devel@lists.xenproject.org; Mon, 06 Sep 2021 19:20:46 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 886da6f6-0f47-11ec-b0b7-12813bfff9fa;
 Mon, 06 Sep 2021 19:20:45 +0000 (UTC)
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
X-Inumbo-ID: 886da6f6-0f47-11ec-b0b7-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1630956045;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=H61zcukOsd/RVg3l1xWthoBS5YMimXZXBl98tbnD6FI=;
  b=Df2OdeIy/91r3qNvShzwS1NF/u6F++BNrhn2vX6knTtpfyNrvdbvlWkB
   +e3OMrmHWJKonTJzrdC6/HPVluM35t7uVf0lujoFZcoWUeMWU6TysX6bU
   jfSPch2/3QL+eE3aUxk6B/8uKOAj9t53J1rgEmDfZ7vpCfQBwhonCfb2l
   I=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: chvutixBMXO4o9wIBt7vAERNdpsTi9K22ZuepRfmz0jbKVhtqmqH1n67h0VE2dHk6G472gBwFd
 SSa/G/D5zr++T9NkRIt0q4yZbZWL/LherjNmlm9QpJVkKhP94/S/eVXS0uSoWvWSP8ozQCc0WB
 xN2Kor5HpT3YD63lON/ofI6owo7P1tLYJpvr0s/L4e8szxvPohLATv1L7AHpsActgzL4VoWiDm
 4lPHcsCuYpK08ZUutAno1B6KOyeIqRavMcImxDW/4QELluCifYGPiad9USUSi3WDmesU5LQTM5
 VSrka9UlwV9tFjJ5BWGkvFlr
X-SBRS: 5.1
X-MesageID: 51711369
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:QiVGLaBckZwM40blHeg7sceALOsnbusQ8zAXPh9KJiC9I/b1qy
 nxppkmPH/P6Qr4WBkb6LS90dq7MAzhHPlOkPUs1NaZLXTbUQ6TQr2KgrGSuwEIdxeOkNK1kJ
 0QCZSWa+eAfWSS7/yKmTVQeuxIqLLskNHK9JTjJjVWPGZXgslbnnZE422gYy9LrWd9dP8E/d
 anl7F6T23KQwVoUi33PAhIY8Hz4/nw0L72ax8PABAqrCGIkDOT8bb/VzyVxA0XXT9jyaortT
 GtqX222oyT99WAjjPM3W7a6Jpb3PPn19t4HcSJzuwYMC/lhAqEbJloH5eCoDc2iuey70tCqq
 iCnz4Qe+BIr1/BdGC8phXgnyHmzTYV8nfnjWSVhHPyyPaJDw4SOo5kv8Z0YxHZ400vsJVXy6
 RQxV+UsJJREFfpgDn9z8KgbWAoqmOE5V4Z1cIDhX1WVoUTLJVLq5YEwU9TGJAcWArn9YEcFv
 V0Bs203ocXTbqjVQGdgoBT+q3pYpxqdS32BXTq+/blkgS+pUoJjXfxn6ck7zE9HJFUcegN2w
 2LCNUwqFniJvVmGp6VP91xNPdfPFa9CC4kAFjiU2gPK5t3T04li6SHqondt9vaNaDh8vMJ6e
 L8uRVjxDYPR34=
X-IronPort-AV: E=Sophos;i="5.85,273,1624334400"; 
   d="scan'208";a="51711369"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CHw+64Wk2BTMd+YYZFxdW6DqgeYcdyEoeSZwE7ry3VaDncZQ90fPaiWWMDzbzmbVKfAt5Km030hAqFbyR7sbq3PBbhPNFnFlP3uSdK+XYHVy2TU5p80C4sFNq2LEXHFueT15aJy0gDooHRRC3cOgU1vXEPxK9Mx8uspnOR1pvo8gtTctvmXwSsUoUMXyjIiyJ73njzqpuyxOUh2mZ4A2AEklQ5wWqw268mGmUXlGG9sFqo/M832Vsj63WUSncv3Q7kPGdGe54euxKxjN/5xBp8jrql9TmjHe8dPnlQe5YPz4Osr+H++xvXwZ6nT9fDY3lQpdxRhesuNppn8afRvRRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=068ibvkm9tu8zkK4YojlwHtkjfAJ7acXP/CA6lRGMLE=;
 b=j2t8LqYRK4Wm1KvdTLCxsqQDPhZbmXumtoPKtErpvfP64VyXGfqOo1yHcHEGHEFpf732nGJ2vNtYkCtY9FNWS7+Jc8SazGXTvBFKbc3CODnudTYI/+Z+A6qGlFQ+c4tSaFPZ1q2RGNYxZ896ZHJb4iuDOWWUnJVw6MBPvZ6Us2iwqQs/KL4+R3AqvtbAu9dAz9aVUmr8WJLuW5+uWxweKj1O9bR62AlEY0jqYInuWDx0ZppW5rJPJLDqeCdf2L8LD8qqbM3dhxTV+lvdbocSHL2qBIz6hSTWcgDjRB8VdZT8Cw92RN3db5nlntC/0fHYHgksYW6MgjkjV+U5LAjJMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=068ibvkm9tu8zkK4YojlwHtkjfAJ7acXP/CA6lRGMLE=;
 b=X50ZueyKqIDDI6jcm8U+aRaJAxwncZKFyimLHMrsLW4FilmLuVhsOjEaahQeNnat0YRupyZJRsvWXz69grjkYJQn+SIy9Sk9FmLR3vaEtDs1o3xmlecHPyQmdmi+yU59uxbpWaDA4UkIlJBLnhmWdWG9s71h+RZlcKUCBwFrGdw=
Subject: Re: [PATCH v1 1/2] x86/cpuid: Expose NullSelectorClearsBase CPUID bit
 to guests
To: Jane Malalane <jane.malalane@citrix.com>, Xen-devel
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Pu Wen
	<puwen@hygon.cn>, Andy Lutomirski <luto@kernel.org>
References: <cover.1630929059.git.jane.malalane@citrix.com>
 <239f7624f3ac3793993dc045d451079aa555b90d.1630929059.git.jane.malalane@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <7a87358a-37b9-0292-b6bd-ef33026426df@citrix.com>
Date: Mon, 6 Sep 2021 20:20:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <239f7624f3ac3793993dc045d451079aa555b90d.1630929059.git.jane.malalane@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0298.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a5::22) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 12ed33ea-445c-464f-425d-08d9716b69af
X-MS-TrafficTypeDiagnostic: BYAPR03MB4613:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB46137B5BA3A1667BE4F2C02DBAD29@BYAPR03MB4613.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:473;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bHLgaBrnZVAhvZtlQF7KmqGveJTVlUhoml1r8gFhUzKSXgmraMn7osDf1qkAuoM+eoCqV4WqIZn8ujU3OhhHIIBwBaiEi18Qp3hAxmzl3K/Pg9o+/EOatKy0Scb/x6LAvaJPZG6hVLZCRhNFDEXbQhQlovQuFD2oXCsGNFMp49zdMMOmHyrwap5segWk/RVXBpus18yeeli2X+/U6gtAKFZB/bRR0O/MCmC0+3Fmv0fiwPAvT8tF+W8QccK8AHLK8wOUQoOpyfgSCz0VKJ9ALn+FXip7xdAkZk7shbEWJDPcRT87WJLgJMZGzAJfUFC75jySvZJKDLKCzE6h5KnpOQ6UHAXs34lVD25ZIRVy1cfU1pWVKZNvcnJojoEjmZ53kFiRu1lylpCBd7H3tF2fR3cj08LOI+KgA1JcZ2ic4xvoQ7rA+i1tOxr8Chkz+I73r5E3p5gCnUPEWT8mQbvpcOyo3589sc5Tw5L+q/wm80/YltREpLyiFNaAefPdS1/zD2REKpgPK/3aY9urofSB3l+LFYhS3PCk2hzHockacEpOinchZ/81PnSVE8H5mD1CpPvF8lGF9mO56QOLSOaa+r0flSwFXqI+D5c71cIdf4N5ROPPktC0KmZtwTTCXcrIGYODSdy1YVD7II8m3KEA4mzdyt3IsOh9UToAxrVeOz2pxC9eSBTm49cHjJJAoYq4Gf9rEK5H7RyXmzT+QBlHUjtxX5cpuGqYXwvHqqDzSlUTrbsA8nQRkSK0ITEfAFTv
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(366004)(136003)(376002)(39860400002)(396003)(8936002)(110136005)(54906003)(478600001)(66556008)(66476007)(31696002)(316002)(38100700002)(2906002)(16576012)(2616005)(66946007)(31686004)(26005)(956004)(36756003)(6486002)(55236004)(186003)(53546011)(83380400001)(5660300002)(4326008)(8676002)(86362001)(4744005)(6666004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dUNIOTREK1BSZzhwUU0ybW9DYW5NcVZUR1lEOWNOK0JVb3JBeVRLL0g5N1Rm?=
 =?utf-8?B?OER6WVAyTmsvTm5BaTN4bmRTMXVZUnlRK3V1MVJReGV2VHhvbTlVaDhiaHM2?=
 =?utf-8?B?UEQ5T2lUVys5QXQvRGZGOHRNOGc1TkNjbnVxRjB1KzVjclRtVlpHOVRoK055?=
 =?utf-8?B?c2dUZnVOZERqRFYxYk5xelRReXNkZkRHMklCNGtvd3Q1S0dDQStVeGpBV0cy?=
 =?utf-8?B?NlFWOXhSWFgyY29zZ2NESEEyS0FNbSsxbXFraGhUa01pdWpjM05mOE5zbzdH?=
 =?utf-8?B?VjIzaUJHTUxxQTUzYm9CRmszd1AyVHBwMWM4WjFrUkRCdmU1Tk52RlUvQ1Jr?=
 =?utf-8?B?MEFuejd6aUVzK0dDbEpNMHE2c0RQZm9uRUp1N3kyUmozYzIveHU0OFM1dzVI?=
 =?utf-8?B?TklJN0RRcWVuOHpUTGJZV21WRFZtV0xySGhWd2lBVkdJUGxpZzI5L1crYkM3?=
 =?utf-8?B?eWxBZnRhdk5OL0VuUUtLcHdnc3dWZUlOL1RYWk1KU3pPOHpJY2tEUTZLNmk3?=
 =?utf-8?B?MFI3dk9RYmhRM3d4YVAvWDZkbk5NSndFSEp6eGVLZitIMCswclFzdVljNHU2?=
 =?utf-8?B?V2s0RGx5c3I0dUxZdldRRVNvOGluY1JZOC9sOWNEMTZNK3FKN0FyS1VkbGNM?=
 =?utf-8?B?V0plM2N1NFBSek9mSCt1aHdmclNTQmpIU0ZmMSs5VzJ2V3FhQm1GZHdGZ28w?=
 =?utf-8?B?ZkVIUXJiU2taUjVKSjNpMmpMZkZlWmt4UjJHTjlLUlZFSC95WUxvMDBKeEhV?=
 =?utf-8?B?YXVsR016WkxEY01pTzdxUFFyNkNEUVNJdjZLTWh1ZTZuZTcxVzFsUmtmTUNY?=
 =?utf-8?B?clF6blJOZzZ0S29PeHNUaEdMWWdGTVNPditqVnF2bXMzL0pJMXpCRm1ZOHZm?=
 =?utf-8?B?RkNRdnRvMUdBYnViMmNGQXdQR3AvcnFBOTdJQjlvOEtPbkhUZTdIeDZqQTFU?=
 =?utf-8?B?dTR0UXh2TlQveXdSVDJ0WUNNeEVkMGpUY2Fib3hlNFozSmF6UlRxWHN3R3Nw?=
 =?utf-8?B?b0JMRDVEdkJTUm5qVDVGSXN5VUpRempKOVJvc01ZdTkzTGxaU1hqWjBmMW1B?=
 =?utf-8?B?R2dKNGdKVW1taVNOdHZXalhMb0JDdFBOMlhmWGMvMHdUK2Z1WnZtbWpTd0Rl?=
 =?utf-8?B?ckgzeUFGV3U1U29xVlNBTFZDaEdidEdOb0lSTFErSWF5NDNId3Q3b2U0Qlly?=
 =?utf-8?B?YUVlWHFFSC9LREh3Vlg1MjZqa3pqcFozUlA4M3dsdllFRVdKNmpUVFVqaTYv?=
 =?utf-8?B?eUtoekg4Ni9hRXg3R3BwVlhGR1lOeU5QcENkZGRlZUlTeTlGOEZBckxDMUJy?=
 =?utf-8?B?eEhvQUJjUWRlR3o1Y3dIamJGazdUb1JTNmNNWGdxSi90V1duU3NXNVpzMEE3?=
 =?utf-8?B?UjlUdWJneVl2aUVqTUFJamdVWTUwNEJTMks0UFNKRDB0dk5FNWdjVzNmZGZi?=
 =?utf-8?B?cDBhazErOWsxRGZFVjBMZU90dkpjY2JWakhXVUhYTXNDZ0I4SENLNEN1WkJ0?=
 =?utf-8?B?azc3UDhkNXh4Z3hFRkdWVkRBNEpuM08xU2xDNkI3aGJ0TkVKWVVwNlBiZ1gv?=
 =?utf-8?B?NHVvVDZzQjN1dFBiTGFXUkhDNUpLTFowVXhxcGdGYUUzTFFPR1MvZXdJUita?=
 =?utf-8?B?QmxsbTBsMmVNZ0hVNHRUa2FBQ2t0aWNMN1F6dUEvMVRjU09SMFRwL0pqMGky?=
 =?utf-8?B?Z29ZcVUxb0c2NmxYK09NOGYySjM4SlI2S09UWGp4WEY5NEp3Uy9FbXp1TEZ2?=
 =?utf-8?Q?IpKHpJl04r1ncYD+FvDL1ie/y2In0JAGSgCP3F3?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 12ed33ea-445c-464f-425d-08d9716b69af
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2021 19:20:39.9318
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 86owFCx1sifHqc1llDU1ZFMf6FVCSNdgxChXxjlSdIQBukaXwtwFtio6zacjNiXUMrp3xorTVenO+9iGjv8J57s8axY5JwOylbIqWFVRTDk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4613
X-OriginatorOrg: citrix.com

On 06/09/2021 13:00, Jane Malalane wrote:
> diff --git a/xen/include/public/arch-x86/cpufeatureset.h b/xen/include/public/arch-x86/cpufeatureset.h
> index 380b51b1b3..e5a7c94c78 100644
> --- a/xen/include/public/arch-x86/cpufeatureset.h
> +++ b/xen/include/public/arch-x86/cpufeatureset.h
> @@ -285,6 +285,7 @@ XEN_CPUFEATURE(FSRCS,        10*32+12) /*A  Fast Short REP CMPSB/SCASB */
>  
>  /* AMD-defined CPU features, CPUID level 0x80000021.eax, word 11 */
>  XEN_CPUFEATURE(LFENCE_DISPATCH,    11*32+ 2) /*A  LFENCE always serializing */
> +XEN_CPUFEATURE(NSCB,               11*32+ 6) /*A  Null Selector Clears Base */

On second thoughts, I'm tempted to add " (and limit too)" to the comment.

Can be fixed on commit.

~Andrew

