Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20B4E6C4867
	for <lists+xen-devel@lfdr.de>; Wed, 22 Mar 2023 12:00:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.513338.794175 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pewC5-00067j-TA; Wed, 22 Mar 2023 10:59:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 513338.794175; Wed, 22 Mar 2023 10:59:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pewC5-00064t-Pm; Wed, 22 Mar 2023 10:59:49 +0000
Received: by outflank-mailman (input) for mailman id 513338;
 Wed, 22 Mar 2023 10:59:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SGSf=7O=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pewC3-00064n-U4
 for xen-devel@lists.xenproject.org; Wed, 22 Mar 2023 10:59:48 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2062c.outbound.protection.outlook.com
 [2a01:111:f400:7d00::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a7d732a9-c8a0-11ed-85db-49a42c6b2330;
 Wed, 22 Mar 2023 11:59:46 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PA4PR04MB7887.eurprd04.prod.outlook.com (2603:10a6:102:c9::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Wed, 22 Mar
 2023 10:59:43 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.037; Wed, 22 Mar 2023
 10:59:43 +0000
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
X-Inumbo-ID: a7d732a9-c8a0-11ed-85db-49a42c6b2330
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jk2p7NhYIgUSpRDpEXXPFM/x1qT7UJb21CNqOUGxVse3e7Ksf/3+guOSLkShnQTnHXaZ4mVQqLpHO0AY+ymGJFWxjgJxawJPPMeQPxvKME/qeXvpg4F/SRl0QD9ckK1TJjHw85Lyh2rTq4nmxWizUWlWKUwyDIEeuDxoRTaIVckiph6825WK3AiFi3eJYAVsRajxWhp2Rap49z8IGf7oJxt5Qtf1pihIsJCTUd3poXeOMNAS0EORVaQxO3MG//yQ/ZgZqVoQGg1cG/zImv+HgMsATeL+OCvnkOE8/JdmBg/+3Ct5rblfnPqjpvkyTTWjRgWQRFjqVFdDye0Hxoen5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qk6pneueVWqDtadW3WGirrHvMSJ7bTzjdbhVxSHHs0g=;
 b=LTQHWR1fNQA6YKE9HG7htKrt2jz4WW8CTt1u22X/nqkinN7J96MiyhW7ehdZjxzX7cBEXog1tpbpbJDAKyuOxQm/8iBMKWU8NZEmjUjk3NL+lZzfDHzrR+bgkAC/NQ1qRK4usGw18Q+4MpgEQ5Q9A0ZJzH/DwRFXwHUzQSFvaHkgx/VR1nwo0axY2I2Rrb4jTjBYx6yxFKE1IP0jxHKW7D8sAO+lFGAf0XBBMqut+hrjxhhh6snWfggPFjTFFn8B8EwzQoiXqCWIQOYTE7tnQEie9lJDPREJseEIRjCfh+5VUBNhRjwrrz+rVdwtyoQiqeV12eUzLi7ML3jhfNdsew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qk6pneueVWqDtadW3WGirrHvMSJ7bTzjdbhVxSHHs0g=;
 b=O9KJzc2bB0pRMoj0LencwgaMYfGrFCASkOOkuc6UpA8UYQAD51tvT6Ram2+khHFWqak/bJNZ2766LbBOVt3v7s7W4+jzsNLxh30I3mihankuJIAJc9euAAaQi3EvoKSqFllOB3Hn1Y442z+F/j+L7Nyr+BumJZmPfIMaiHPKQarTwCk1Xkfh7jGeS/Tprj7BdHvGcCJcpC7oq7z7wixaVkpDJGrRm3b+qFPks/U18PoqfTQv2icABE6xhJZaaDgSD8LsdfZNyrYfipiQNa7z+CsWsOO8Sh3suW0YsSQu8cag8pwTx/TjIoz2imREu1yvueLQYPs2mSQWIUd5k/1b+A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a2b798b6-a5f8-abde-222c-5049cc11c6eb@suse.com>
Date: Wed, 22 Mar 2023 11:59:40 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Anthony Perard <anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] include: don't mention stub headers more than once in a make
 rule
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0134.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:94::18) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PA4PR04MB7887:EE_
X-MS-Office365-Filtering-Correlation-Id: a7120e5e-e34d-4e4b-c0d9-08db2ac48abf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZGC+e7roqfATswC2VhoIMvMxU0WbkRu6SXdS0v5BSsklp4UWKwXP+9GMbODI9N0Y16M4qpBDA7tCUQbBS4fp92pVCm15XjoBJpCPX9NsbVnWUiPE44ZvnCd6MBHhxYplBaEWX8pDL+ownOaxDmG3NQ4tQIIgXXb53MFMYWkr+Yd9D47spE2A+qwiJbzRkU0KxWNAXZ35+u5eV3/UdTa8v+VCdWZeddago1WUZdtGw7OE4QD1IJp/ve8fAfrbEhpAJwYPbGbIVMvu3PHdIwa6eS/emv1mczCwVwi4VVWVmxsrcDgySUUrwtBx9OOjVxmm9/SKYpVn5TbhjCVPsRYgL+dOLbd/a3+YMI4vNNh1xhi5iDEv4niBuN0KDfSqj4bO/n+R0ME+gAqUZKnEBKt/YMgyEN4xgneNrXN1YwzRFQaLdHWjVcg29vOg7s+cfTbTRYOSC2MN9+YjlaMj9HsplvqEsoDri0Dv56y4BlTZCAhJJMBmV3zsuXy+zYPqVeR9ROcXfihhFU2cLeDid4b5JFonzhboM14R6aEPV2/wpHe9aWFCndS1ULDqXZ7RNzvcnfiu2VHPIhTIW3S5bTmaERBq6oRzyPtjLGPS7JAxX7goBzRJBW+g4r2htp8++/T3T0XV+/1WVj+NJeoy7BkJM0VM2UM9fzIYdvIJ8EJBbvIOwIXslrhr8+YUlcTbloo1bn6rjNZ6E99LHv/EjLhRLReCC/PwmW/uzxQae0J+ff8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(376002)(346002)(136003)(366004)(39860400002)(396003)(451199018)(86362001)(31696002)(36756003)(316002)(6916009)(8676002)(8936002)(4326008)(66476007)(478600001)(54906003)(66946007)(66556008)(6506007)(26005)(2616005)(31686004)(6486002)(6512007)(38100700002)(186003)(4744005)(5660300002)(41300700001)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VlZQc3BBTjhwczlGa1BJOU9wYzQ2c0xGeitDam5hQVJGZGw1Q2cxWnZxR3V2?=
 =?utf-8?B?RkQzc2J6OFhmYmQxZTI0ZzZMSEs3QUxMZC8xUEEwWVIxS0FURXpnd3lOaHoy?=
 =?utf-8?B?TkNQcnl6Z0dzMU9hdHpKeGk3WFB2dWF6aGl4dFFUQTJISVp4dFdQNUF4OWFR?=
 =?utf-8?B?bzNTS3BabWZqSVo2dFpVT2V6bU5NdHl5OEFiOFcrbkFCWVU4L3NHVmN1aisv?=
 =?utf-8?B?bmQxcW1NZ3QycFlyT1NNN3hjYU50bGhBZk8vZmNuQlpiMGFhSWtabndSYUg2?=
 =?utf-8?B?Z2lWOER4Q2dESXdGdVBSeGhlRkc0UzFJRmc1ckxXSWxwRnF0UG1taG9EdzY5?=
 =?utf-8?B?V1QzR3MrR3VzTjYxdkY3eFdYTjBnaG54YXlHdXBVK2ovaGVNUU5tZkFBUUMv?=
 =?utf-8?B?dU9zdEdKS3M2L01BdndBMHdTbE50NnVLNWRRTjduQkN0RGJUYTc5SkFlOTZ0?=
 =?utf-8?B?UUZ4eHFQSFB6KzBhSzYwcDYwVHQ3SDExZ1RzUGc0dFNDSlRSSVNvcHV3NFpk?=
 =?utf-8?B?YThUbVljdWZGOW56eFgzYmwwSTVOeVhqYWk2T0dLdEh5U2dEZEFQb2hORDV5?=
 =?utf-8?B?UTN1ZU44T2RNNTJjLzJoa2JzSkg5Y3UxNWhVTE4wVjJhMEZqVE9EODdWSnpL?=
 =?utf-8?B?T2JUY0dUdUxlSUt3NHFZdkJSSjlRL09rYjFZVEhvbHRicnF1bE4yTEtpYkNu?=
 =?utf-8?B?UVBQdDhmNHYvQ0FwTytvY0VwbW5Nalc3WjNZa1FaVFFlUldySjJKY3JVN3Jn?=
 =?utf-8?B?ditPN2ZlTEtSOGJoOXNhWHpTWlVReGFidEZUd1htRDBLWFNpNzR0SUJXQUhn?=
 =?utf-8?B?NWJhdU5zMmN0cEkzYVZocmh3S1dMRllYNWtmdlV2VE9sR3htdzgyWGZZeHdt?=
 =?utf-8?B?Ukl6RVZ3QVEveVBlQ2xaU0NIdEYvTHYxSWhSemxIOGduN1k0VWxjN1VSeGtI?=
 =?utf-8?B?Q0J3ZFNiVWVOWVAwTkxNYlFtV0k5azJwVG9TNnI0cVkyd05vMllDaS9SVGZI?=
 =?utf-8?B?WDU3Zkh3NVdzZFZFNi85Z0NjbytGSmhjMlVYYjVXR00zNzhUTlFJcG1wcWVW?=
 =?utf-8?B?OFpmMXlxNnltSGhyamgya0M1YS9Mb20wbERHc2hhZTBHa0dDM0RLUGNZV0tI?=
 =?utf-8?B?MlVWbjRPTnBhUEpDaHVrYUFlMTUxYVFtMDVoQTlBZ1NKeFpEc002Y3B2T3lE?=
 =?utf-8?B?VFlLdzZJcnFNSTdFbVhFa1Qvdk9sQkhjQlh2WUxLVjlxRFdnTXlKbnNYeVFM?=
 =?utf-8?B?bzZPWXZoNGRVRlNrVFV4a2Z2WGd5SzBUaDRCb2lDTDVkb3EvOHA2QWgvaXkz?=
 =?utf-8?B?OEV0bXoyM0FUM2NiYUFOSXFTUXJPb2NINTlMc0VRQmF4NXRGNWZwc0FIVjFl?=
 =?utf-8?B?SzR4cTRSaVBGZTI0Q3ZaQjcrYUN0WGhoRmpRbFptZmxVUnN3c0lGaXZlT0JG?=
 =?utf-8?B?aGpHM0duQWdIQzRrdWlBUlJtMTdTWFdibFBnclNSK1djczJnV05KSHY0TUs3?=
 =?utf-8?B?dFdscDBsMUFFVEptY1dUZ3BLN1ZUU3AwZFhGbm5ERmVXQ2RkT0RlbmZUMmJH?=
 =?utf-8?B?TFhLOEFQUnNNL24xdW9CRVBhZDRuTFBDcnhzMzZVaHdQeVY2M0daQ1FObzVU?=
 =?utf-8?B?THp3ZUNQSVpOL2VWUWlEWHZydVcvSlEyWmdYZEc5bGVaSTZwbUllWDZIaG82?=
 =?utf-8?B?M3FHajhzemRrTTVrc3hiQW00dDFxazh6dkFjQWZUMmM4WjlqZ2c3bU5Ucm1x?=
 =?utf-8?B?cS9aSnVnMVVaUDdXWDI2azdLOVljVDd2SzFWRXBZeHhzNXBJQVJKZVJNakNG?=
 =?utf-8?B?TEl3OE1GSi9NUWJaZHNrRlUydXBqaUdNdUJickZTR1BzSS9oYnFnTFpGTzV1?=
 =?utf-8?B?dmFqRlcvMlBYbjNJVGJHL3B4Y2RMVFZvcStKNkcyZTA3a1hKWXF2MUxQVnRr?=
 =?utf-8?B?elRyVnZrYlozNU10VnVQVnY3c2RHc2lwRWh4QVZaZkxNaVJ1TTFyOGxMNXlz?=
 =?utf-8?B?WmVXL1dKVEpHckdiOFY3a3VndVllSnJvN29XT2RnaFJ1WWhSMVdPR0RVWm1L?=
 =?utf-8?B?d3VSU0dWK09Wb213VWRrRlJWeUh3VWZsakxyU2JHNW9XOFAwMVRCdUFwL0NI?=
 =?utf-8?Q?oQK6daapUrRve6MUqZYlOpAaM?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7120e5e-e34d-4e4b-c0d9-08db2ac48abf
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2023 10:59:43.3930
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wC5PTF5/AXwG+qEvyz7hMzfkB3hKnj5YSNPHDFiXiGH60UJvvstxDMDmBrIWhhMN73TCR3Zi4kH+YY+rucomPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7887

When !GRANT_TABLE and !PV_SHIM headers-n contains grant_table.h twice,
causing make to complain "target '...' given more than once in the same
rule" for the rule generating the stub headers. We don't need duplicate
entries in headers-n anywhere, so zap them (by using $(sort ...)) right
where the final value of the variable is constructed.

Fixes: 6bec713f871f ("include/compat: produce stubs for headers not otherwise generated")
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/include/Makefile
+++ b/xen/include/Makefile
@@ -34,7 +34,7 @@ headers-$(CONFIG_TRACEBUFFER) += compat/
 headers-$(CONFIG_XENOPROF) += compat/xenoprof.h
 headers-$(CONFIG_XSM_FLASK) += compat/xsm/flask_op.h
 
-headers-n := $(filter-out $(headers-y),$(headers-n) $(headers-))
+headers-n := $(sort $(filter-out $(headers-y),$(headers-n) $(headers-)))
 
 cppflags-y                := -include public/xen-compat.h -DXEN_GENERATING_COMPAT_HEADERS
 cppflags-$(CONFIG_X86)    += -m32

