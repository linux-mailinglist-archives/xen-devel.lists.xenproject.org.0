Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E65EB49E4F7
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jan 2022 15:46:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.261495.452853 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nD62Y-0003Wf-Vr; Thu, 27 Jan 2022 14:46:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 261495.452853; Thu, 27 Jan 2022 14:46:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nD62Y-0003U1-Si; Thu, 27 Jan 2022 14:46:22 +0000
Received: by outflank-mailman (input) for mailman id 261495;
 Thu, 27 Jan 2022 14:46:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=V/tf=SL=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nD62X-0003Tv-3Q
 for xen-devel@lists.xenproject.org; Thu, 27 Jan 2022 14:46:21 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e388222a-7f7f-11ec-8eb8-a37418f5ba1a;
 Thu, 27 Jan 2022 15:46:20 +0100 (CET)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2055.outbound.protection.outlook.com [104.47.8.55]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-2-TzRcbC_TMGWkHPFhz6DH9g-1; Thu, 27 Jan 2022 15:46:18 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM9PR04MB8860.eurprd04.prod.outlook.com (2603:10a6:20b:40b::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.17; Thu, 27 Jan
 2022 14:46:17 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::a1a4:21a6:8390:b5d5]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::a1a4:21a6:8390:b5d5%5]) with mapi id 15.20.4930.017; Thu, 27 Jan 2022
 14:46:17 +0000
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
X-Inumbo-ID: e388222a-7f7f-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1643294779;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=+bEpZbv6pnmggZyPNMRZltHtJILWOIMJbeWgkWVBKYQ=;
	b=KUMSOSY0kpqxXYNNVV2opUpbY1QFLNAIcCHyCoeVXC50mqSQzd6WPDeAON6C8vZvM0FBeE
	zPDXiPnFxLBconA9cxGp2qwj9KVPwZE7ape093gzJbzLvai9zGAJwZi6oFqFy1pE93utzE
	gK+qB5Xh1F8AOLKnvMAXgcIu4lEJ2TQ=
X-MC-Unique: TzRcbC_TMGWkHPFhz6DH9g-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MX2a3IOawLbNwaml6vsbqZK+oRN6xkAQhmVR1nHeKEQ88LLiHEhvQxLNBFP2169oz+VG0xiuRucyO9jUp+S6fhXGNDV+lHoaVbKpuXVvzZLHaKyG2EVbEQUjaTLFykZWW9rjRs6leKYHVxsrgIV4syw2ygdREYdbdlhf51/842pGLhE/1vPAPgafbGzdRvMCzl+9nInXcFL2uRTemZlkbILPIRzG4KgrqlgdJm79pVbf0BDKZTlgFdLn6oI7NAHM8MUet1B+IOrGMVhZEUZTV/O1E0qsgNvQFSqwdv8iL+kC7N5LgHT08kMeVR2TSlFEFVTd5gYTH3lk4/P1GIeGPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+bEpZbv6pnmggZyPNMRZltHtJILWOIMJbeWgkWVBKYQ=;
 b=CeCnGBAeOFbLXGShIIkVdpP62QXOlAilM92ULOIwFM+wcrRCVGZLp63G2GM+xCj4p6+rO6JsprzV3hnM5ZMEhoVSYjpp0DKk7BmwuEPdLd3Gi05iI1yOBxEY3mkcY3KYJtvZPclFc/vLnOdc7Mpdr9YHqYvTr4aG8xypXwvRijoRZmCUbq+nmn4plXNRivJ5ynSmSLOTJGe9V4TKvsQKpcdLyZqaEmrlfL5DoqtFXgfgZprYJvGVw/4RGI89iEQX0Ysv0Ui7NVeVogMoZOMze114OwtNSOmGRtV78hD6qWQ4JWhWrfHn/qGKG2hJdtOC5Ze8sbm5/681qkhDZvG5dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <4b7db7ae-eb84-7ecc-4334-fe5f0f7ef46b@suse.com>
Date: Thu, 27 Jan 2022 15:46:16 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2 0/4] (mainly) IOMMU hook adjustments
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR02CA0036.eurprd02.prod.outlook.com
 (2603:10a6:20b:6e::49) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 49e86145-d5dc-4ec9-ea79-08d9e1a3c675
X-MS-TrafficTypeDiagnostic: AM9PR04MB8860:EE_
X-Microsoft-Antispam-PRVS:
	<AM9PR04MB88601B3BE023AD5EBDB1D50DB3219@AM9PR04MB8860.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	GYnM8c+3x6dXnf1kmGdEJeEW2mrwOIeGc13sUyTUTZ6VOzPIa/CxW8Cn+dKj1MkaADuiLe9OrKsnvVrrsWKC6pI88seC4C7C4AbT7knRL+G57XAK6nNW+hSdwPv2V7eQTfpqgEGmVM1Cu8Mm9Di3JJYrAsDHT6n53P5jaN+szQqveSjNB5NRJmDrKSYVQHdzMuGqjbBts5U5gOZDiUvWqz1wIHiXpB0pjM4r1fnwMP4TU6hTLHPN0ikbCKVyQIG0lt/rqOIHyZ4KxVUcxPxIq2k5t+X2t/keVa1O74Byl/grjm3x6WxRJPokuqaBF+lIjIZ6sJbZxNsrlDxwe4sXFBCXMGJCYC1UGgaaAsLlrOLgr7m0y6X3V5WqSqg0eCIwk7btUOqiGc726HGU92iscej7K06NsUH9bzeHYRtftDTOvoGvxysT5/iOUrTHFOXFea1rs2DWWoKI9WbcTiQWDZJ+NYwdMnDp97hczaIHf/i6/uHelL4Bydiama0VvGCuj/skiEWkEgteutq5/WmfvbnN3iCEH5T970zUT1yUf5zkASS62GLtFYW2BX4jju87MDutSLhpmxU2kEFIEDsEc7fyxvkwU5HdBERsXmKs0Pfh+mEjias9bxVcdMcZ3SZws/6/b/A4wamtQpano413ghSzE0xgB9/w30QB5CGy0/VEXQ5+aopkG10RWSDsI4gZsHDIhoSA5PWpbCF/73OWTIdKxrlnTHzClIhS1a/PTaXPVzm1POcR6y81D8gFGVGG
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(83380400001)(86362001)(186003)(26005)(316002)(38100700002)(4326008)(8676002)(6506007)(8936002)(66476007)(66556008)(66946007)(5660300002)(6512007)(2616005)(4744005)(31696002)(54906003)(36756003)(508600001)(6916009)(31686004)(2906002)(6486002)(43740500002)(45980500001)(20210929001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cGo2MWN3djh1d2ZhVGZINnVqYld1VjNYQVFKVmtaNzhTZmtjZmpiL1crSENX?=
 =?utf-8?B?ZEtVU21jd2xjOGNXd3NHdW5ITVRjaVUvSmZxZjhha3NJTEFWajBKY1k1c1k2?=
 =?utf-8?B?bTZ0d1h3aklrcTJSalMydGdGcXdkc2xQOWp6NGRrU2d3Y1N0cU5mNVhua1RH?=
 =?utf-8?B?TVJ0bTRMUkc3aURVK3JCbXNSb3B0RzZGNjc5STRRbCtvQmR0UVIzS01lWU5x?=
 =?utf-8?B?dGc3U3RYL3dMQmYvTHh3L29WODY4ME9XU3dDUXZUMTIyQ0pHYkpxRk1PTGhP?=
 =?utf-8?B?clNjZzIxNlRRVDlJT0o1S3Z4Y1k1dHJqOER2UnVQdVB4OWZUS2srQnNRRDZ1?=
 =?utf-8?B?TS9IMU9pbTMwK2kzRlliTnVpU1puS1o4WjNuSXZMaHJLdXpNNnhqQ1grMThh?=
 =?utf-8?B?WktWOTY0cTF2eXFKb2JOcVZ6TzF1aExJK25meGVrMHR2eU1TSlZCbjNKNUJQ?=
 =?utf-8?B?WWV2cEkvZ3ZvZkowTERaUzBQYS9HY1RtN0pWWXRXTHpmQVd2UXRLZWpzNEt4?=
 =?utf-8?B?NFJHbG0yWW1TUkgvTk0xSkJPNGxONENLUVdxeVpLV2hCc1IzclhIdzZqRzVx?=
 =?utf-8?B?RHdPL1hwK3l5SExJNGo1YmJiMnlPeEdBdXptSi9CMTZDRWRTNG5zL3l1MU9o?=
 =?utf-8?B?ZUt5dFZLWE44bk80Yk9TMnRuYkhNdlZqWGlMQ0ZWczQ0ZFZEN1ZoSUxNNS9R?=
 =?utf-8?B?SGEwM0lycXVOU2hSdmdzcnVhMlNzTUNrdTgzOFkxNnVHQXcwMUVwNENjbXg2?=
 =?utf-8?B?NlRiV056ekhtUlVXdTdrTDhwZHU3RTJ0TTB0RkVkc3JxME53NWtFdkE2bVRV?=
 =?utf-8?B?OWNFcUtKRHdTenVPOGRENHRyV0E2YVhKeStKOUFncGdrL3p6RGtGWUYyZXcw?=
 =?utf-8?B?aFBtTjVLVm4vMW9mOHpBUXQxTTMyUG1EbGsxelF4emNOSXhucFJxWm5Iejlt?=
 =?utf-8?B?Tjhwc1B3TFdPZmdFNmlCdnplRFE3NVBtOHVpS1NBWEpMTkFsN2RlUTVsaG5Y?=
 =?utf-8?B?aFdIbkZTNE9YZmVSbGxHUmhHOFNNcWJLQzJtZnh0aFJGZlVadEp0aXJoZHI4?=
 =?utf-8?B?QmFjcnVDTVVwRFViR0FLMmFCY3RwN2FiWVNhVXhyQmROOTBxT0o0c3JxNFhE?=
 =?utf-8?B?QVNlTUZVNFo5N01rMXJlQmJ0RnI2eFRkVXBhaUhkVkdWblRDLzJmRDJUQTdy?=
 =?utf-8?B?Q1hPWXVOaytCMHZhSy85ZDAvQ3dhNmVQOVJnTDg0cTFXTGgrc3pLbENqTFFp?=
 =?utf-8?B?aElWc2UzOVRjelRjT0lsRTBPVkRVS3NyMEtZVUdmditSekQ4TFlBSGoxOWdS?=
 =?utf-8?B?aER2VjVDTERlcDBvVzl5aU8xbk1iVUdVdng5VFo5WGwrREFSM2U5UVBqb2xQ?=
 =?utf-8?B?NXlCUURwc25VQmJkdXJUdmY3eElvWEpaL2wweW9ORC9zSjlsczBMa2YzSk5T?=
 =?utf-8?B?RENZWUUySUJpZHhiZVN0WTVpYzEvZTk2MGNrb3d3Y0ViWFdlak1Nb0hPK3h0?=
 =?utf-8?B?OFI1NlhJQm1HRGpHUlhiejc2VlRZMDU0K2wvWFNPaUdwVVZ4N3lJeVlCVDEy?=
 =?utf-8?B?VlU5eVlzSUQzQ1BLaHNiV3BRLzJRSUxqR1VScy94WVRlVU01czlWZzZ0WHJ2?=
 =?utf-8?B?amQ4ZjJpSHZJWkxXK0hVa3FmQnNzdFplTmlqY1NLQXE2OWRDdEVTVmwzSEJy?=
 =?utf-8?B?bWwzWUwvMXBaOGVYTkJHVkQ0aFN2b3FoUzY4ZitDdStxK1VubjJ4ZTI5QUFP?=
 =?utf-8?B?Qjl0TW9MMUdTSy9DK0FjRG5LK2tKby91RU5VV1lsZXhVL3dPekl0cHZ6aEhw?=
 =?utf-8?B?ZGdaL25XZ1crSUU2OEhvMThMY2NJekVLdnVVcmIzVDlJQklidTk0NytJRlRx?=
 =?utf-8?B?clBPZGV4eU9vbzdCZDJoTWM0M0dRSDYvdnJVNzNCZHFFcVZsUHR4bXMzNEFn?=
 =?utf-8?B?VWRIcTJldVF6eW9kS3ZVR01ZYmVIWElubTFKaUcvTjlKbS9QZ2l2QmRWelZ0?=
 =?utf-8?B?T2hkYnBUMUU2c0JXZmJ3bkt4NG5VMEJhVHFhbit2SktEd1hSTHJYeWpvN1F0?=
 =?utf-8?B?WVZlVzNtY005TkY2TFJLZm50UTdXUFFaaUdLMG9COEdYcEIwYXdkV2VsQmFs?=
 =?utf-8?B?Q2w3SEZtcHEycVY3U3QvVjE1WUQxR01tLzhrTGRkTGtvaURuMG1aY0o2MGJw?=
 =?utf-8?Q?GKSeM/Y2ShzvipPtTfMAOfw=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49e86145-d5dc-4ec9-ea79-08d9e1a3c675
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2022 14:46:17.7046
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P7+iLwcnoPi9ycMO7IT2aKRkOuitlX8yBTYnKqqEs9/FNDZ5D+OPvchpUf6u0i/oMwoV7zxVxLOBjJu8bfZQSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8860

Besides the altcall conversion, some further adjustments appeared desirable
to do while touching that area.

1: IOMMU/x86: switch to alternatives-call patching in further instances
2: VT-d / x86: re-arrange cache syncing
3: VT-d: replace flush_all_cache()
4: IOMMU/PCI: propagate get_device_group_id() failure

I'm sending this v2 after waiting for quite some time on continuing some
aspects which were discussed on the v1 thread, but no luck. Also there's
a new 4th patch now, as kind of a result from on part of that discussion.

Jan


