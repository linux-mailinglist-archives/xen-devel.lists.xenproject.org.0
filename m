Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3392B6C79AE
	for <lists+xen-devel@lfdr.de>; Fri, 24 Mar 2023 09:26:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.514208.796249 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfck5-0005yM-UE; Fri, 24 Mar 2023 08:25:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 514208.796249; Fri, 24 Mar 2023 08:25:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfck5-0005vs-Qc; Fri, 24 Mar 2023 08:25:45 +0000
Received: by outflank-mailman (input) for mailman id 514208;
 Fri, 24 Mar 2023 08:25:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=n250=7Q=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pfck4-0005vm-82
 for xen-devel@lists.xenproject.org; Fri, 24 Mar 2023 08:25:44 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on0604.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::604])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 77383ee1-ca1d-11ed-b464-930f4c7d94ae;
 Fri, 24 Mar 2023 09:25:42 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM8PR04MB7971.eurprd04.prod.outlook.com (2603:10a6:20b:234::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.38; Fri, 24 Mar
 2023 08:25:40 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.038; Fri, 24 Mar 2023
 08:25:40 +0000
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
X-Inumbo-ID: 77383ee1-ca1d-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H6IU/PKqjqAXd2JgeloU0n/ljD1xJZbNQ3uNtscxMYAMSYFg8TqSDo/gtq5sugC3Etb4m5a4YnoAqQLaoMho4tapqrg7KAWel33HNUmkEUl74Ii/3rxOBYrBpscqn6YDpyakO/0XU66LdqD8AmgRmpqlmU7KZL4A9POB5l7Rg6aOmUDaYtJe3eOjNBUlcch3t0rwEVd/t/EloSh1dld+2rxTjIXeGRCwT1KAhSOjkk/v92wykWbgSewtVugiW2mKp+nas01lNnYcbjNaWv5Df20Qrkqg8RAoJtDPHccDPbLwNcV+3bhWArqKFtIJT7mmOK1y4pPKtRdMcCgFSJ3Mfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nxI6N4s9Zq2AYQ8Y2+2wCnwxcTzIXpVWhhBCyTAq4Kg=;
 b=XnjUUUXnelCkc5ZXd0uzFDtALBgivdS38BlU1EAGueh89GPWhnui24juzXFBRD0VyMSiHgroRj4gFoa5IEVN0WOZzHIvS0SRVfjvTunOIc51JhkJroV33lEdgyd4xuQ3lQUl+F9vROhcNLT/d1PqUSA08Vb4f36ZpzTMFFjfIuKfHsS8wfld4MPkuReX5zcn3Ycv7nYJgZ8Yylm15BdNEANyNY3lm17zXfbSSeRRXW1JPS4kb54ttdRu84hcpDSKB6SIXzrGpLjHR9Vh4hCa9WUtbECL2pXiEeQXIcl3zxwQyzdIbMc7oO+wmNENz1G1KHasdC4TTB/nenj6locWWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nxI6N4s9Zq2AYQ8Y2+2wCnwxcTzIXpVWhhBCyTAq4Kg=;
 b=T5M+GBM1Jv3RJ7guJ2xDk+HDqZXX+iF921/vdQJM0wAQhI6aiCFfau5FwgzK+11wIvfVHd1Q5L1Xazm7/rBYaRRyM5WPeYPWZ7yp46AICrBo6gcCUbx2zlDpNYtV/o1Jd6nM86rdj8VOJ2HMzyU+Ry2nK7XYOBzdT0ClNcgE8bqSaQU+GvrrooWW838VjiaQKqLGSFFX5YPCQ+Cw0L29kpMaMl2nzh1XcG3yx6rTbS3oOUKB8Jpg8/6POYFfvdkejrJZEHLGciUesKkqNNPlKvUVv8hMU9wuRieLcgzncsKDCqakOvZgco7suO2SsaZN4XMZkK3/0PQu70ahB3i2JA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <227ada95-1ff0-a894-c80c-8a9a1761fb10@suse.com>
Date: Fri, 24 Mar 2023 09:25:38 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v3] x86/boot: Factor move_xen() out of __start_xen()
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230323220117.2406981-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230323220117.2406981-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0184.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9f::16) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM8PR04MB7971:EE_
X-MS-Office365-Filtering-Correlation-Id: 5390ceec-7838-4e6d-f621-08db2c415a31
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ex9npROVBrV/Qizviz0Lfv4iZLNABT/QpMMo3O97iRDUrBtnm0aDhN8S5/INArKX/pUHnCvV/5CvFi1YOnHZJfyzKQ2HlX8YDp3eFirXon+BVp7mOBWfRkr/L8aUufse6+7KKX4d4rMaD4bNi0WzOL+wcTieu3oPJjF4WlrsPz5yH7O1p01NwpSxMp9En6vDhLJVQm1UI4eKXDlty4jgwMUTLaiUw7BL/lSU5LjQFEJN4AfRlrSn5WPQfiHF3ENDxxFgEO/tETWKllEYIsbe4exVnHojy5IZH2RoxclXUECQ95o9jVJrIc20kcOqbTAoephgg2Wm736uSHZ7zBn0pfoExlJETXGaecWd43lihOnTYFYZ3lj8s1n5tkZbLOkc2bi0okwWRXluRY146rDRk3R+EOIMpmcE+ImXDyzHwOljz9XzOBq7tR8iw1KOiHH9K6HoT1Sny/+Whl0KdWE9Kb2A1ccfyswoAUiYmZ1u8JEiNle0R/sx8+pCNfdtQDwmvOC4yKh1wi5q3Zcou4/FmU0ofgSsRyNvF4/hqG87qtzZ/hBYnKElCiGa9sVnbe6ILteiXJ1BSOwrxSxWPEb6G/N8CEDZTRJfvYn74bQoCXqr8trtmfajQOtQgLNfPru6YuVu2TF7BFD8uTSDt6gy8w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(136003)(39860400002)(396003)(366004)(346002)(376002)(451199018)(83380400001)(54906003)(316002)(478600001)(86362001)(31696002)(38100700002)(2616005)(26005)(186003)(6486002)(53546011)(4326008)(4744005)(2906002)(6916009)(66946007)(8676002)(66556008)(66476007)(6506007)(31686004)(6512007)(36756003)(41300700001)(8936002)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TlN6ei9Dclh6cXBLWUNjNEF1dFpsdDRFZEVEVEJpRVNiNmRONUlkNHNYWWJO?=
 =?utf-8?B?QU8xN0FRdjZhWE1DVHJsY0dZUnl3dE9aUEZhQTU0VXVud3p2NVZIMDJPZWVJ?=
 =?utf-8?B?T0t3OGsyazJBWUtld2h5M004YXlUd2JRRVBHZmhydnk5Tm1sd2NBRDd5RXVl?=
 =?utf-8?B?ZitTM2xod2IwQjBXTUI1Y1JQYU5qbGZOUzVHVGl1N0M0emJsNXJ5c2JnVEJp?=
 =?utf-8?B?Tlg2b1J3NEdsSklCQ2grdDhVM1BsRnFTcnR2My8zWjlxOFlIOTV0WS9NbVVC?=
 =?utf-8?B?Vk9JUW9WeUhyVU5ENUd3S214ZjZKRnFBdDF4Ykh4YWRLajFRTHVYMUtCanZn?=
 =?utf-8?B?dWo1OW8wc3F3Ym5zSjlBSVUxQ1FERi9qYnloZFBVYm1VeVBkV2M4Q1RyTzNH?=
 =?utf-8?B?ZUl6eTBsbGp1TVFkMWVtUUJHUFd2cCtPL2JSRXRLUS81ajVaYzlUSUluQWE0?=
 =?utf-8?B?eXhLQVR4L2xURjlqYWZXU2JiQlh3YkJ6UjJ1S1pDRlpTVFBOd2srK2ZqSlBO?=
 =?utf-8?B?QXJJcURSbldOQUt1MFdEVEZuQzVjUVc5WnVmZTJxelVRdlpsWm1pVXRkKy80?=
 =?utf-8?B?bGZJQjFRRXJib1ZrdElqRTBrditNWklkVVZGUys0YmsxTUxPT0N1cVNtd1Bm?=
 =?utf-8?B?aFRFcHBDUjA2RFljRjB2ekpNMkxmZllnbExnYXFhcDllTyt0TjFVVFpqZXdV?=
 =?utf-8?B?NUlZbGgvRDVEK2VtU3J0WnoxeENXdXF6L1NLYUp5b09KRFRDcjhkV1N3NjU1?=
 =?utf-8?B?WS9JQWF3Z01yVnZxSkFKNjVCdzZDRVJqYm9HSlhDeFE0NGUxUFFPbjZVZFRn?=
 =?utf-8?B?QmovSGxJMGVXTFI0TXpEaG1TVmwxZnFPVVBhVy9ycjJQQVE4V0tIRWJEKzFX?=
 =?utf-8?B?YzZHOUZmWE1yRkw2Tlc1MTYwUHQ3eitFcEg5K3FQSHRRMlNRRklnNkIyRVpr?=
 =?utf-8?B?bnR0TVhvT0MvVEdaQnR5V01BZXFPcXNaY1hZQjEzdTZ3WC90K2xLL012Nm9s?=
 =?utf-8?B?SklxWjRZcWxXTWxkNkpZeWNRT2NJUEh0WjhuNFptWk93S3Z2ZjBDSkZaN2lQ?=
 =?utf-8?B?c3R0dUEvQVQrWEp6Ui82Q1pHcUgvcjdIRXJmdDQrU2tydTM1cnJZNkV0VjVD?=
 =?utf-8?B?bG1VQVdFRldrdCtkb1lJdGM5ZGRqRTV3bldERCt6cGVnVGVwTzN0bnNheVhV?=
 =?utf-8?B?Mks0dU81NDZZeWhpM004eUVDVjAxbEdDWlNncG9CTGduR0hKOTk0bXJHYkJC?=
 =?utf-8?B?ZTl0WkRGUWhlVGRQd0p0NHRFbFY2ODlvSUdRa2diVjhXbVVjSkxTS3hoYjRj?=
 =?utf-8?B?cjBiL0tILzFGMi80Ulg5TVJQdUNKVXhBRW1GUWQ0c0k5bWxlbzlCWXkvNzBl?=
 =?utf-8?B?OThwRnYwaGpjM2ZyTkJCT0lxMldNOGFNVGF4TXluTEUxdWd2M29vZmxGbUlL?=
 =?utf-8?B?c1BFTk9WS2oyVFNxOERXbWFMcVEvejdPZGF4dnlLZEhMQVF6SWJPLy8rakZn?=
 =?utf-8?B?b3k1NTBiZGNGT3d6YUFOVGRFR3pWeDJEWERYK1Q0K3EvdzNqWlp4dElYRWFK?=
 =?utf-8?B?MXJ5ZkplVU9vSDN0aXhNN0hSWTZqTTM4Qnl3UXMydkZmKzVGQUFiSzMwbEtH?=
 =?utf-8?B?MENBcGYxMHV5ZURzVW8zZDhhbFkyZTBhMFFNaS9tZUdTREdZc3kxUEZ3dzRI?=
 =?utf-8?B?eEZQQktlY3JjZk96WXdkQzBKK0tXSG4yZnlEWENxUjlnaHlqYS91azhFSUdQ?=
 =?utf-8?B?UFVvaDRobjBBamQ3NEdJZlMxd0JNZC8zTnRqWEFmRWRPUFlTcW4wc1JlMUlD?=
 =?utf-8?B?b3NwZVFHQWtkalp5aUsvQkZKUVF4WERnMkNvOXZWZTd0a20zOHlySzBNeThN?=
 =?utf-8?B?M0hjbkdtT3pBSWZYU1FuSWYvMjdrWk1vSS8yYkNEZXlHdGxUWnRpazRlY28y?=
 =?utf-8?B?c3hUUVN2VURqdERMWjZzRmowcTJrVDhDU2RoZE9uNTBmVmxzVnBsM0FIejlr?=
 =?utf-8?B?SDIyb1ZaaXBIa3NIQTlNTklhMVJJMGxSTFpsdWNuQTJSN3dtamtOZkxwZks0?=
 =?utf-8?B?UkpMTmJoNUV2bTVsSlQ3ZnIvUzFubkFEQVZOWjBHcWtjYlBSZE9kc3BZb2N5?=
 =?utf-8?Q?/+UqpV/MnQtG9Fv6HAnvgyh74?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5390ceec-7838-4e6d-f621-08db2c415a31
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2023 08:25:40.2652
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ux6wSpBLVzu57xs175hbEq0uF3uMpL7vU4JV8gOIT4sM+TgGxjTfh4GCTBz/AzmwXdSnJBDqkSPxefhspSuqJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7971

On 23.03.2023 23:01, Andrew Cooper wrote:
> Partly for clarity because there is a lot of subtle magic at work here.
> Expand the commentary of what's going on.
> 
> Also because there is no need to double copy the stack (32kB).  Spilled
> content does need accounting for, but this be sorted by only copying only a
> handful of words.
> 
> No practical change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



