Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6631D4A80BC
	for <lists+xen-devel@lfdr.de>; Thu,  3 Feb 2022 09:57:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.264526.457637 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFXud-0007hm-54; Thu, 03 Feb 2022 08:56:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 264526.457637; Thu, 03 Feb 2022 08:56:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFXud-0007fB-1d; Thu, 03 Feb 2022 08:56:19 +0000
Received: by outflank-mailman (input) for mailman id 264526;
 Thu, 03 Feb 2022 08:56:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OTfZ=SS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nFXua-0007f5-PC
 for xen-devel@lists.xenproject.org; Thu, 03 Feb 2022 08:56:16 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 24632816-84cf-11ec-8f75-fffcc8bd4f1a;
 Thu, 03 Feb 2022 09:56:15 +0100 (CET)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2058.outbound.protection.outlook.com [104.47.0.58]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-7-n2Ltb0jtPiaJWMntj6JDPA-2; Thu, 03 Feb 2022 09:56:12 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM8PR04MB7811.eurprd04.prod.outlook.com (2603:10a6:20b:236::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Thu, 3 Feb
 2022 08:56:10 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11%5]) with mapi id 15.20.4951.012; Thu, 3 Feb 2022
 08:56:10 +0000
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
X-Inumbo-ID: 24632816-84cf-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1643878574;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=24UZRQHWuLcZR7O/O/nTs8iv2Y3SejlgISfyy5eQiK0=;
	b=BF6sMqU7zpMPraJxr4zhs6rkbXHefawRBPnMJxnJWJRNYk9hTpnpJ4IPpKDsarWkcTKn6e
	rvH0qaAVbS8uT8WpE9eCAlHzWxJNiGCB6nJ32xmi2t1ZKKs1qPOgdWMim0eWM9VPs8uUst
	Bp6Cssat4lhbwMSH9k1TMQcie4FAglk=
X-MC-Unique: n2Ltb0jtPiaJWMntj6JDPA-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kiwcUDkFJ6KSysAWQlPEQeDFfuRa2ZFDw+PEGc6grrMKSnVz3pWuxgXviUsa7Ym7GEvr1AtgrYEE4CMjps3gVeZwl4g4dIIRbufxszz+dsRmVs/6OEe11yKn6yMzTBtJjeXXailf6hNVxU8IsN9NEUViX0ngNtrallcjZy1Sqi30ln4Hg7rUwod6V1+0DbrpAKx1OSU6DfdNPJQtLogZqpfD96cLLBNE5aq4vdZlof1gJqZ6zoqWoXCm4av4AUvpJj3/hMOaAWaHMHKmLOrQd4DfUCsixyAHQZrh79rwZ3/ecA4EdtAN/nByFh3wsWgcKIKwtkqwGnWYg9mh6tUjwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=24UZRQHWuLcZR7O/O/nTs8iv2Y3SejlgISfyy5eQiK0=;
 b=LAXoQyTCzITqxoA2B3menjh7cS2picI8rmwXbuzWMuR5KlPICDS71/IRcsV1bg1fPLD5Zywfu3845SQtW/Q7zxGV/FeA7IY5ak6woXzpsCyuAFXNncLjUkc/jJUjEii/2TVJb5Afel5/WZlwzxLgggqDBIphdxymWnaIsoh0a7OOnv+sbTLhXDG/y4CyieACFetcn184Ed5I/Mh4Rvo6D6XP+AGj50f1c9nrK3R73C/RGK0qhBmvDgjCY3U/BKflQ65uSkIHCNiIYjCD66ShtOslPzqX4FAKwJMyW31qZ98vrL/02MO6/kDq6vuTDefeUSlUo1xTHRW8DEJqjOmb2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3a8a7290-5cd1-da7a-46df-5cbe1755036e@suse.com>
Date: Thu, 3 Feb 2022 09:56:08 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Anthony Perard <anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 4.16 / 4.15] MAINTAINERS: Anthony is stable branch tools
 maintainer
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0180.eurprd04.prod.outlook.com
 (2603:10a6:20b:331::35) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9a5bf41a-e38b-4e4b-c9b1-08d9e6f3063b
X-MS-TrafficTypeDiagnostic: AM8PR04MB7811:EE_
X-Microsoft-Antispam-PRVS:
	<AM8PR04MB7811310F09BB0491ADC151CFB3289@AM8PR04MB7811.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2803;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3X4Mb1ot8qbDaSJvSuZeIwvFxzHWxtEm10aWhOZgqwmAw/ikT/H4L5pEjFalF5oJvIjc6qGtrGquRnTUx5DX5SxTpSxV8dDXex3dxOH0FwoXqr3FoGJLhtNtx9cV7JJUbF2uH3Bq8MalT3HG1PR7VwQEd7SS6pQ/bnoSnwMD5KTOsDQ9I6aZ0PtQA7VDFvaESG8hJApeunBK06yNdljvYGAbVOPlhaFm88M4Km6/LDl50DYoGd/BLfrj43Y5PCxiqOLyhnSiyt23gUI+/YFAWvFGDpU/s81mqydrsjvTowtvA+3Qyu+sUzhNdI9ChcBcyIZsEDBdHmAaruXFcWriPflbqSgSNawImvzc7ghAMkbjm6IqCfGanxI6u6v4K1Uu5JHaLW2CvCbDK7vrx6x0R0OuILSFUTBga6yxdlpk2Tul+Na5wjFhvvKgiCfkRzOFd79gPNWZcnt2TOdsgfOyOrysr4Bov4XSyxlg+PH112JsMPHxUyEnGRzRYl0AzFdMrALl4eUtCRNDYxi2moaT8i4+NSVO6mhPvTsIKAyb0eVZ52hDK/bhYe0mDTEsTK1JmCgpoxvdHKLzGKJ8NPiR/loJ5kduqASkcOtqr2cmiEZLTrRZ2rIR76urzvzy6OooKkCoxYPcUL7BnpWrF3mB3WhlugIFFkxsvN9LS23BzXD0V6pOzDOBnuViZjSvOWj8A//gZ+YEtKzb30YII4vn1qwcFi3ILCT/2X+KD1DGtOT6pVlxpfxMombU+/GuVL6S
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(4744005)(6916009)(86362001)(316002)(31696002)(66476007)(8936002)(2906002)(4326008)(66946007)(36756003)(66556008)(5660300002)(8676002)(38100700002)(31686004)(2616005)(26005)(83380400001)(508600001)(6512007)(6506007)(6486002)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Rkt2L1Fnd3dLZnc2OU83Y0dkbjQzaFcxTmlMYTJIMjkxdGlnUHMwamRCUHRD?=
 =?utf-8?B?c09iZGwrV2lOcDhmUmdCL3RhSEhBeU13aEJlQ1VYaFJNQ2p2NlJVckRzM0Z4?=
 =?utf-8?B?dGM4Q1pIemFhSi90Lzc0YlJxRGljN20za25QdlVpZDZPQm5uOHlHNFhNQnV0?=
 =?utf-8?B?cW13UjBJaG9hQ1dHNlNpNHZlYWpLZWFMQ2ovcWpKaGplU0M0VmR3VHZVNU85?=
 =?utf-8?B?WTZteDBuSllDSlIwb21TRmVlVkR2UEhaNm1Cb2VJK1FlNHkwN3RRdGc4ZDNu?=
 =?utf-8?B?em5sejdBcHgvZGhtUWttelpoeUI0NDdLbDV4MkZoSy9adWoveEc2bXhRaTJZ?=
 =?utf-8?B?TFl0K1ZETGZoTlBZQkkvcEJEYUlQdlJEbnQ1RDlBWVRtMmg2OGNSamVKaS9C?=
 =?utf-8?B?NktpUjh3MU9NcFFveTdLblVESWtEVy9sNWQydXp5YXM1VDV0dTI4cEIxd0h4?=
 =?utf-8?B?MDlzNmVteUtRcGU5OCttT0Eyb3JzSXg5MzRjZk5xM2ZOMHEwbGM3TE4yRGVS?=
 =?utf-8?B?NjdXTldFNGhGQlVITWJxZU51UGwrTVBQcVpKb1k2dC9vaW9QT0tUM2pVdXpa?=
 =?utf-8?B?UlNCM2hKVENyNUJ3RGZwdHdXNkkrRHlLdG9EVlZOcnY2QzltTGh4WXJ2Qi90?=
 =?utf-8?B?b3hQWENWUFY3TURBb1d3dHo4RWxydjQ5eUFYQWhMSkRIMHE3bkhmT1JCaFJu?=
 =?utf-8?B?S1ZDQWpvb0hVMlFOOE42QjRHMlJwcHowNDJTbjBxdlJURzYvbVUzZUIvZFk0?=
 =?utf-8?B?MVUyT09QSlVNRzJwdXM3UXVmTDZGWWlKM0MwQ0crOUhoNHB1VysxcUdIRHlJ?=
 =?utf-8?B?VmpaUFlaMG9qTnBZR3ZCU2RnUUpSSG1LMkY1cDRpeVlPR2NPWGxnMzJSL1BO?=
 =?utf-8?B?bkhhVzM5YzZLc29FUXdLM0VqcWcwbEJoZEhSeWp5ejhsSWI0VEFCMmx5RmZt?=
 =?utf-8?B?UWN6ZFRtWVl5eHlCdzJvV3FRY0lZRm9IR0lYNDU3dGtWbjlHNDRDZDdDTmNS?=
 =?utf-8?B?dm1GdWNVVEJCaGlCeTJUNk9yTm1WQlkxN3V3MS9oOHlkaitQd0REd3pnTzha?=
 =?utf-8?B?RVJsTU1jcnVCc0FIVFVldnhydUhVWndOTTBCNE1xczg5MWd3cnRpS3FaWDBp?=
 =?utf-8?B?NGVXcUZHNVVML3pUSlVSWHJnMWVTdGFYZGJ4TlNKYU9qcDl6dFNCTnRHMWt3?=
 =?utf-8?B?NHk3Yk1EMUk5cE1QSlQyd0VKY3orbTlXa1QxdWI2Um14UStvbWd2ZlFEalJL?=
 =?utf-8?B?NStHY1N2Rm9Ha3N0dDYxRkE4UU55VnhyRU81c2RtTm5CekhYNnRxL2V1N3hw?=
 =?utf-8?B?U3g5Vm5JTDZ1ai9IYW9PbVRXZ2p6RjYxRmYrd3JNMU9hNTlTWUV5K0UyOXhP?=
 =?utf-8?B?ZFBDU1prdjQ2dllKWHNhZS9VT203ZmVzNW1Qb0FUVUQxWGVOYXRRS0Racysz?=
 =?utf-8?B?Yzl0YjhhaE0vK3VtQVVRcml4ME44VERlOHFxSU1QZ25iTVM4Y0xyOWhvVXJv?=
 =?utf-8?B?WDRlNjZDc281NGJ1RXNRd3ZhTlhUY056OHJwbFBSRUV0TkowWVFUQ1h3VkRY?=
 =?utf-8?B?c1BaVG9Sb2QwTmt2TmcxdkVTN2k5d20vQ0FTVjExUVhiZmp0R1JKa29kdEJG?=
 =?utf-8?B?M1lSTGpwM1hUTk12bGRJbUljS1h3MlhVQ2llZU5LUHdXQTYrR2J4TnpFUldY?=
 =?utf-8?B?Q3pQV3ZHWnlydGVMRUNHTHpBanZhRzNES1Q3SDFoaDRmME5sZERvTmlHQjZ2?=
 =?utf-8?B?b2J4WnV3NWNOVWZZRjh4eDB2MU5pNWZLemdzT0M4dVVXUWhhaU15bUZsN0lz?=
 =?utf-8?B?b2txMXU0Zi9mR2hQK1ZqSXFqNkU3MWx5MGthaVJjNUFOaUsxNFVYbWJBYlA2?=
 =?utf-8?B?ZXUxR2xEVzdTeVlpcHlPVnl0WFhyT08zOHg4Wmw3Qy9lZVdVcUdJNGFyQmZQ?=
 =?utf-8?B?Q2d0VTM1enpwV1pwNmQzUlc5UzcwZnE1N1hHcUpqeUs0cjUvUGt4d1h1SFN4?=
 =?utf-8?B?cS9mSUZxdlB1NEY4R1RVK1ZPNHM5M0xNb1RPR0xZNEk4MEJaamFSSW8wRmht?=
 =?utf-8?B?MHUxcDVQTUkxOTBtMWp6ZHllODVSdmdpZnNWTG1SYUdTL3ZJTUxPNW5zWFc2?=
 =?utf-8?B?NkV0TGtVQ3Y0Q3AwZEJNRFZHd3FldjVhSDMra1lRWFd4WXJpbTFHeDR5eVVP?=
 =?utf-8?Q?NzPgqWPPTMUW1Je+AGk9qeU=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a5bf41a-e38b-4e4b-c9b1-08d9e6f3063b
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2022 08:56:10.7377
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ibk/S71TdyzEEQ3LiECd4Q9nRgViCk6BndiM5R07MLOvDDTU8vi1d7PvcPgJZHG3PkWGlBXepMikFoA5qA3Baw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7811

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -60,7 +60,7 @@ The maintainer for this branch is:
 
 Tools backport requests should also be copied to:
 
-	TODO - Loooking for new tools stable maintainer
+	Anthony Perard <anthony.perard@citrix.com>
 
 
 	Unstable Subsystem Maintainers


