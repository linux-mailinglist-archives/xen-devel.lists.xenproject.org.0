Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42D8F40C65D
	for <lists+xen-devel@lfdr.de>; Wed, 15 Sep 2021 15:26:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.187628.336570 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQUvQ-0008UB-LQ; Wed, 15 Sep 2021 13:26:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 187628.336570; Wed, 15 Sep 2021 13:26:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQUvQ-0008SB-HH; Wed, 15 Sep 2021 13:26:08 +0000
Received: by outflank-mailman (input) for mailman id 187628;
 Wed, 15 Sep 2021 13:26:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aZgN=OF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mQUvP-0008Ln-Cd
 for xen-devel@lists.xenproject.org; Wed, 15 Sep 2021 13:26:07 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 79e5257c-1628-11ec-b51c-12813bfff9fa;
 Wed, 15 Sep 2021 13:26:04 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2109.outbound.protection.outlook.com [104.47.17.109])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-12-lwp8FwXxNJSK1t9inH9vGw-1; Wed, 15 Sep 2021 15:26:02 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4383.eurprd04.prod.outlook.com (2603:10a6:803:6b::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Wed, 15 Sep
 2021 13:26:01 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4523.014; Wed, 15 Sep 2021
 13:26:01 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0119.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:19::35) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.14 via Frontend Transport; Wed, 15 Sep 2021 13:26:01 +0000
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
X-Inumbo-ID: 79e5257c-1628-11ec-b51c-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1631712363;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GFSJGrEWRuZxL/lqFamJoez8zlHu39Sdg/lvj6ulEMc=;
	b=c7emvh79IgL9vkkDbGb3Aw9nWDSz/vo3UE1BiJ3CUa8IoQJh4SAP6ijMitWAhacyAKYEdD
	yUMkwuQp8sV/1iCryiS9TB7Ppd3HMFIFJmTc5Pr2z3F6NjIU9RHt8sq4qyZx9ge5mKxNlP
	WU+qFVWG6lrkB7x4v/xSLAq21CHmCLk=
X-MC-Unique: lwp8FwXxNJSK1t9inH9vGw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WBE2crGkAU+iP16h0N3S+/TEH8kR9ZIAXR35k9nAW2YXHk2028Fx2IhbP9TkNy041Gchl/NPc31fiIWVr7Qzp454+SSScgqRP9+B5jAD3WOn1dEVVJL5kHocl8bW8nqGcdKbIBnndKKA5Dy8+aB6vkbHYMnCA+tP/iavOwrcPaJrCFxxg2djvfHcs99iOyLIBD/aJY6jsUGfA20flh1PGDAEpn6b2OgC3gnES9wI3bbg9wdU8fmDwNHAoemhVhJvH5Sjtd9doHXNpmyVM6XwszvaIVkUy752XfmtX3wVZYBrab+idJcCm2EWhENZKUk/2bZfSguESDtAlfW+peJAGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=GFSJGrEWRuZxL/lqFamJoez8zlHu39Sdg/lvj6ulEMc=;
 b=gdsEEjka6fq55o2GToiY5wd11adRMDkXz6p10l+yuKWCvyv1rtDlfbbGi3IwJfPFsb24RpZD2uo2u4c+6CewjGRUq/HVCFkwV9ffLd9Vw1s3xsDYOPo9BObVzCw5Lk+tbTbnxxMc3blawTN5h6k4WP1QfNZfpWzjcqRzZ8J9j1VHWMrdYf94clamgygUHyMdyLycpq5JII0oh6n83rqDYKsK1ou5zlGo5mpf7hyUXNS/dxQBnNoBgGZkyZBuYPJilqP/515HPG/wiRyRt23ilqeT94KCf4UbIFtGFKjwWHg+N/7+Z6B0cyYfy/uZ3yIDF2odNSXN9iACbiFR+H5mEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
Subject: [PATCH v2 5/7] x86/boot: fold branches in video handling code
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <2dbcc7e4-58c5-5724-6434-51be8acfde35@suse.com>
Message-ID: <7a93f768-b416-1699-7db3-37e87f6d318b@suse.com>
Date: Wed, 15 Sep 2021 15:26:00 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <2dbcc7e4-58c5-5724-6434-51be8acfde35@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR0P264CA0119.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:19::35) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a02da4d4-0116-4a6e-fd42-08d9784c5ca2
X-MS-TrafficTypeDiagnostic: VI1PR04MB4383:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4383DB9B47472971EE4C9D10B3DB9@VI1PR04MB4383.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	eLSTnMvddxNo2NPOuDbjLV/xN/pN8BKMA/4Zm49LJAU3gEsekZrXlN7oDCgonsYkqhzN18sH+R1PiCpIV3QJMT0r8DSkV3u5THqjg+eq7bMMOruLVL4VgVI8iMpzntGegLhz2Vxf0bztG0vdPaceltyDMhwdazVw2js+8+XFdRDG8A2morzQ8FWfnpK1eLowt6vd3a4HUYD2pLkftTEw7JpTzGh8T3wh+Ar2p9t68+NWUwCW9kGgnco+ivE+Cggz/5vC1idEjA3ZGfUqGJLOLHuLz2cIpDhsiS9UADkKhpCEjYsVBGiVfZ6bEADPlCrPyDuD+5KOG0TkZbJ4yevzJLfUF55itfMbLruedoRFDUgryAdBKfrqC4Ie5+9VIR1lCpYFB9kTmOSO5/p/15tlafbFfqH2yTEGmeTu4/C3Mhpqe3GQ6irZ5vfhVwEd3nR3LpdVL0PLk/aTVN7p6dYWNUAhenOs1YLDbh1ovP0XWfJK7Kgd1R5xM+EVNfOf94s55qG5Xlc+mYTmz8Mbn9b/CgwJLLVHqrf+S8443kCmTNFOu8DQkA45f7hkC2h0FSG7fTfP58QDyDFQaWCIcNhEz1dGBu3zzLbBzgA59n5IPOxOZReXMK0wuSsgFQRCKHphPy03hr3jL1BKdD/omx04VTiLnww32mz5NJH5KG5XZVXpsxabf4395x1aSXsWyITA8TtVfaYdYNR00j7nH8VNOXjFWNE+m6vWQ1eyFpzn0k8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(136003)(39860400002)(376002)(346002)(396003)(31686004)(36756003)(38100700002)(54906003)(956004)(16576012)(86362001)(4326008)(2616005)(31696002)(2906002)(478600001)(316002)(186003)(5660300002)(26005)(8936002)(66946007)(6486002)(6916009)(83380400001)(66556008)(4744005)(8676002)(66476007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Zy9zOUI2ZEE0M3d4aWx6TG5JeW1nV0hKOTRjWmF1V2ZkemtNU0FoL1RFa3hD?=
 =?utf-8?B?azdPV3d6bi9naWFOR2lQT1NqMWJ2UGVzOFZuY1BIZlg2dkI4U0xUMVE2L0ZG?=
 =?utf-8?B?bVkxOHJpdGpyVDRFQVExTmcybkNSZ0txUzhVam9zVGRHOUJnZFRzYUpKOVdT?=
 =?utf-8?B?VDVtbUZJODNVdzZoYXkxZVI3RzJOVVowSmZWb3QvZ3p0ajdLNEUrSXJyOUx1?=
 =?utf-8?B?YWNQZFpPVXc2MitSVEpuUStwaUd1bmEvSWpFN0pWbjl4TEgwcXM5ai8wREVB?=
 =?utf-8?B?ZS9MRzB1S2Y2SkQvNStHZHlwUUgzRmd1WEZDSHBtVUlHenVOenpmaUIwanVx?=
 =?utf-8?B?cUdGNldoV1hsWHNNSnFtMVVCczZueUc1TnduaGdCNXJFVVdmSE5LYXRwNWV1?=
 =?utf-8?B?NFVpNXo5V1JLeTh1TzN0N3Vwb0FINVhOallvbnVpcVlhOFJRZ1Bwb3ZsVG9G?=
 =?utf-8?B?QzErd0pCQ2E2aWlEZXJ1S2ZhMCtvN3BwdWpSeUN3TU5SUnNvWXllUW1oNFp6?=
 =?utf-8?B?S0xnUmJSM0gxTTJYTm1pR0VuOFk1dnRyWmZzRVhmeHFQQm8xYU1nNGErS1dI?=
 =?utf-8?B?eER5TzJzQlBkUjRDdzlpeXQ4ZjZGYTFhTVFUNUVqb1VnTzNVRXlhRUhvdmRY?=
 =?utf-8?B?azhlMEw5VjZrTVV4R284TWwxSEcrbXo3ZlhqSmFrcmVQVllKRlNEYU1yVUFZ?=
 =?utf-8?B?blVsZUM3MmhyN0NraXM3NlkyT2U4M3JUd2R5VXZlQ3VUVW0rQjFzcVNSZEFa?=
 =?utf-8?B?eVBIWmpkbnlpTmx4Q3RJMFRNSCtZd3Z4bzYxMCtJVXVZRm1UalhGdGlGdmlF?=
 =?utf-8?B?Q2VDdks4cDVsaDZNTzJGWUFjSEUxeTd6VHloODJURGhocWxBOU0xVTdmYlRj?=
 =?utf-8?B?NFpVY0ZjM0VEU2RQNUM1bDZGZFJ2RnhJZjRLZFZiUnJZZkFuRXF0L25DaUlD?=
 =?utf-8?B?dlZxNlc5dVlUQUgrS3QzR0VQZTZIT0ttbWJWbERJYWFoYTBiZGNMK0ZSSlJT?=
 =?utf-8?B?RzhpR2t0SDlXdDZ0M3BhdTBLQkF2dzY2dXdndm5nVFIxdVhwbGREWWtiSE9W?=
 =?utf-8?B?Rkh5RkI3U2lCcVBCTUdUNEhtaHMrU09hdXAvY3lpVFJncm5DWU1ORjQwdnNH?=
 =?utf-8?B?MnpMTkZKOVNVaUsyaXlLaUYrSUZQcVJUQ3ExVmpvSVJvOTdNQjZrZWRqVnR5?=
 =?utf-8?B?NUg0QnZrQjMwRGJESDNzcGhyTEFDNklmZjhqcmc2dkJjVzREZnBXSTg2SEll?=
 =?utf-8?B?YjZITTRzNDY5TnVleE55MVRRcm0vYUdpKy8zNzVzdWRncm5ib0pUb2xwTm5Y?=
 =?utf-8?B?U1FCV0gvTVB3cFhoYmZzNmZCYS9WM2w1cUdOMm9HUmExb2RHcEtiL0ZIbExV?=
 =?utf-8?B?YXp5akFvK252OG12TWN4NVZaZTFkSG1ZRTJVbFMxV0kvanl6L05EZ1I3MW5t?=
 =?utf-8?B?RDg0b2hpOTl5aFlKMC9ZQmI0V3JRL0tzU0ttMmt4UTJEVDNzUUw5WDFCcmNB?=
 =?utf-8?B?Mlc4dkM2U1d5TzFRTk5TV2hVMFZWTUwyZTdTZHNCbFVEeEU1ZW1HQng5QS9D?=
 =?utf-8?B?YVZVNWVMVXJjam1aMkV4Y2txU0I3K0NmRFJkQUFiZTFXTGx1RlFlb1BHcm5Q?=
 =?utf-8?B?Uk5UNzMzZXhOcUdMS0VLUGMrYmNobjMyUWxrSjJPc2oyUmZsdko5UjA0dEZW?=
 =?utf-8?B?TlMxT0xuWm1BSEF4d1lGOUFkbkVVWWJBalB4Q1JQcTg3aXZQc1NETXJzbTdI?=
 =?utf-8?Q?bFcXPdWs6l1Q3qxSa40NC9BkIKVrF95iesTMkr+?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a02da4d4-0116-4a6e-fd42-08d9784c5ca2
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2021 13:26:01.7268
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oIc/iplh4qIPU0P89eMXxK4meNZP96sf2Z88Njds/aZtdpaOHcxQFA8OHb6RvRjQ4gpUy3wTqzonIbf5Cj+Wfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4383

Using Jcc to branch around a JMP is necessary only in pre-386 code,
where Jcc is limited to disp8. Use the opposite Jcc directly in two
places. Since it's adjacent, also convert an ORB to TESTB.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/boot/video.S
+++ b/xen/arch/x86/boot/video.S
@@ -332,8 +332,7 @@ lment:  movb    $0, (%di)
         cmpw    $0x656d, (%si)          # 'me'
         jnz     lmhx
         cmpw    $0x756e, 2(%si)         # 'nu'
-        jnz     lmhx
-        jmp     listm
+        jz      listm
 
 lmhx:   xorw    %bx, %bx                # Else => mode ID in hex
 lmhex:  lodsb
@@ -401,10 +400,8 @@ mode_set:
         cmpb    $VIDEO_FIRST_VESA>>8, %ah
         jnc     check_vesa
 
-        orb     %ah, %ah
-        jnz     setbad
-
-        jmp     setmenu
+        testb   %ah, %ah
+        jz      setmenu
 
 setbad: clc
         ret


