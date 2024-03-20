Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DE03880C63
	for <lists+xen-devel@lfdr.de>; Wed, 20 Mar 2024 08:51:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.695761.1085802 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmqiT-0001F7-Bh; Wed, 20 Mar 2024 07:50:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 695761.1085802; Wed, 20 Mar 2024 07:50:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmqiT-0001Da-8b; Wed, 20 Mar 2024 07:50:29 +0000
Received: by outflank-mailman (input) for mailman id 695761;
 Wed, 20 Mar 2024 07:50:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QeEy=K2=hotmail.com=rafael_andreas@srs-se1.protection.inumbo.net>)
 id 1rmqiR-0001DS-E8
 for xen-devel@lists.xenproject.org; Wed, 20 Mar 2024 07:50:27 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05olkn20822.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::822])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 837ee092-e68e-11ee-afdd-a90da7624cb6;
 Wed, 20 Mar 2024 08:50:26 +0100 (CET)
Received: from DU0P192MB1700.EURP192.PROD.OUTLOOK.COM (2603:10a6:10:3bf::6) by
 PR3P192MB0828.EURP192.PROD.OUTLOOK.COM (2603:10a6:102:45::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7386.34; Wed, 20 Mar 2024 07:50:25 +0000
Received: from DU0P192MB1700.EURP192.PROD.OUTLOOK.COM
 ([fe80::181e:3628:177d:1cf9]) by DU0P192MB1700.EURP192.PROD.OUTLOOK.COM
 ([fe80::181e:3628:177d:1cf9%4]) with mapi id 15.20.7386.017; Wed, 20 Mar 2024
 07:50:25 +0000
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
X-Inumbo-ID: 837ee092-e68e-11ee-afdd-a90da7624cb6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EPh6sUEZoft7DbCubf8lEdYWia+TTfGdDyCxAQG+YST9aCon5PH962gIGjy405XqptcB94AaqMKFEMagOqY2UPdp6BCSmc/hr6cjGBXuB++9x5ROk/AZ21JGaj9yHbjtWvco8vlfz0+N4LNVd0cdRlzgUDT2mSLpYxrQDRhpAoio4COJUZczn8Fa9jqGNiP/36e6i6mLLdFdYwDtlMm3JMoc6dYeJj87h4oLsZ81WWJIoVzD2uxkJl2IbzpENsTg3qhaBJlZ6Ip56Bj0i+Zea6LLClc/8XHQtpF7AfrWMaXJTEERuEt1CxqZYXmg/ez0Rw0FkK//lDw8r7UTvBYaPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JSYeSAndKBPWjFc/iu3az3wJIFiMVk5/rcYAZYNPiT8=;
 b=ZDlospzqRFycyXgui5E++pdZJTYMxNaNTNnV9IfjmUpj51T2J5BRpQsTDRBJJQFnqAn83QWp3um3YPwDwcLVYrvSw7ljeipegp3w6yf/S4OWjUUOkXEEPieS7GEVSUnaLRMXL7PuLikPMoLbbDQqv3fqnGHs1ivE3U/5OemqcNWcrmwe66I3VHnX/bsjaw8IytaoOgorjQgFtuw62bkOlOWdKrKeGrLkeQVnLQ8bXYkNT9dGLYtZesdpK3H8cFmhnTBq6+TUiEtDomUx8VW6gD5eaokoaTg37W/ehO0/hNkMhwnDOkNiHB4bMmT855Wu1BbgsuRWlXMhL17KsdgOcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JSYeSAndKBPWjFc/iu3az3wJIFiMVk5/rcYAZYNPiT8=;
 b=gbs7GJlRBlKpTfiH80sUHwP74/4cQS9osWCQ7T7mRYpBR0SWk+c3iQhbH2G/V8/LtmQhNeQivOdzss3jcyThzv1HnA45Dp8LGUVbOPuh13zYqL2MdFVlR6mvvMbIYIqMjhcMOlo+pa+pGz2L801jbD56TxDSmk8JAN20i00Oa/dZxWCAfDwUcVSmCiyZPbhMvAqgIP8hLTmd375JkzbEdpWHxN1kWwJbr4Rl+Nv3K+R6W8w4mKvh+TgAIFiebfMyQ2u+9oJLAKa6sha1W2I/fW3uJs+WczfQzmVs/TRqyhlV9ypN5BdECfjScSMZnP6srVUKQ3fw12F9Fb7JDJOEYA==
From: =?UTF-8?q?Rafa=C3=ABl=20Kooi?= <rafael_andreas@hotmail.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Rafa=C3=ABl=20Kooi?= <rafael_andreas@hotmail.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [XEN PATCH v2 0/1] tools: init scripts: Add missing XENCONSOLED_ARGS variable to xencommons
Date: Wed, 20 Mar 2024 08:48:32 +0100
Message-ID:
 <DU0P192MB1700AD4C3E33FF8F5D6E90F0E3332@DU0P192MB1700.EURP192.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.44.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TMN: [fsv3Hz1Fr1Ul2d5Xru2Ov2r3g4Wf/rJI4JYxgckilQQxnc4fZjbuicmTHNxn23Hi]
X-ClientProxiedBy: FR4P281CA0360.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f4::13) To DU0P192MB1700.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:10:3bf::6)
X-Microsoft-Original-Message-ID:
 <cover.1710920673.git.rafael_andreas@hotmail.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0P192MB1700:EE_|PR3P192MB0828:EE_
X-MS-Office365-Filtering-Correlation-Id: 08a75925-1b63-48d5-6ce3-08dc48b266dd
X-MS-Exchange-SLBlob-MailProps:
	laRBL560oLSDAxiCsf/0myDYsncr6f650xf3iTc8bJVH2GXdBR9eUjpcjLbYPSWuH9GUrxpZxQuc2T3u8KnQpw7V2ARkz1Z4OV3Jh0Hcr2+z4TQI9YjHWcMv+/94HQ9xgI15FLtW44zuGFNgaDnfEf0l7UIOxHb6rYIf5z62G4PEzw5/Iw6QseVpb5P6dWtxywcTYNKsWyBu6Qd6Op0osh1lrggaEO5HcHznW5IK7e7W1IgdkawwDx3K/C+OiZFlUP5LDcIubm2CYDI57L6RLkZoWIWmHrHhDd8EjIhHYBVPmgW62G+W5ANZYW0HGMkRuoVW4JrkMDJFgjUAUxFnstn4/LDIy68uNBawx0oT38vZ8+FA7ImmGr0pT/Sp/xxkcR6Cd4Sb5p/3o/qvtI0Ittfg9mjw6EvlJdWyd6DI78MJzMwXIWmjjkJf6SwJ9uMXEd2DbDKfHiwsKQrHEWSngyJGvzpa6U9mAL/gLY2VrhdellpGEN0rdrt+I8l57ik159I5xG04MHF3X+m4Lssoy1dGuNGuIXS+HTe5KtmkmD10W3+9Odi1J8J3MLEvtCcXd/N1QkTB+2rwiaKTLNlno1MU8RxAAqn+qoOy2iDHTMW1Kf9XPQd2Xptk42NY660Y34jITJbwUeo5oosLK7eXS84CgqSuFzuAioKqQ3FMODb9IUk88HrddN/Svs3BrMGPoSuiG7IXU3/8Nv0V3nqz44qlz8E4Q5kIj6NB4JNgSl+cWAn5X4NTrilVRGGC81N/224Hzn5jThHqKLUVk5qVpArW5FssV3RG
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	O7zSOWYl9iX7u71+5EPvKbxgyG/V4Um2Ut5oOeuiw+s5aEPb2AnAO4DnR/TdN+wSGGp2UDM9atM4MsvH/U88xMrhjcF6OB76RDUDABmFfoAN7bRCDj81zS+dTf9A7o76pgCb9bYGAT4S57GQ/Smk9gf4TorneoXYzAMRIXIpdLDag4wNTrVnhc78JyMAgea1F70QG3t0qkX5mTVF8rQ3MPClmFHRWfrAG7hMDMIbnJ3Sr4mXLxeQscdIhgwkgJmnLJSrSXJpn91e9iux4jaBsxbkfoaVWY/LVfOXtArD+FsF3pXHxhrNzCkZhS3Xowa92jQ9mVPbLlXrUd5WHih7zZbgIQ1CVO9JkDfRD93yIlk2/ePpe3dsKf70W0HFKDcqmRsa+eOzD3uBHTbrj2XjvKE7F6jYRlpcriMjs7E7JRaTJ67LtNpZkxNHdhMxfWq/0tEws6K09fYclREYtSCKxYLdE4xAXnkuS55XZyKBwttaFD65dZphXZotieG+aD0k0RkMP7dCEl6qpweYYEThiKrm08jPF0LSphO48QtNtdHsqOBdxXIl4M7tJhuovIhEneccyswQVQ8wNORp/t8HcmOLrq3CwmOczG8QT0LMw3YUCUAKgDyARQ5PJhqnD69G
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NG5LcGkrUTRzMWxnOWZ3WFVydUpTS1V4bVhXTkwvV0lmSlZkcUx5dk05UkQ3?=
 =?utf-8?B?NjE2RGN6a1BSYUtOekFmYnQ0K2JmbjJWempuS29uMWZDTU1ROFZIcUNFaDR6?=
 =?utf-8?B?S2kwQWh3R3pnTXVjM0NaUjB1RDl4Z1hKaHFLdTFkSUFiZDhoMm5rMEJpc1p1?=
 =?utf-8?B?eFRUcUFKV04vTGEwTEdNSTFaRE9uVVI1Y2NLNmthL1VSZEFjZnB3MGt0WnEz?=
 =?utf-8?B?MFVZeWErODRkQjlIOCtsTTA2RnplSnlCcDVKcFNCMEVrUzllK2h6Vy9rK2tW?=
 =?utf-8?B?SzFnZlF0ZzBEUFk5ZERnT0U1UmZHd1krakNJcGtOajJpYUdUMlBpbTB2MUc0?=
 =?utf-8?B?ZUM5Vm93Q3p5eXRjdnBuMXYvb3JDME11aExqUmZnYmQrWDA4QzNGcC9KeGV4?=
 =?utf-8?B?VFhOZFN6NnU1Q0RHVHArNjJ3djlkRXAzZzk4QXpMaVBDTUp6UUZRNkY3REo5?=
 =?utf-8?B?NFRUcG16Q2lUbkhVQTBxckpqMmpjaGRCa25XV2JuTGFQQS9YSncrcFZCMFU1?=
 =?utf-8?B?Q0t2dkdZelBwYk9RSy9CeWd6VjJSUDRERy9BNjlwTGpscDhreUI4OTAzeWtk?=
 =?utf-8?B?aGpiUk1IeEJZYlA0NG5mNFNldUxuM1RRVmdrUGNlMGVCMXMvVmE1cmhDS1hi?=
 =?utf-8?B?VXFvUjlCa3J3aDZWZjVoaHYxdHpRTnNocG1Yd1VETmVveGk0d05oelNjNldN?=
 =?utf-8?B?TkQrQk83WVlxa1ZyQ1dJaHlkRE1LOUNuMHlBMWNvNUhKUEVaWDlpbnc2TzVt?=
 =?utf-8?B?OHhiaFFYYVdCRmphU0o4NFlBUUZNWk5CQ2N5dTJqYUFzWTl1WjRoT3poV29T?=
 =?utf-8?B?d2ZBSko3M0tCcXRCNFJjKzRuUkZoK1c4c1doQkdhWStHNHJuelJEbkkwSUdl?=
 =?utf-8?B?VXpzZHozdk5tSFpzdElEdDZFK2ZocjBLajNPcXpCdkdxM3ZXNFRPRGUyMlR3?=
 =?utf-8?B?TDVvQi9qZE00SDh5dDRvQUZ3TDhFOUk4Z1BZSXQ5V2grVmNqQUM3Q1R2V1BL?=
 =?utf-8?B?TFBqNTV1RWRGQm9WRWlmdHpRRHA5aGNVeW9BOGhnRHQzQ0FURGxQcjQ2aWNG?=
 =?utf-8?B?clhDQUF0UCtGRjZsdWs0WHpYL2c0bGlZbDRJMHNlZ3oyRkFDMG1USUdYNytF?=
 =?utf-8?B?QVJPWThpQ2NYT3BnTTVKb2NFaVZlYXY5dWgrb3VueDV4OVBqY05UdkREVnF4?=
 =?utf-8?B?OFZkUXFJaFlBQTBUeHhKMlY2a29tVG9hK3B0d0ZDbnUyMlFRTEkzcWozUURL?=
 =?utf-8?B?dHA2M3BFeE50NzI1enI1alNlL2hPU1V1RHUzL0dJV29Oam00bU9EUC9xVm9v?=
 =?utf-8?B?dmNsSUhlNDYxWkQyYXY0YkRoUXVXQzhHbjErY0djQWtkTFAxd3ByT0QvM1dS?=
 =?utf-8?B?ZlVKWmVLMWYxUW4wbVZDQm5Delo2Z1NFc0J0VklCT0poS3RCM000WjZWcHJw?=
 =?utf-8?B?eHBlMGlNSHNvWXpZNmhHaHZQN3hrQnpXcW1WbkljTDhSdWlnQzJmQ2JwdWsr?=
 =?utf-8?B?TzBBdWhWZm9Rd2c0dkZTTXpQTFdUSUlUMC9wY2s5czJ5bEs5T1phdUpteUpH?=
 =?utf-8?B?WEY0VENlZmZxb241NXM1M2orSFd1S010UFQrT21rcHVWbFBkK2E4Wnh6anFk?=
 =?utf-8?B?QnFGUzRVTFUrZTRsMHBhc1d2NWhDNlRWUVAzZmNtSXlJbDVzendVRGg0M2t1?=
 =?utf-8?B?Sk1OdDJ1b2dPWnlhTDNnaW83cnE1bHkyaTZ0WTlIQWlodTZOUjY5T2hkZi9h?=
 =?utf-8?Q?G3lo73byU+Ks89GW+ercYrsF1nUFDAuG7qpbyja?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-fb43a.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 08a75925-1b63-48d5-6ce3-08dc48b266dd
X-MS-Exchange-CrossTenant-AuthSource: DU0P192MB1700.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2024 07:50:25.1180
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3P192MB0828

V2: Now without test emails ending up on the mailing list. And with the
correct title prefix.

I noticed that the systemd services referenced the XENCONSOLED_ARGS
variable, but it was missing from xencommons.
I actually ran into this when experimenting with a Qubes patch where I
thought I needed to modify this variable. It turned out to not be the
case, but I figure it's good to include this for sake of completeness.

Rafaël Kooi (1):
  tools: init scripts: Add missing XENCONSOLED_ARGS variable

 tools/hotplug/Linux/init.d/sysconfig.xencommons.in | 6 ++++++
 1 file changed, 6 insertions(+)

-- 
2.44.0


