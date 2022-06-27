Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB82855B843
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jun 2022 09:38:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.356290.584424 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o5jJw-0008CP-1S; Mon, 27 Jun 2022 07:38:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 356290.584424; Mon, 27 Jun 2022 07:38:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o5jJv-00089a-U7; Mon, 27 Jun 2022 07:38:07 +0000
Received: by outflank-mailman (input) for mailman id 356290;
 Mon, 27 Jun 2022 07:38:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yQHX=XC=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o5jJt-00089U-Qo
 for xen-devel@lists.xenproject.org; Mon, 27 Jun 2022 07:38:06 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr00068.outbound.protection.outlook.com [40.107.0.68])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1430e5fa-f5ec-11ec-bd2d-47488cf2e6aa;
 Mon, 27 Jun 2022 09:38:04 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR04MB3200.eurprd04.prod.outlook.com (2603:10a6:802:d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.18; Mon, 27 Jun
 2022 07:38:02 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5373.018; Mon, 27 Jun 2022
 07:38:02 +0000
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
X-Inumbo-ID: 1430e5fa-f5ec-11ec-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j0SZqU2QbQ/1bAy8fCRJI+Vcpe2VnOwb0LGdLsjem2DE7lYgCr3lAU1YFgJj69pE7C4tjEtJ6l2mAW+7NquqeixLMYTZ/rhaYXkhGHNlWJhcsy5+Bs5RfUdIjoMS7OaWhs+hOvOCOKK4oVs0NUqyyJIWujmjerE/mjQv2/ZIxDdV76oDydhOoRIvk5jk5CAor5TXA/OGIbZWhFQ4Hq3uMBWmO7ll06yAx2bLNyb+7uYFsHokMmfgs8MRoE4j0nT89ZHY0C3iOe5nVJ1VR9E7K67GfOn7YFBTlczldkfCFZ+PTyymf76ipaGyaZ8hlGsxmkQELFVQ/5veSEQKZRFukA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8R2xoE4z7WlDdFZ7FALH/2LOEwGBJ+De5YfxWiGdGDw=;
 b=TQQX6nNaZXL9+/6+4lDqB1DuC7kBn2xaO03W14xLH0bHYyCiTdJQWPchQKHPboYrp0IxF992i/wr53BUnr5WcYfg6IK4bpEUWdiv+QNdPdJdUoOLrIV32XSC2Gioeb5W4LHKkJdJmG0YGMHpYAXDgNhB2UVwk0wIyY7Hy9jUBxAoxofOVNIiWLlq0FkgxG49RpXPKIL/jhmLSs1c2ccsVYGwLqoJpU5XtCbmR+ICgyCe6ULTOF/JVKGR8rUryh9A4ekmZ6CDBgxq63EBy2GmGVrIAa9YoARmdlK8N+X+BtLZy3gluNnoQ+USvcplQQaC7JojMA1mkS9B640x07bP9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8R2xoE4z7WlDdFZ7FALH/2LOEwGBJ+De5YfxWiGdGDw=;
 b=Tbyet/Tvnc95xwlSKAwIIY2uSB4fxuoZRkRvps5U57iAJMaJ0N+cftBdPObyt5xO6QRVIqQmetxTxNVjzYT7WGsP5x86siJBcF3KTDjBHekuI9xLk+MDCpzvNWQwEFyhG1k0aZzX21ljt3+OE5ADWvnJ90KGxTeDEoay8w2BNtqrjPcUwlOJx52PCp/aPc49UT4bcTvkzkRQ87PqWu3LSqPq1bbWXfI528PFuG/mcGHf0EoBXqPaxGDpN5+SqK5rKc2tw5IwDgpwn9xAtaYMc2nMAb8mt9YKP9mfFwcKcY3kSlxD2VOaJ3xAHnJ06GfovB8VE2ug7BNLmLd65MDlSA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d9c96d44-ca77-3f96-7da6-301c88695126@suse.com>
Date: Mon, 27 Jun 2022 09:38:02 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [linux-linus test] 171361: regressions - FAIL
Content-Language: en-US
To: xen-devel@lists.xenproject.org
References: <osstest-171361-mainreport@xen.org>
Cc: osstest service owner <osstest-admin@xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <osstest-171361-mainreport@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR04CA0042.eurprd04.prod.outlook.com
 (2603:10a6:20b:46a::14) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bd6a47be-54dc-4e33-dc54-08da580ff70e
X-MS-TrafficTypeDiagnostic: VI1PR04MB3200:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	PiTBk+v/Wg6Ge0hiGOMWBbB4IAoGKwr+ezj1q1EFnqCPZgg6iSL6Woa4d3NG89vWPT6SB6+6WyVehK5ZYoK5iQlPlgGJfQmKphIzwtKEmqd//zgsAcwr6KjWcBKxzuZ9AjVJ6zvvcDQM6J9vjO3rzFd+1ncPvIJteP6o6jUONIBUuIzufHXXjl5Qv+A9bFCAcdl2P8PSk2sBxsUdD4c3AX7PdOwnMxgpRKaCTohILb84a6ALmwvphJ4117/CLDv81sjdwIVhQ7sG4XtJ3SlhiIo8YhZRxg6pv28ld2P/YiIsojwlPDUwo78UjDzTeAEBEqvUGLWbDY/pxo/uJBqxxQxxuRn+g0QWHflU5+/3voGxRD3tEyWKaVvFNQvI+FJ35pJNpO4eJeiAa5GilLTSKaVx53TDNdq4gZPV0P4+3loZb6H4vedxvVMALMLSNx7XUD7Gixahyuo8V5hFLsCw+lLu6b8dUNi4WdSHQnG656GTwiZpD0wsMgX6vksy7AAamnoCJasgtngh4Mn26T3691IgiDBlrAO5LanozKhxDZISzCTnvzgKUGS5s9KJzTTRgEbX8rAHAwM3toHHBXt/wXC2n8nakRvGC6zWKAqcILzozqUqxMOBkcaQuKtscc6SE8qhRlhoQk1y74aKSWxfO/YNsY9St/28n2RnCYKWFqk15m2ssJMP8xqecb6GKMxT9tOQ+Zo4NLXrWslyGNVomE58PMzeNY1rcXhc0HeGvw/IlroS5oAwgu6GzVLI/G2fvcjJpH53b9zNqQ4UIuXcF6QxmoOI4QMrsItxBtNpWpgA34ey63VZSPRMC434MDVfprw7H2WcLh9UlAHkpPKU2RChBk6NxqKtHNcBgh0pySY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39850400004)(376002)(136003)(346002)(366004)(396003)(31686004)(36756003)(6506007)(2616005)(316002)(2906002)(186003)(8676002)(4326008)(83380400001)(478600001)(6916009)(6486002)(66946007)(66556008)(41300700001)(66476007)(38100700002)(31696002)(8936002)(6512007)(26005)(5660300002)(966005)(53546011)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZmlMS200ZHBIVzhxZ1orMW0yMVdublgwdUpaclZmQmJhS0JRQXZ5bC9nc3Vo?=
 =?utf-8?B?MzJ2RlRTazYzZmV4U3J5ZzZibXltVUJhTGErY1FiRVk5L0F2WGdoMTBUV1E4?=
 =?utf-8?B?SDlqQzFJb1N1SFlMa0VyRzFLQm5WcDFtblZFeFdtSVNhcDVNdUl3Z3VUdm9L?=
 =?utf-8?B?VVBaRXBQM2tQN3MvTWg5bGpEeHB3SjhmNERJbHc2L2xGeEVHdWxtMkgxTGFX?=
 =?utf-8?B?SUd4NWdRZzk2dmc0TjBaQU13NURFNUZvaG5zZUhWY2FZU0xSaXl6NjEvWlV3?=
 =?utf-8?B?eElaMUpZTGJDU1pzSkh3cVJGK3pmaUhnTFZBdGEwZDNGdHkvOU9sSjRZUTUz?=
 =?utf-8?B?L0ZWcHYydzNkR1VRME9VcEdWcm1lb0ZWWEpnQTQ3aWNoTjdPR1hPdUNFaGdY?=
 =?utf-8?B?UEdCNEZLVzkrQUMwVkJ3eVdvTVMvbStKMlV1bTBjdFBZTmJ5dGhqMDZRUnk1?=
 =?utf-8?B?bGsxUGc4T0xueHBYeTJJMFIydWRYWGdRRE9PY2RWQVYxWTgxakJuZXYyQmxZ?=
 =?utf-8?B?K3J0VldxWks1VXRSN2hRcDVNdXlVMUF6bkJjMjRWMi9pVGt3cWNrazdwOThB?=
 =?utf-8?B?L0RVWERsa2Zjd2VZMnJnejBwZWY3bWR0ektnTitvbHFic1N3N3JHN1VWalk2?=
 =?utf-8?B?NXZKZ1c0Q0dNc0UrN1lWRFBKZ25wdnJEWnJzMjAvMTRJcDkzMUVkVm92UGJD?=
 =?utf-8?B?eTlDSE9oMXBIbU5BemJGdmh5RlFvQ1VqZ04rS01LRFU3MjJqODhvZ21kRGdT?=
 =?utf-8?B?bnk3aTVnanRveCtaWDVsNVlDYzk4SlcydEdSMkpMQk4yMHNzdTdhTFl5ZWE1?=
 =?utf-8?B?aHNNSUdmU05hQ05LU2ZxWXpKZ2g1ZDZYRmdEakhqc1Y1b1hTWmhIS3RMakRQ?=
 =?utf-8?B?QldrbzZxY09tR29nbHlYdDJ6M2lMaVUvZDFZVUxhcS9nWHN3cklxRWRDSk5B?=
 =?utf-8?B?VTZzSGFhUXhWS3pFMVBJNWMyeTRHS0lWT2RQb25iTDRERFZTT2ErYzIzL0Va?=
 =?utf-8?B?MEdxNitGWjJtdWVZeWVCZTl2WTlDRFdFd1hGcjdXYzBmUG5GdDgvYTd5cWJi?=
 =?utf-8?B?UWVLR2p2aS95Y1Z1WGxwdmlrVU4xUm5jcGQvK2pld3hFMHJSU2VmRC9kd25w?=
 =?utf-8?B?VS8wUFQ1Vm9odTV1SW85dlhyTkFUeUQyQzBGZTVlelpVNlFGMTlGYXRaczAv?=
 =?utf-8?B?NTMzYjNwNGV0VTBZMXpVQlFySUVrbnVjOFNnUDYvN05XR3FCT2Zta2czbTdP?=
 =?utf-8?B?bzZDNE04dTJBdmV2NERWYlM4RXpuRWhIYnVPaUVFODBMYWFFR3NockVmMkdl?=
 =?utf-8?B?anY2KzZGVkZoUVdGZ0xYQVFBQ0g1dWFoVWdjS25WZ2FEbE1mS1U5Q0tsR2tG?=
 =?utf-8?B?QVFQUFlkempJVzZzdk55WGpNWFFSNWEzcEdiandqWEJTT25vL3RremFuYjZT?=
 =?utf-8?B?R29tYVovdVlaOXhEWnJCQW9kemRxNUVTYlpSMHN6NEN4cUtmRDVYMUtxaXgr?=
 =?utf-8?B?U2RoZy9YSTUxTW5IMnBsWEg1amxqUVBReXByNzhwU0tOM25rT1RTazZBRTRz?=
 =?utf-8?B?Sk5YVkQxTFRhSDEyUEF4MGxMRjhtcllkcW5vcGFkQUFIR0lQSWtxL2tENjJR?=
 =?utf-8?B?RXUydTB6TDlTV283aFFDM1JRelV2ZkdwVTYwYXNsOVhieU5hVVM3MUNBb1pu?=
 =?utf-8?B?QnEzMVYxOEhjQVBEZ1BLODUrTUkvenhzWVdKcnRnbUlpa3FISjJpQmI5clZq?=
 =?utf-8?B?RDMyTFhNYjYyQVpsSUx0dXdCektGNExqL2ZDZkppU3R0RXNIblZtRExPOTFJ?=
 =?utf-8?B?Zm5pLzB4VUR2c05TWW5NVmZ3THQyWmp3L0FWcXdhT1UwT0xxZnZyVUljVndF?=
 =?utf-8?B?Z2JEUXd5d1BQKzc4eTh1QnZQY2dndy9PaFVXYi9RVHdBT2JLaDM1alFMczRj?=
 =?utf-8?B?Rk80dlpUaGwrQTByT05Ld25ITG1Kam12QndsYS81ZTVGWHF3Y2YzaDdSWTNQ?=
 =?utf-8?B?ZURFa1VTa3RsRVIyMXJPVUFFd1FKclVIc3dZMHRyZ0tzbEhUdzAwOFZ6bnVD?=
 =?utf-8?B?ZnVBbGd2RmpIK3NWdHFadTU2bFZtWUJuMmNta2FhTXR0NEZnZUdnaEFWQklP?=
 =?utf-8?Q?SzveHiuYdliWKLEESPuBVYz8/?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd6a47be-54dc-4e33-dc54-08da580ff70e
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2022 07:38:02.0608
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WgyI9cTOHeAfaimVAvdGWkelbL0keT3e4YFOhBOPh1idEFUy5ZUsI6lFSLUpDEGcVlLLnB/0Fl06wQ8LP0uNNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3200

On 27.06.2022 03:38, osstest service owner wrote:
> flight 171361 linux-linus real [real]
> http://logs.test-lab.xenproject.org/osstest/logs/171361/
> 
> Regressions :-(
> 
> Tests which did not succeed and are blocking,
> including tests which could not be run:
>  test-amd64-amd64-dom0pvh-xl-intel  8 xen-boot            fail REGR. vs. 171277
>  test-amd64-amd64-xl-qemuu-ws16-amd64  8 xen-boot         fail REGR. vs. 171277
>  test-amd64-amd64-xl-qemut-win7-amd64  8 xen-boot         fail REGR. vs. 171277
>  test-amd64-amd64-pygrub       8 xen-boot                 fail REGR. vs. 171277
>  test-amd64-amd64-freebsd11-amd64  8 xen-boot             fail REGR. vs. 171277
>  test-amd64-amd64-dom0pvh-xl-amd  8 xen-boot              fail REGR. vs. 171277
>  test-amd64-amd64-qemuu-nested-amd  8 xen-boot            fail REGR. vs. 171277
>  test-amd64-amd64-xl-qemuu-win7-amd64  8 xen-boot         fail REGR. vs. 171277
>  test-amd64-amd64-xl-qemut-ws16-amd64  8 xen-boot         fail REGR. vs. 171277
>  test-amd64-amd64-xl-qemut-debianhvm-i386-xsm  8 xen-boot fail REGR. vs. 171277
>  test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm  8 xen-boot fail REGR. vs. 171277
>  test-amd64-amd64-xl-qemuu-ovmf-amd64  8 xen-boot         fail REGR. vs. 171277
>  test-amd64-amd64-xl-xsm       8 xen-boot                 fail REGR. vs. 171277
>  test-amd64-amd64-xl           8 xen-boot                 fail REGR. vs. 171277

At the example of this:

Jun 26 21:51:47.667404 mapping kernel into physical memory
Jun 26 21:51:47.667425 about to get started...
Jun 26 21:51:47.667435 (XEN) arch/x86/mm.c:2159:d0v0 Bad L1 flags 400000
Jun 26 21:51:47.667448 (XEN) Hardware Dom0 halted: halting machine

This is an attempt to install (modify?) a PTE with _PAGE_GNTTAB set
via normal page table management hypercalls. Considering how early in
the boot process this appears to be, I wonder whether a flag was
introduced in the kernel which aliases _PAGE_GNTTAB (or a use of such
a pre-existing flag on a path which previously was safe from being hit
when running in PV mode under Xen).

I wonder if the bisector is already having a go at isolating the
offending commit, or whether it had already failed in trying to.

Jan

