Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84E9171FDEF
	for <lists+xen-devel@lfdr.de>; Fri,  2 Jun 2023 11:32:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.543043.847621 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q518a-0007LM-3b; Fri, 02 Jun 2023 09:32:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 543043.847621; Fri, 02 Jun 2023 09:32:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q518a-0007It-03; Fri, 02 Jun 2023 09:32:00 +0000
Received: by outflank-mailman (input) for mailman id 543043;
 Fri, 02 Jun 2023 09:31:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NqWc=BW=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q518Y-0007In-H1
 for xen-devel@lists.xenproject.org; Fri, 02 Jun 2023 09:31:58 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2060f.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::60f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 50eac7a7-0128-11ee-b232-6b7b168915f2;
 Fri, 02 Jun 2023 11:31:56 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU2PR04MB9180.eurprd04.prod.outlook.com (2603:10a6:10:2f7::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.23; Fri, 2 Jun
 2023 09:31:54 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6433.024; Fri, 2 Jun 2023
 09:31:54 +0000
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
X-Inumbo-ID: 50eac7a7-0128-11ee-b232-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hGpGQPhMrZ7IYoPorscP4fLo8ORxD9ORT0VzHo+Op71vapvGESO2MELrMBCEm18stQ149q6xm6fvQdXPwmjeL/D1cLvA1llJeP8wMZfoPdPJe7gxdDx+kOqArELlBMissZoWmAsBkClJvlj5NiIZlLcx9QzwqG/JQk95Q3JNZjih8y9bwtgl2wHIlhVqmE+po+CVHUx4pwSdlMxR6hLA+yG+Nm3B/P/0yfDIH7sb3vJlmOc6TkgYKOJtTypsZJtA/Mgp9fYJTOqydFzSWGKWmlmRJatS6jLn0EMBHsvhfcvZJ4k5HYomxWmZ7Qss1MAdeQVpwpbtStcx/GhXIeXplg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vmNHSfInRAhrtVgDotdb8NNw9x0eFd8MmApJ0PCFmyk=;
 b=LgGNtsf98sXwWGir3ztn/9AXXMUEicIjMh0Xm+dO2bOJbV1J3EdjqAMyrhUcHr65VjmbQ+Vx9xCjnT9QkwirzDgy9oRdmjVaaP1G8glZG1lm6TpS99gyCc/irISU/qpkUaunZTKN+1T6BX6OyExOAFyipA6kHb+pK1p/H3lJfRe4pENXOl2Dh5taIai+5Fs0u26epLjDc4IYWEiLRWSEJVrW4DrZlGggXxT7s2YpbJpUkTS0CpMAuSRahlSHGpr3KPV2fHKVBOVEVdHFvm6K2dsMiKmL7S3vGa0WzVMaEu2DmX7s4xqYbpOESiNfQGIIufO7lt9aJ6xwFwmOxSBBZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vmNHSfInRAhrtVgDotdb8NNw9x0eFd8MmApJ0PCFmyk=;
 b=JmYB/T/iEfAbm9Y+YXuBaMIam5XWq0OgQPTvm9vxVS/e/SyccAHv8ad23DHu8pqhCRpT4T4rbUpsBImvaWbXa1PTTp2UkztBKUzopEfGus6FMgNqhRyJu3WbobcwkzLiH9ySx9cthSqwP0ZUAC5d/LvBJKDMw+LoojaIE7sV4NupNmF58kik2INfk1jBPl2LeVKzs7BfIlbtYtfelKk6FuZHqX53S3+mjfIX/m8wN2hyd0i4JjQllsdwcJmPiC5PphOUo/a4JdgQqEAaHx0XdMSvtn5vDxifkEpGrZOHblUj5hSRl2pa6KDpJfYQj1vgYCxhh/2YCYG04NVvFV8H2A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <952d725e-558f-b31b-c25b-f56004581f80@suse.com>
Date: Fri, 2 Jun 2023 11:31:52 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [XEN][PATCH v7 15/19] xen/arm: Implement device tree node removal
 functionalities
Content-Language: en-US
To: Vikram Garhwal <vikram.garhwal@amd.com>
Cc: michal.orzel@amd.com, sstabellini@kernel.org,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20230602004824.20731-1-vikram.garhwal@amd.com>
 <20230602004824.20731-16-vikram.garhwal@amd.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230602004824.20731-16-vikram.garhwal@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0222.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ac::18) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DU2PR04MB9180:EE_
X-MS-Office365-Filtering-Correlation-Id: e5b91ae6-bacc-457f-7e60-08db634c33d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4/3C6PH+VPoYBNDAFmFmXLskIXpW8UW7Qk0vu9YWq1Qid/6I5zg+rQ8j0G6ZriZLTaIpnASsbKsb7TwAi1VeMQKa4nFBYboS8AEia+9rMxTTJ30N4TZLWnJeJUqQasd/Qvse5O4uF04RPxJ4xMga7tGUSkmwimSIh6R4WIoVYy+SrvpSsI63ZWe1npKFeIPQ9I6OAwtkeTZM0+eYnPqpbTEYlWFx//cwtqZbqH7XC+aeoim9eUE0HxuK7zDImiTd0J3iEOv3yqQPrigfheFCnbD37l1GJQlNXw0amAgXSM+qX0yoX0DuyKpmQ/lwRMQ2hSmDMPItCqRcVii5SbcMWOA3pHvoxMJzp5+/s6Excpy0JjjZA0WV25qKBupqavQ52C25J4Ci0VyAke43rsneQmfShQeE9ErLaoQzVZRkEs8frRC1EEetpkdcS8b/DGUBq3Yt/0ViXNP6rIRKPJs0q06U5P4JiD34kUOPoSlIeLYNHP8wzDykLbijEzmiXQ58XXgAByPoSDFGSLT95Gcen8o2vZtF45iAau1/bAhUl+k4nBK0cr4lDcqByL9MkF7HflHC4xgFD+vOF32Gfs5oSD5iHwFgjJeMdvB78HElfVW0LoC5ilRMQIT7e1ApFQmG3zE9nhKLicao6Vn7tvky2Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(39860400002)(376002)(136003)(346002)(366004)(451199021)(36756003)(38100700002)(86362001)(31696002)(31686004)(41300700001)(8676002)(8936002)(2906002)(53546011)(6506007)(5660300002)(6512007)(26005)(7416002)(4744005)(186003)(2616005)(83380400001)(66476007)(6486002)(478600001)(66556008)(66946007)(54906003)(316002)(4326008)(6916009)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WjZpbVl1dE9ZSE1CRzhscXNnSEJET3VZM09CNE1EVm5Mb21xRjJZRUJBSG5w?=
 =?utf-8?B?dEZydGFBU2Y3RnZ5R0xGMWxVdFRnc2I0VGZFU1ZpNm9aeGNqMk9MZUduMnpP?=
 =?utf-8?B?TXJ5ejV3QmJrL29IMllkYVZ1WkpsSkZ3amJ0UGVXQUFJa1V0VURBVDNOaGJN?=
 =?utf-8?B?SzRWdituaWhKc1dvb1VIWVhxZHBJYk15MGlQVCtMaE5ldzVSaVNRcG1WdDZs?=
 =?utf-8?B?T3pWK0xaNzdvalVYYVNwUFhJb3QrUi9oNTdVZ1JiWEcxSDRoMStjQ0xteGRl?=
 =?utf-8?B?MEkvdnh1Vy9rRmlQT09pdXlDMVFDOXY2Vkw3cHVxRGxEME1NNGl4WUl4bkVx?=
 =?utf-8?B?dnV5QzlQL09MTmZWWGVjMGJTK3RqMUdWNTMzQ1FrelZGbHpoZmNHck5vN1NS?=
 =?utf-8?B?VHpZZ1dzZUxpc2x1U1U0YitCU3o0MTlFUE8vZFNSZDVBenBrM1JTajY0bVNv?=
 =?utf-8?B?WG5MZWU0Sm0yVUtzTTVDZVBzNkVMT3A4aGk4aXNaVGF6dGxpQmZjOW1TTEFk?=
 =?utf-8?B?aUhHdGY4aWlubXljbzF3Z2dqZElXNkFXTmJETzcra09ReWxTaE1QWXFiTjh6?=
 =?utf-8?B?MUdOSC9uS0tUOW84VnZLWlBvVC92WnQ3dSttNXFhOFg1RE9PajVJaHY2WHdz?=
 =?utf-8?B?eUJYbzFFSlg5MHBxaHMvQWtyU1NLbWhaL01UN0pZcVJ3eVZRdXllYkZkdzFo?=
 =?utf-8?B?ZEVqcXJvNkhaQks2NGFwTGZOQk9NU0ZtSlIwblduT1BTZFJrMEhqV3NwSUxS?=
 =?utf-8?B?dVh4NWQ5eDJYMms0TnJiQW1sa040Mi93TEZzVk90eGwxM3NXZGUyWkZmRldj?=
 =?utf-8?B?U01saXhKTUsxbWlFc2ZzeXJxVmltTVBUdG1zNkk4YysrT3psMkk5TDBYN25U?=
 =?utf-8?B?T3JWTzNFTEp4SnltQjhCempWMUpLTFJFenk4bFA1NTh3UXIxY0t4VXZIRjQv?=
 =?utf-8?B?bDdXT1FCYjNLRk1QcGwxcm5yL3pjYWE2ZE83b29LTzBwQzBsb3c5aGIrVHNT?=
 =?utf-8?B?WWhRekNHQ3dxVnJ6TTcvK085YUI2a2toZFpBOU41RmFTVWtoUnJCblRNMzEv?=
 =?utf-8?B?MWtDZUc3U2VSWWM5QjU5cWFGMUZJUmE2MUpETmNlc1RpVk5Fdkc1ZDZkWm5o?=
 =?utf-8?B?US9Ed214QlcwWENOcVlSNGZYa25yTUhvQ1V5blNiQXZpaW9aRmZPU0szNVVS?=
 =?utf-8?B?YzRxbmpHRmtWcTZKRUp4U0tSc2NNYzNCdWRQczEwRHg3NUxpSUdHZnNrUnFh?=
 =?utf-8?B?NHdCTC9ueWM5UGF6QUdQMG9FbmRHUUhmVWpaR3hZK3BESVZCazNGT0w4RHJT?=
 =?utf-8?B?ZDVYbWhaWDgwYXhyd2E1ZHV3SWtqOEdMTE03aEw3YlNHeFBXdmhMb1Fwbm5G?=
 =?utf-8?B?eVgzdmw3cjc5ZFo2ZGhBSGNLTmNvR0wwbkEwMW9ZRWUwNlRJZ3hzT3djMmRD?=
 =?utf-8?B?blkvenlBaDFhaFptaFFuMWRsT0w1dmg4ZW05UGI2ZU9kQ05DMnhCMXJSRDZj?=
 =?utf-8?B?R1hSaFRST0ZaYWdTNCtaeDE1LzhXTVZpODZJalFvTHZGTTgxYVRVblc2RE1H?=
 =?utf-8?B?VHRUdy9yUmhPLzF5bk5XOUU2MVcveVVzOUhaeDR4aFAvZDNURmFicVJDY1Vl?=
 =?utf-8?B?WUpJTkU3VC9seWpWdzF5OFNDa2JDQ3dlSWpJMHBnRUtCSHBFMXdnem1oVjQr?=
 =?utf-8?B?cmRXVUd3OWtjMXFnQUhWZDhuQnROWWpRM2lYZHJTTkNXd3JzbmFWV0xva2VK?=
 =?utf-8?B?LzY0V2tadFNrWWpIeG5IM0h2K3EzSnZvM0R4VVhiUVJVWjAxRFhnR2Jjd25V?=
 =?utf-8?B?ZnJZZVJjMWJSZWgxSG1oODlzb0ZlZGx0RE9yWkZlSGdaTlRLM2dHUytza2Vw?=
 =?utf-8?B?aE5tZzdRQTZZLyt2Qm9uQktscE82T0N4eFhSUzdSRVhnSE90dlpsYnRQSzJQ?=
 =?utf-8?B?ZEtxWU1zeld6SEh6U0s1Y3M3eFhKZVUzNGZYdkVnbDFVbVdKc0NCU3Y4dTFa?=
 =?utf-8?B?V3lIMGVIZ0I4QS90RUU1N2ZmQXhiVTg3aU1oeDc3UU9nbVY5cHVtZ3Bva2R6?=
 =?utf-8?B?SU1EMjZGbjFFTkhya2pXYkdxZ3RtTGhQd3Qrd1k1OVUvL3Y0MnZlRXg4Y2xZ?=
 =?utf-8?Q?ZXQ734Nwx8165pBa3a9LRpbX1?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5b91ae6-bacc-457f-7e60-08db634c33d4
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2023 09:31:54.3110
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FSWcwUlx8yRDdX33mDM1ucDe0uVNQYcz/5VZrXi8ANheTBtFuEttauMRPN+kZ56HOeXHYPQbku+fXd1XG/8foA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9180

On 02.06.2023 02:48, Vikram Garhwal wrote:
> --- a/xen/include/public/sysctl.h
> +++ b/xen/include/public/sysctl.h
> @@ -1057,6 +1057,25 @@ typedef struct xen_sysctl_cpu_policy xen_sysctl_cpu_policy_t;
>  DEFINE_XEN_GUEST_HANDLE(xen_sysctl_cpu_policy_t);
>  #endif
>  
> +#if defined(__arm__) || defined (__aarch64__)
> +/*
> + * XEN_SYSCTL_dt_overlay
> + * Performs addition/removal of device tree nodes under parent node using dtbo.
> + * This does in three steps:
> + *  - Adds/Removes the nodes from dt_host.
> + *  - Adds/Removes IRQ permission for the nodes.
> + *  - Adds/Removes MMIO accesses.
> + */
> +struct xen_sysctl_dt_overlay {
> +    XEN_GUEST_HANDLE_64(void) overlay_fdt;  /* IN: overlay fdt. */

If the comment is correct, then const_void please.

Jan

