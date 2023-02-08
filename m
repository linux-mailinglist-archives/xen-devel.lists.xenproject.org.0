Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07E5068F0EE
	for <lists+xen-devel@lfdr.de>; Wed,  8 Feb 2023 15:37:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.491832.761150 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPlYX-0005Wj-BF; Wed, 08 Feb 2023 14:36:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 491832.761150; Wed, 08 Feb 2023 14:36:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPlYX-0005V2-8W; Wed, 08 Feb 2023 14:36:17 +0000
Received: by outflank-mailman (input) for mailman id 491832;
 Wed, 08 Feb 2023 14:36:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=z/8R=6E=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pPlYV-0005Uw-NW
 for xen-devel@lists.xenproject.org; Wed, 08 Feb 2023 14:36:15 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20604.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::604])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ee8501a0-a7bd-11ed-933c-83870f6b2ba8;
 Wed, 08 Feb 2023 15:36:11 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU2PR04MB9196.eurprd04.prod.outlook.com (2603:10a6:10:2fb::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.25; Wed, 8 Feb
 2023 14:36:09 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178%7]) with mapi id 15.20.6064.036; Wed, 8 Feb 2023
 14:36:09 +0000
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
X-Inumbo-ID: ee8501a0-a7bd-11ed-933c-83870f6b2ba8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QdykdlAhLC09LzuP8lvvQ1zir9V4enNNlFFYbEoxlNKopCCp5TTLne/9oHCzq5DC+c933ksXQBHoayJYMmKCX1gFbqq4274l3qM+y/em9rqUkXV8SZ2WN1RJ59UZRLPBkXvSj1vMifp1c0/mNThmyuMRfNt5tJrZrZDHhBejXjiSa95ml2D7mdB8a5x6Y0UIH12+UIT6w6bftDQWTYc2c7MJnBOkW5IuW+2GqhzZ554GklwB8Wtk0pM0gKxKPB0blD2PMdeUNhdZp3JB9ghH3wY4TaE1v/iEa6ZEBf/RFxoCKmJ72SkKUok7ut84ZjQq8jrHRDfRW/X2EzNRjHDijQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ULamCwbkY8loNWVReuZrKYv+2dnNsKI3wYg3dw/3S20=;
 b=jNSQyiWYAEjK8VFuB07sdAS7WkGMMUQEe//WgFXCvV4BUdQLZWyArRd259+nwD/AJhRf9GVwWEGnHac570h4gPxq7RAH5DOblEGYvn4daXQYXK5gBmtHwhRGJB+MDGMPxwHitq9+01uEidKo2xUvRdlNlYLLxv0z/VXEVHET4hTkxif0JU18IDHx/W+P2IuOTXzVUJ7bwOWnIG3LTOJl1iQpWUGF66jPn3CiGHYiztuGM00HBTNZul0E1NNDuPjCCyIGCwvClbxZOT//F7J7S9qflKrwM2NIgrnG9r7OkfdCi9MZLTTupBEpjq4Rq0+VtA22umcX6v0P8yE22iUgIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ULamCwbkY8loNWVReuZrKYv+2dnNsKI3wYg3dw/3S20=;
 b=aXAM4TP4DlPRCTAcNKOYXc+FVi+WeEfyNfMCFmsJPITXaIt+oXAahvjcRzqu4fEG2QFi1bTC5HC30kU1B7PbFw6okSHumU7nFADarkkATrrtrycUy2cOLp8UY487qOyISQhGutqzvz9gU3tGWDALv36fDHndUeDSEQAXvlCADdLDlBts8eSQK/Y+lV/yirG/y9u2gzE+6Jom4VxwDA5AShNmiBbEXQ2ddjexuAPvdNNqnLpCG+vI4TAR/rMu+oTdvF5wjjhcV8aldPtq0yNZlweD4u8g32K9lCsx/a24f5uNQrh0OOpEzXuok5tOFD7GuEmLix4vR7A4mLxJrAcNZg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c8858a19-e89a-c1de-3222-810bb43c3c88@suse.com>
Date: Wed, 8 Feb 2023 15:36:06 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v3 0/4] x86/shadow: misc tidying
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Tim Deegan <tim@xen.org>, George Dunlap <george.dunlap@citrix.com>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0134.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::13) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DU2PR04MB9196:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e8a29e1-7829-407a-d07d-08db09e1d1a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Nn4Naz6CUnlOyS+h0DAjQ1abcn3iP8ANsVzdWHWTkj8/RJxf4H1TAynS+AW2wOMogX+V+OLWdHXla04Q8XDBRqk8hT68jmC10mI3IDfYQEjaKLPrVrpYsPL81anSy6Y41iXkfWBxD/EFQNs0YXBZRIu1U5BHuC4u8KSfEsCIFMbrq9hC87yv6EvDi3eB98tr0dbrzsW6WkbncT5HiPmf9weNMRmKhXSME9rDOZWPwo7OvOUblxz8N3CJJ94SwUnWw50J0rXVikQFak/gTGdRenpKw19dKAApKy2t8FV4qSJn1YwKVL0ByS7x0ieZalimV24VBAxy5coSR3N+0fG3Vl3SEW+cv+ju4Wuh4TL6EMeWGiUPqraXnVkR1cT3nXEllwCY7rDwzQXT1eB9u6d6c5aqbZhxyL/3AII//8prGsSPiYNy4WJXtMq6T76n1PY53BWEFtPjh8bqRzt+MHOaBJ+5u2qFkgp9ZBfi10pn2yFH6aJe4LIEsoHuAJFKCC85gLp9jrY10CMa5ffoVhiXufFjpSAAWLfxdFTZ+Zhgo30BRx/Xr4Bxls/Rzidjf+BfxjDDONrU0HS3q3QDwT6vEJbUq84Rrkx5/ckDhUHGLm9l7AsenL0hUdIWZ4Xeee6CaSvXxBR/tiJbylVPEES/KlzvUiqSYckY4euaQIxwSFutUTCv/5zTfgseErX11OValZ72QsGVakz0ElfduNUIJjbjQVaG4PNKK703PkAnnbsJZPingCz/vdjwCoViOLABjQWfCt8rb/relwtNwCGBCp9eZPcbY23zX5GXym/I8Fo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(346002)(376002)(366004)(396003)(136003)(39860400002)(451199018)(31686004)(54906003)(186003)(26005)(6512007)(31696002)(86362001)(36756003)(8676002)(4744005)(5660300002)(6666004)(66946007)(2906002)(8936002)(6916009)(66476007)(66556008)(41300700001)(4326008)(478600001)(2616005)(6506007)(6486002)(38100700002)(316002)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R3dNRERJblRzQVJNcWtuUUxKQTRKZEhiTGRTNkM3TjdtTFZWVG9FaG1ncHhw?=
 =?utf-8?B?WlFrbWtzQzcyY3Y5NkhVODUxRDZFQmNDWUp3blRyOStqR09XdGdDeHh3Mklr?=
 =?utf-8?B?N3BSejZKSVhNOThldHBjd0VJanRjTWJydTNid2lYaHVONmpXaTVIOVU4ZTZ6?=
 =?utf-8?B?a1JFeEdQdmF1cDg3RVd5VFYvWlpJQnptNE5sc0NaZk0xejNnbnNaWUNOd1NQ?=
 =?utf-8?B?UGNUMUhlejkweHR6d2VCUDZ6M0FjQmNCUStPamEyQ01YeEpueHJkdk5LYkVS?=
 =?utf-8?B?Ky9ZZnpmekdmRFo0bS8vSjRjaXRPYStGc3Qvd2tBcDdiMzN5eEtUQVE0Z2Fy?=
 =?utf-8?B?alpZZXlhMjl5T1pQZnNXQXB1YmtiZkpZRFI3RitiN3M2NWlGTEU3MUN0a2dL?=
 =?utf-8?B?Ukpnd1E1U1VORjJiVzVxeFdkY3pFUWlOODZRanA4YitTWkRTNGhLZHozaSt0?=
 =?utf-8?B?R3FZRjhicVJPaTZ6N2IxSHkvYVRyZVB5eTFlRkJlRHpTcUJLUEVyaGNDN3dk?=
 =?utf-8?B?azllNjB6bzZDQWVjVHk3N21NdjdGaHEzMGxZSG1SOEorbm5ORUpoRHlld2FY?=
 =?utf-8?B?OHVBeHBac2pIcXliUWFQWUhyWXE2SmVGVGN0c1FoT1d4T1BMOTlQSkZHQitm?=
 =?utf-8?B?NWZIazNHNW5za0k2SklidHhWc1QxNTJ0bTFHVnVrRmU3N2tmZW1OWnh3dFBl?=
 =?utf-8?B?LzVQSFNMZHRMaUdhajFmeStQS1RzQUJhakZKZSszdk9PNG1POGoxcG1Ta3Vm?=
 =?utf-8?B?SVRFeGltZldaN05XMU1kbjgwYVYzemhkcTdINnArZjhKbDhDc1NtZHBNbnB2?=
 =?utf-8?B?Z3ZkWGtBaktBVFhNUWg1U2JJNnFWcUpIVU9YNmhyRWVLWllmQWEwMnl1YlhJ?=
 =?utf-8?B?UndCWXZjV2ZRMkdIMlhXUkV0VWQ4TXlZL0x5ZDdsbGp1UVVIdUVxZHF4QnBh?=
 =?utf-8?B?OXlLRERDc0JSTVJnZkk0NkhpRUJGeGVaY3Q5NFY0L005QzlSR0FVb0dBOThJ?=
 =?utf-8?B?QkFhemRRREV3RlFZZFk4NWVqdDdwd0xlbE1HU1RBbVNQaklFSEM1YXNScDJa?=
 =?utf-8?B?ZFhKa1hYSzg0TzBIS3V3SUo4dU1vMHZ3M0tBSTVmeFFZaWFCdkN0djkweFZ0?=
 =?utf-8?B?c3ZPTjlXc3c2Z2JSQVh0emZ2ZXBmUUw2OUZTOU5qVkFXdk5MeFE5bUJQZWVP?=
 =?utf-8?B?YVJDTysyVHFralVRNWVYMWNFTmR6ay9qcTN2anJ5VGNaS0duSFAwQVExbGRy?=
 =?utf-8?B?ZjNWN1czRGZhQ2tNaUlJSU1mTVhmcDFjMnVQWDNVa1FwUk5WY2RiK1ArZjdD?=
 =?utf-8?B?MnNwVGxYTXZDRjRTdmREUEE4cEpFMmlPbGdjSytYK0FXRjdscFpCbkNCYkFJ?=
 =?utf-8?B?WlkxOERLeVNldEdCU3N2YVZLQlMxK2dMZU1jU2p0QWVod3g4WHo3U1IzQUFy?=
 =?utf-8?B?WWNmemlIdWlQOTZrSkJJN2ZWSTZRKzZKc1R5YVR6NHdWRDEvNk43MDlacjV2?=
 =?utf-8?B?UmZmWWFwaEl1aExoWlpVTW9ZSFBuZnhrWVpCcmZaYjJVT3lqWEFTcWYvNFla?=
 =?utf-8?B?aEd2RE4xeUlFMGJIQ3YwczBwalFUTm8xbVBydFdPRjVMdjFTUWRGa0RxNEpz?=
 =?utf-8?B?U04vcDBLL0puY01oSDZHQmNtR3Nja0lsRFdZTFdycE5FaDhuREtZbFVITGw1?=
 =?utf-8?B?K3B6OERUem1zKzJIQ2xwWitBM043SVhseGZUM3pHa1RZK3c2aVpiK0g5Uk1P?=
 =?utf-8?B?TldncFI2TTkrR29GUjB4ZkZvRVlEWklZZmVUNDBBREZTNHZrR3E5TnJEYmNC?=
 =?utf-8?B?TWRCOTkwL2M2ZHFCbUFPWGNteE53Q1IycHBsUTEyQUV6eTN5Z3JwTEVvZWcx?=
 =?utf-8?B?dFpYZ2tqYWh5dVVCcU1JNkZLSExhcHU2a0I1cm4zMXBQVGxsand3OW9BelNZ?=
 =?utf-8?B?bys5VWhmRmhacGdwc1VFS0ZRR1UwcVp3MmdaOERGWHYrakozSld6OHEzVGxD?=
 =?utf-8?B?Mk5tQVR2VGFhQ0lpeHUyOGNqY1VzQzk4a2d5VndwWGxNRDVQeFlGeDBWVTQz?=
 =?utf-8?B?eWtIMFRaSWUzWDY1bm9WUHVPTDNBTEZFOUY0NUxBZ0ZidzVCejdPNmo1OFBi?=
 =?utf-8?Q?RU6Px7818/c8e6s9ekBtwl1WQ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e8a29e1-7829-407a-d07d-08db09e1d1a8
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2023 14:36:09.4725
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HxkeaNzuQ1/Oxq2tcj2RarRvCUYWDcIEuD6wE4ux6YAcpdxcjc/1dJKjrvkpoUa5qC94OR0fELLL0EakwfjyjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9196

... or so I hope. The main observation was that we still have both
hash_vcpu_for_each() and hash_domain_for_each(), where the latter was
introduced in 2014/15 to replace the former. Only some eight years
later we can now complete this conversion. Everything else addresses
other things noticed along the road.

1: replace sh_reset_l3_up_pointers()
2: drop hash_vcpu_foreach()
3: rename hash_domain_foreach()
4: re-work 4-level SHADOW_FOREACH_L2E()

See individual patches for changes.

Jan

