Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26B324C1640
	for <lists+xen-devel@lfdr.de>; Wed, 23 Feb 2022 16:14:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.277413.473897 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMtKo-0001Qn-Bc; Wed, 23 Feb 2022 15:13:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 277413.473897; Wed, 23 Feb 2022 15:13:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMtKo-0001Ow-81; Wed, 23 Feb 2022 15:13:42 +0000
Received: by outflank-mailman (input) for mailman id 277413;
 Wed, 23 Feb 2022 15:13:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=DZ7u=TG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nMtKn-0001Oq-5h
 for xen-devel@lists.xenproject.org; Wed, 23 Feb 2022 15:13:41 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2e4e2295-94bb-11ec-8539-5f4723681683;
 Wed, 23 Feb 2022 16:13:40 +0100 (CET)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2177.outbound.protection.outlook.com [104.47.17.177]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-15-DBelr5nwOkSGbXflt4APhg-1; Wed, 23 Feb 2022 16:13:38 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4624.eurprd04.prod.outlook.com (2603:10a6:803:72::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.26; Wed, 23 Feb
 2022 15:13:37 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5017.022; Wed, 23 Feb 2022
 15:13:36 +0000
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
X-Inumbo-ID: 2e4e2295-94bb-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1645629219;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=DfA+KoDOZk7fiA1yr/ZaD1BDBKAQ3tEWWMbgEIRy8qw=;
	b=E0McH2BcnF/ICe2wMVlbe+wpPLe+vZr46n8RHrw9WfkPvv+kGGtyZS1bM4sf9tJ09qIRf3
	w3PIKujfivGVnbaOtXbxFRhv4UYhBUxnLMAHY878jt4VeKKKwZK2vA8PZS3gI6mOvKD+JF
	5G+nRpuYGRTeKNLhd/XpBraIUjIquRs=
X-MC-Unique: DBelr5nwOkSGbXflt4APhg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WaFrPXEV8QwP/RKJa4xN4uiWyXchaobomLcYNjOAxmdw/uXIyy9zOhnnWdia7U0FRs94zrMxatLsDL6NKtPRMg59CV5Cg6EkVO1/v/7l9QT8T6fdOuQ5IhyyeZ5vR+kHrUsoy1SJEI4p4TWhSH3JoifWYeUoH28U1V4oHci97mHHNNbd5MV6AquDt3FF6i1piQIdmlxZVPAJ4gvJOLz/zgNjMj90N3L4n7dYEs9PqVgEN/zQRToOwmOonup8ycxa6H+V4Y6pJTlCQhZpiiLHLVKjeXAQbMexH97FTExwEb2rGwpMkgaFL/ISoz2ob1+FhN9p1BWoockzAtSOeaqQIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DfA+KoDOZk7fiA1yr/ZaD1BDBKAQ3tEWWMbgEIRy8qw=;
 b=lFLUVToitTjeianCoMI2CiZpdnpqP5r4TF7S6L9VNiaoi0Iy8x7UMz3Z6z1P+m/+jA+YSNHvTYOW3B7lvWhJywm67KHfI5pteaad/YicpiAH79Ttvm89ISZrl4rU0u+uXRqj7CPyDzmzLZAb4/inRzSZhn93XBFdSBbwleVj/wwTsMhvshrGg8Zw/qydO1jbr/8AXjzBqVgwjr93EPIfgBW6Z1U2i1NYGtWOWWhOmVEe7f9ef6cHtlQpwttl9+9B6Jv4PR8wCRjo8+WZZzBm8Os1rFgLI5eEwXzWlc4t/GyqnXPkbOxg5b4v0GStb/Am7ft1h40xaT98vaYOe0pwlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <32526b73-25f7-e6b0-208b-669a7648ee44@suse.com>
Date: Wed, 23 Feb 2022 16:13:35 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 0/2] x86/p2m: type checking adjustments
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0190.eurprd04.prod.outlook.com
 (2603:10a6:20b:2f3::15) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f3d66da9-dd66-47bb-eb96-08d9f6df10a5
X-MS-TrafficTypeDiagnostic: VI1PR04MB4624:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB46245EE55ADF81F9683197EFB33C9@VI1PR04MB4624.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	F+u/irnt+CXc9cuNMQYEKaSZSyfVrR5GqtSrB3zVP4ATKtv2+te8X72Q/KajMhpj/zv67Inl5dr/g4WwTk/nItJDbL/zRxdz368Pb1WYMxSWU/qlVxr3oroS3d73LYpghdnXQ7n38DGAT6irESBaQJcZ0uqF+uIBdkdGOzwccK+My87nprg42ku2QgZ5RCZrMDtcGNo1IzreL2zg7PTmkiYVWyQ15ot7LezFQ3rxh9zv0bxqkvE7czkMIxiZikIAk61ToD3+i/BNURq4duftjUjKNjd83897eB4Nf/Ysxz3uxYaQmKw+fRH1z2U197sUjJ9aMNLjIv61MXVN5nHaccrzUWnMKx50z3c9vhzwHn1c2Rr+tpH5fU1GveIUceE8deM2KjkwPHf/ilqHEXH+F+jAASQU8OyiMNEH6smk30C8C3KRY0ABeAUfQPAjQpy57Z5b2uigi+ewZLJe4v8eOGFDVYBqO2e0RWQTU/8Qwx83IO0L+ogc4SPb9paq+goDGdLt0CKjrs7OLeWq+XaNLpFiEDbu34sAUE0DEd992ecS86cb96SIJ1MbcEg42XlLj9nDWdgv6hgGzrKHQMNo/XykjfzvCXq8NtVzbHedScvhXqP3S682t9jiIjWxJauk2O/bgxIDCcOA0s0KgR1EmhXSrNUE7KnR0/hO0fLBjClqVc3GcfwK65BBHsE528WFAk+MV51gKlJo1iLRO513WkKAXmgbx1enIBfXaWI1HSY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(186003)(2616005)(38100700002)(26005)(86362001)(31696002)(54906003)(4744005)(5660300002)(8676002)(316002)(6916009)(66556008)(66476007)(66946007)(2906002)(4326008)(508600001)(31686004)(6486002)(36756003)(6506007)(6512007)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TGRaSW83ZHFKaXJzOTkrT3BlTWtob1pFQ3p4UDA1ditDKzdQYS9kN3F4NlI3?=
 =?utf-8?B?SUNoZjQxTHB3eHFyRVB4R3VFaGlGVDNVeWRMT2pTelZ3YUtsQzAyV0labUd6?=
 =?utf-8?B?V0dDWVJhcVV6UUt5RTdkOUlGUnkrQXNXTjBBdTRlb3dGN3Vud1dZL2M3U2JV?=
 =?utf-8?B?VTdmOG1Bcmd4TXZ1bmJTSGFLbDFkOW56N1ZMcXg0YXdMbXZKZWZVcHg1aUUv?=
 =?utf-8?B?ak9wMVAvYUZoUDBqbTdwZzE4RDJHblZ5cEtsZEdjOC96bjZBSTJkY0l2dG92?=
 =?utf-8?B?OUlmV2FMRTNYZms2Wis1a1NtZ25rT2ptUDEvclEydWxjYzVEK0tGNVFaQUtT?=
 =?utf-8?B?b0lhbzdXYlFmTFZGbFJ2N05neHgwMVlrS0x4RE5VL1NWYU9CR3doK1Y2VVdj?=
 =?utf-8?B?aitueVVGTy9hR21qVzE0ekFUU01FS1dTNElESDM3aG0yTllPa3EwMS92ZzMr?=
 =?utf-8?B?K0ZIMWszcndUOHZVcnNVU3lXZHgyeEEzUXkxQWh3eGNQenpHSTZVeVdBQmhD?=
 =?utf-8?B?VnZBQnhMd1R2VGJQZDlKYS9ZbjZRWFNybUEzcHZSRUJSVmh0TDU5K0VZc2U5?=
 =?utf-8?B?czZmU3pEV09mSldqeCsxTlo1MHpYa05QOHlld1hLL29jaEJER21zS0JhckRR?=
 =?utf-8?B?L1lRK3p4ZzJtbnExL0dpZjYzMDU4MUlFNEJpM0JRSkNYZmhLbEFNclpQNWZj?=
 =?utf-8?B?cTk4ODExWFhVY0pPY2dPcTBtdGxuVkpzd2hLQlJDYTF3aWlnTkNzNncxa3Vz?=
 =?utf-8?B?ZzV4NnUrTEFUVEZZeVQ0SFJwc2F1d3BsYStFb3BuR01SYXhOc1Z6Y2FZZ3A0?=
 =?utf-8?B?U3BCcnJsL2g5WGxkSDFmT3FEVS9nNW0wTmJPOXBncnBYNHdOcllJeXhJNVZM?=
 =?utf-8?B?bW1MSjNyRWxiVlZlWk9EK1ZwTTRYSG9xY09qRHhRQkxPb1NMWkYzbjR5V1cx?=
 =?utf-8?B?SHNyS1NTMEVnSmh0aHBHMUd1NHdhMTdVNVpUU1QxVTE4cVBjY0tIemNPY2pq?=
 =?utf-8?B?UHhjN0pUc2dXc0xnQkpCeTZNcWZtVUtsdmN4eUhYUWFtNG1JWDNUVUt3SER1?=
 =?utf-8?B?OGl3ODF6YkR5RnFpeFRLdGZXYVJ5S1hCZHZiQnRLRXRGdFRVMXo2OEdmNEE3?=
 =?utf-8?B?Y2xoSjI5eC80ZW90RFp4aW1TRFZkU1kwemd2MVdxblZmMlN1eVNKQkp3b1hC?=
 =?utf-8?B?d1UrZGpOSTJCd0pVYVh5c05MNnZjN2lxVXJrWVJsZ3djSWNtcGFpMHY1U0lw?=
 =?utf-8?B?RDA1RW0rN1JxOVhxbzlWMG1IaWZJRit2OTZ6bENOS2hKMmp1SENya3RzeDlW?=
 =?utf-8?B?VEZ0Ym4xMi9JOVhxaVFScW5teWxDOURqUzJnMjkvRG1naEJFcEY3SzFodTc4?=
 =?utf-8?B?NzlRaUpQTjkvd2tKcndYNWd5SW13NDg2S1h6VnNxOWYxUVNOUkhoeFhoTjZt?=
 =?utf-8?B?ZzFTZEhtZS83UU12R01aSktkNVY0b2ljalBBQjVFTm1rd3FGQ0cxUmpVZXFZ?=
 =?utf-8?B?SVJxZHVmakFhMWM3cTdpZHRLd0ozZFZHZTZmZ0lxS3EzSGQvdkNuYzFzNjZF?=
 =?utf-8?B?RDlJbXJSVElCWXBxMUVHcnRzUXBuRXRzVERHY1BtMGFuMlpJWks0eWlxbkFF?=
 =?utf-8?B?bzhIT1lIWk5rS3lCQVNmemF0RVNXcGxhWTJySGdaNk5MVmtRNXpZL2M0VzBV?=
 =?utf-8?B?WGU3MHFSTERoWlhYc2twamVpQVEwb0E2MDJ4bXRFTTdQRnVrQUJpdTRHQncx?=
 =?utf-8?B?bEh3eUZiZU9SOU5sZmJVRVJvblRxWDc0NHNHV3RXSWd0K2ZLUlhJRURXVmJ2?=
 =?utf-8?B?T2xwMWlKVG43UCs0bmxpNlA4MzhHaE9oZjNVcHNSbWlOVUw4dVcyQ2pkMFpE?=
 =?utf-8?B?NmI1MGFkY01ZMWJsLysvWjNETDJMaDgxeW9EdGFqWXhDaXVuRVJhcGVDaWo3?=
 =?utf-8?B?UXFRMEh6eTJaN0lsLzAwZ0laamh6TjJLdGdrblkyOUo5U25JVDUwbzdYN2dq?=
 =?utf-8?B?RWxNVW1sbkdUZjFSMzhDQWhuUGtRN3pyVXNaZWhueWx3Nk96YXQ4TGg2blFW?=
 =?utf-8?B?RmlrTjhDR3hwWFZFbmdROVZmeFh5WHltSCt4ZXkwSHRyQytQdUE2cjUxR2Nh?=
 =?utf-8?B?VGtJUVZwdHk1aWZjditqTVhXVjg2cldSOHIxcUREWkJPYnRrdnJzbElrTUJy?=
 =?utf-8?Q?Vy/ybRTd4v8d1wD1muzXkPI=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3d66da9-dd66-47bb-eb96-08d9f6df10a5
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2022 15:13:36.8803
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ica0JdBLUobpD9wpLCD7RRaJrhZrakRQBYOD/h257dI57TxIQkTaY9y9fo9Ew5rc/NylQSa1ypCfBqV+0bRG1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4624

While the first change is a bug fix (for, admittedly, a case which
apparently hasn't occurred in practice, or else we would have had
bug reports), it already puts in place an instance of what the 2nd
patch is proposing for perhaps wider use.

1: make p2m_get_page_from_gfn() handle grant and shared cases better
2: aid the compiler in folding p2m_is_...()

Jan


