Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3FAB586709
	for <lists+xen-devel@lfdr.de>; Mon,  1 Aug 2022 11:46:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.378646.611953 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oIS03-0005MF-8L; Mon, 01 Aug 2022 09:46:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 378646.611953; Mon, 01 Aug 2022 09:46:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oIS03-0005Jr-5g; Mon, 01 Aug 2022 09:46:11 +0000
Received: by outflank-mailman (input) for mailman id 378646;
 Mon, 01 Aug 2022 09:46:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TwEK=YF=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oIS02-0005Jj-6E
 for xen-devel@lists.xenproject.org; Mon, 01 Aug 2022 09:46:10 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80077.outbound.protection.outlook.com [40.107.8.77])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c50ab931-117e-11ed-924f-1f966e50362f;
 Mon, 01 Aug 2022 11:46:09 +0200 (CEST)
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com (2603:10a6:20b:fa::20)
 by AM0PR04MB4785.eurprd04.prod.outlook.com (2603:10a6:208:c2::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.16; Mon, 1 Aug
 2022 09:46:06 +0000
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::f1f6:f171:49e9:b68a]) by AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::f1f6:f171:49e9:b68a%4]) with mapi id 15.20.5482.014; Mon, 1 Aug 2022
 09:46:06 +0000
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
X-Inumbo-ID: c50ab931-117e-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ROB8rIbdqDG95GIteoDOnlruKUi57QNNOr+L+ZJd0/iZYHDJuVYDceliL4OWGUW0JvyWkOHc9Ql+3qlI891CT4exMKXen0GoBejh5cxFCf/q+bfIiLDFXbHbeCVTB8Q6f/GjED42rDCEhbBkf5eW4uUTlg5us+jRI2G4HlOOB0RJLkQvB0E5DstaJlb5dPa5zUwBOKCOUVdcgX3LOlfQWHA3Z/YWm+TCspuXwzOnG0uavJ/HZMATpPB7xQqerUSFRUTtOwtBuvnOf1F/0sMTsvrbwt9e6LSY8MVNdr4ASpEXuihfcXeaiV9ZVaixPNuFHHvpjijuSYLuTUMkjKkKzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ch/l7iC9CTpr9NUxVrfR2M7RejyOnykUw5lHvY/Ji8Q=;
 b=aF7WMKpnbJK+B89Tdtdm6xnPiOTHCOtcqTfFHmoMtUU9l96vPQ8K5cF3TyT2pj+vm6MUfoHm4lhDq31xWtGq8oG8CTR5w6hXkvgyZSZsX0Zcp0rd0NMjqD6s9V19M7ApSLsTuxb3dvCfVUfPHVHB06iqw2nKHZRwgVUnr9RZUeTvRML9TA4kXjFAG8+rbV/ox8tUeo4Ncm0Dlm1PMo6oVx4n0LyPojKa5gbKZKJYK5WDxDwqW892QG1ftqClARG+MgSmmGvJFgG3r668kl0IzBk4sKIEimN3V0iAbf6VTlCBQWqW3JitoaeylaiQ4EBAAuarxkaT3Ze/oMW4nTPJaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ch/l7iC9CTpr9NUxVrfR2M7RejyOnykUw5lHvY/Ji8Q=;
 b=AlvQFJLxWjZGAKCNOLifHftbd7nmUdWhnnrJN6rOADCTsc89+tvziSAcGUriauIt+GBgTgRfv8pYRlpgR75Cz2Hg5p2+e4z5Ck5aOg9J8f/vE2GHlGKRoBzEAEHGZDOR7Ewko0JIlQouCIXFxAXxCRvBAqxUfZPa3DdnUUinikKey1wYu3EURPO9T5Bea36ms6J9NMLP5EkgL26GdAnVXvN1PVqQlR5Cs5kjI2/0gD2MOMu9lgVhnWZJ/i3DpL+N8BqObo0Jp1q17i/wB0adhWBPlmD3KmDEnnJYTD05+5CpHtykJI61yZP0otHi1H9EU23OSD7b7uWNiDYi6wgaVg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <38938738-7300-d73b-1221-1192d2b92c36@suse.com>
Date: Mon, 1 Aug 2022 11:46:05 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [XEN PATCH 0/X] tools/libxl: XSA-403 follow-up
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20220729132641.21221-1-anthony.perard@citrix.com>
 <7fa1b084-ef9a-976d-ddb1-b07cded96f08@suse.com>
In-Reply-To: <7fa1b084-ef9a-976d-ddb1-b07cded96f08@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0086.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::13) To AM6PR04MB6551.eurprd04.prod.outlook.com
 (2603:10a6:20b:fa::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b0a4e32d-4120-418f-c4b2-08da73a2a7d4
X-MS-TrafficTypeDiagnostic: AM0PR04MB4785:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	x83WFSxpa1dlAxjd8oh9bnnjc4Y2Aq45yBudkLheOCsfmuv2Z206nbeRTJjPopq5UlmshqlMJXch5jEcwbPe9DVUW0o5YYA6n9nXSpsfmpJGkohNDShYLw9Vwh6Zwb1jEGCCHasYsL+Bi1HU2uqYbQ7jawYmZ2jtLuvUjTvstjnZVWhTY31B7JkUzPmm98uXohXrCOdjvJBHakbHBIpYrNFDgh0GoKhaE00Fq5E6U1pG/r82XsVyBQGfiYeDSacZe2FpxIzdNkJ4c69f99ocZZqJ70Z3J3z3aJF4YakCSiekY/pDmpHIDJo2aJ/e8eM9zs6WSJoJxEapJjvvHh9hCM61jYwrFy7X9d+FLAr5TymsXghiqjZUZ3eFLKHpYrG8kjiQXXc5k623puFwtGtAlGJteyzhxHJWDRrAKu2t+FQnA0zNN/jmnJzKqGHbj1iK4poiq1vRRpC91asZ8h670+Vl8+dgSJ4028vJkJQp6sf59x7RFD5h/WtrkygJSA5oZZjNBy+oSp0PcSrStswOcQMCuY7bP6OZG7zOkeiaFvp8PdMLtpZwoM49MofrpUPXKGYk1nnxA5MBxI9k0+G/k2oLi7Z1sUYomwqqgyLvwg12HWK89qZU3TKFsyOTi/n8bd3pAU9Vjd4rN+YzhApMDO2+mB0lNJ3iLlm0xvoY1SPDUlr24vGNo9adXCl+oQjrbgXcbDKxqAxxXDcehd4c3RpvkieMl2e25xCpx8YyNzDT77M9/NbSyJnvayHlM094r10oRPoKE+8nn+YTY8fRm4lQ7ody256ny4HDL8McWTKFNkWvKAfPkRJ/cCWHTl+YfMtWNrML2lRuWId3rPUf9w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6551.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39860400002)(366004)(136003)(346002)(396003)(376002)(53546011)(6506007)(86362001)(31696002)(6512007)(2906002)(26005)(5660300002)(6486002)(478600001)(41300700001)(8936002)(2616005)(186003)(38100700002)(31686004)(54906003)(6916009)(316002)(36756003)(4326008)(66476007)(66556008)(8676002)(66946007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cUQ0ekpUQ3BFRjlOOHNrYUhnRkpEVG9yU2xuQm5LMmVOd0V2U0lnU0x1M2lR?=
 =?utf-8?B?R2F2VzFaNkJPWEplLzFmWXRCNVc0UlAxb0NrRVZzemZNSkJ5UGM2WkRvWWha?=
 =?utf-8?B?TWpBR1RMdmRjT3V5UFVQUTZpVWdkSG95aUlKbnU4L3FnR2lSbXk3TXBucWJq?=
 =?utf-8?B?REcvQUk4cHhEbEF4VUl2aWNXalk4c29TYlYwYkYzVVIxdDdtUklrcUlIOUFs?=
 =?utf-8?B?RW9PVkpQd050ejUybmJvTjF5cnRUVWhJdGJPWkRrcmMzSDlTL1ltc3BpTm5C?=
 =?utf-8?B?TStCRC83aHoxclhET0tUR24vL2VQeGJPdUhIWUpNUEFBTG5jMTMxT1RSRUxl?=
 =?utf-8?B?QThabW15NlQ0YW1GemxYSENZMUJZRjJxeDJxWENZdHNVL0x5ak9KOXA1Umtp?=
 =?utf-8?B?c1Z6U0owczZ3RmdlUHorcFllOUt0N0NsWDJXTUN2Tm90WHhUOGFzQk1xNHBI?=
 =?utf-8?B?bjdsbkQ1djZPZnEySURkVTdxUzc1b01nY2lOMUdicncwZmZ4bnNSc3pmUzB3?=
 =?utf-8?B?TlVXQnRRa3JOTEd1S1lnYjd5RWFySnJMajN5VkV0WWk0MzBKQzFWS0RYYjRt?=
 =?utf-8?B?V1BpZzUxYzBrU01TNURNUjJCdklJWmowcGpRMXFiU0IvYUxzZUdSb3l1UDJp?=
 =?utf-8?B?Mk8zemRCWDBSS2dSWExLNlExWk9mV293N29pbnErLzFBNGoxeFQ2OFJoZWlN?=
 =?utf-8?B?c0lIUmpqR2xXU3lEaXMxdVFIZlBCR01KaHpZdXk4ajQwTm9adGoxVFF6Zldj?=
 =?utf-8?B?UjJpdGpGMlkyaEtBY2hqMGN3RzNoenY1aHNDdUNjZXRVT2dFTTB6NWZEak5I?=
 =?utf-8?B?OXBDQTc4YUUvRmQ4ZXFxdXBpbTRCSXNkbWdhWFVNTXdBa1hpcmoveE1YZ3Zm?=
 =?utf-8?B?OHdZeXZscGMwd2c3MHVWaG0zSkt3WHYyb1dQbkllVG83dUFyQUtEaEVEQUlh?=
 =?utf-8?B?dWVnaFlxZWdEOXhhMVRnREpXWEh5anVDQUxoYWUzUVZnS2wyTUFnaVBKVkRS?=
 =?utf-8?B?TnoyV1dCUXpmclZMQ0xLL3RXVmpkNGNuMlBNdktSa2F0VDk2aTQxQ2hIR2ht?=
 =?utf-8?B?Rm1yTmlXWkU3dWxvVUIybDlyRUMvTkRGa0xVdkJab0dhdnVJMGhBdFAzcUY4?=
 =?utf-8?B?VUU0b25ORXhnNHE4QW9hZzNaSGRwSTNzT1lEUlBYdjVCckl4ZHFXUVJaeERF?=
 =?utf-8?B?WkFMK0ZsR2dzMFhoM0c2Mk95N0dqY2hBdExpd3drcHRld0pBd0o2MEdHdzA4?=
 =?utf-8?B?Qldkd0ZhR0h3QUpwVTZKcFhCeDJhTSs4WnlJZ09rQUNFUlJCSmtESXByNmFM?=
 =?utf-8?B?TWdZWnlWSGVsN21hUUE2V2doZjhVZm9kMVNBRFJjbC9DZFFVc1d6L2ZXdDNL?=
 =?utf-8?B?amNaZ3k1VXJ6NWxIbTE5eW0wVWtJRHBnU29HZDBmdTdiVXlObkdoZG5kZ1ds?=
 =?utf-8?B?N1FxV3pLOVU1M1RPaW5lb1I4NlJvdCtDUG9WR29wbTRDL3dIYkNEZEo1SDNk?=
 =?utf-8?B?cmpuTTZVODgyNExhdkhRaXUvY3JFdVFDc3F0SDZ1TjhHTTZ6SzBIT1NkaEkz?=
 =?utf-8?B?Qm5Fc0VTVWsyOGlIcXJMVEI4RDlleVlXZ0NxUG5hTkphV3ZDZ3VIblVXNXBI?=
 =?utf-8?B?dzRUbXlTVUlyTE1uSlZGVk94WTIzaTVkSjRFTUxDbWo3L29TR2JicTdpeFRl?=
 =?utf-8?B?akVjOXBVeWFKTllIeG9tdnFjNU1tckRlMEdIM2szUERJbWhabFpiTFNXL25B?=
 =?utf-8?B?K1hlUW9WdVNoWklBT0NDOFhlZ3N3S05zWlhiU3FCK0J3MEFuYWp1SVNDbVhF?=
 =?utf-8?B?eEZtMzFvTUhPK1UwcWhyNkZRWWZ4YzBsQTQ3UHNJdzhDZmJ0VVRUMExDOUpK?=
 =?utf-8?B?Z3ExUStPMXYwRnMvaHZYaVhmSW1hOFRRaG9SZGkzUlF0Sy81M3ZSUzN1aEdW?=
 =?utf-8?B?ZmZ1Tk9GcTN2S1AyWHkzMDVUY0FxZWFpZ01UUVRFaXJ1cGF2bUxqZm91V29M?=
 =?utf-8?B?UGphMEdVTWVQVnRqWXgwYnkvQmN4RnYvaVdVUUttcUlSaUxPSlV6K3J5aUY1?=
 =?utf-8?B?YnhaL2k4ckRTR0E0c25LaHhBWHVtYUd6ZytmOWNMenpWVFd5a2JmaHRBa1Ir?=
 =?utf-8?Q?HcmtzzatZYWyvHhTD1u8vj6ji?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0a4e32d-4120-418f-c4b2-08da73a2a7d4
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6551.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2022 09:46:06.5544
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mTFP1IztD9Dukny/hfOdPZ4hcnuiyeY35AsTp8LwQCIJSV07L9CLP9Fvocvk0zXk38cwIjtbeAluMaCtgWfkFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4785

On 01.08.2022 11:43, Jan Beulich wrote:
> On 29.07.2022 15:26, Anthony PERARD wrote:
>> Two patches:
>>     - one for stable branches (I've rework the XSA's patch on 4.16 so
>>       patch will need to be backported);
>>     - and one patch for staging, forward porting the patch for stable
>>       branches.
>>
>> Those patches are a rework of the patch for the stable branches available
>> in XSA-403. The environment variable is now in upper case, like one
>> would expect, and now a value of "0" as the same meaning as the variable
>> been absent. Also, there's a bit of documentation in `man xl`.
> 
> Thank you very much for helping out with this. While arguably not worth
> a lot,
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> and I'm inclined to throw this in rather quickly, not the least to have
> it in 4.16 a little ahead of the next stable version release there.

Actually, as per the advisory it's only the stable trees which want the
respective change committed. Unless I'm unaware of a change in mind.

Jan

