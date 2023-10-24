Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB5C37D541E
	for <lists+xen-devel@lfdr.de>; Tue, 24 Oct 2023 16:32:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.622052.969191 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvIST-0000p6-71; Tue, 24 Oct 2023 14:32:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 622052.969191; Tue, 24 Oct 2023 14:32:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvIST-0000n2-2q; Tue, 24 Oct 2023 14:32:37 +0000
Received: by outflank-mailman (input) for mailman id 622052;
 Tue, 24 Oct 2023 14:32:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=krZT=GG=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qvISR-0006O8-JF
 for xen-devel@lists.xenproject.org; Tue, 24 Oct 2023 14:32:35 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20617.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::617])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2b7c157f-727a-11ee-9b0e-b553b5be7939;
 Tue, 24 Oct 2023 16:32:34 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DUZPR04MB9917.eurprd04.prod.outlook.com (2603:10a6:10:4d8::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.35; Tue, 24 Oct
 2023 14:32:32 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25%3]) with mapi id 15.20.6933.011; Tue, 24 Oct 2023
 14:32:32 +0000
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
X-Inumbo-ID: 2b7c157f-727a-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WDmLBvha/0zPSt3FiAYYEzTH3Vshnjkc01Y6LG9FVg29neYf2lqgYC2EyNqYBFN2OkI22vytJl9o3g5rOFxPjteoyPhOZY5rR4gYkMlmsKtbmIyV31eiRMIewVnj+9pgjMEJwdRA805vzmjH8N3iMyZNHLxCv9KhaZFea2/ZjMO0erSy7ELNxOeLJD+Vr+i0k5vpi/NsS0XbzMAwSJYyEImybis8MkbefCTKP8Z7dt1J7/UOwIJ7gwKFpQvK+6OUAJicLgRnLH68qX7NoTo8U4/+NSKkd0HgklR5RDEShP725LS0+ZvX7bxIqdLZXFcGuDQZf8MOmjFkr2LeCq5VSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a4xgN67JX1LpSLOq1u/CDoxkvGoPVuHYeQs/ulLj/8I=;
 b=Xl4f0tCA/oDIGYCdEgu0GuX/Hw68vRhXiwHWHzYBTXVOAYtojofZbieO/qR+8v/y+YvvLsYajnE/QBPtZwFwqG8edo8ruXJtcGGtJVwzG+6W1JoeZojozSjeRiLIBKi+pvsRMDiEP11pqbKmhmWE/tWHw1+D84uUYDWXqebcM/U2Aq4NGR8vlsAqAodB11z8Emr1DUQYP96Nog5leImkY1kXpxmBl3oFUfO6EtWDs/VFme3R2TStfpEBTsj8sUCcfTvoXtUHDgZ63wAVhXjND5I16w5d77RV5jkEe6jc9M3WrGdbde2AnhKyGfTGTWTrssNVP4slj47ZC+NS3txUTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a4xgN67JX1LpSLOq1u/CDoxkvGoPVuHYeQs/ulLj/8I=;
 b=MsR+aYfeFHYBhsbb3Rr4Xi/SwnKtj3XhuigEeqJYAoPUqCnPYVP9qB5vIbD/AQJAnxVJpPJVfx3+COR4dWV8i1QwVqS9Pmmyb4lwPyIKDi90QeiEIM5Qdx72AxROVwppEonQAe2l81EZ/V/RkTn04dmsXApSrm1sdAThX79DUoJ9opecDrIXpT1ZNdoj8JKP1zf2VhakLmh1V3i1uy73xs5qWANLr8dXLgtAJ0PV29pcEj3NlARY3kwh/bHmicn9vGK0HZicyM9ctjtbutRoyXIloMRljdtN4f5B7SVrbqZwgGZn9A25akkG1LcXIXiInBEOUWfqXz16S7MKZxOC6A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <4019825c-3307-8e0d-63f2-22d651a7ca32@suse.com>
Date: Tue, 24 Oct 2023 16:32:29 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [XEN RFC] xen/automation: add deviations for MISRA C:2012 Rule
 8.3
Content-Language: en-US
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: consulting@bugseng.com, Simone Ballarin <simone.ballarin@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <565552f9e7cfff56fb1d1037cfa9662a1818c5d3.1698153310.git.federico.serafini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <565552f9e7cfff56fb1d1037cfa9662a1818c5d3.1698153310.git.federico.serafini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0185.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ca::18) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DUZPR04MB9917:EE_
X-MS-Office365-Filtering-Correlation-Id: dc3fe725-a2d8-4402-79ba-08dbd49e0eb2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	YyirfkJkZU5uj1dfFbztJ3jKVd3jr2YiSwh0HtH4ERgO2Di+qaNDMUD+KPni9BVfUBEwgVmZ+LvHcY8ux9k0lp09+3AakCc2bVFUcTypSlsVHwTDQItNndRiXBrQo0SaIwBWCvzNh26e854bc/tYLKVr0CPHn/00OkIh7J3Qxd609+auh92X9TFoVLV8m7mfWPy/4zcMq0x3bDYeUkvMVP/ecDOx/89o/dnY38Ghf7mdZ4LvjG+vAJNzrNRsPN1YHgk6BDzvRngBWKuhezeNsHr9xnj91fVqR+VcT1ud/cEPidctHtNjJyemCJ5NoBMdZGB7mn2IyuuuyZ5KGlcHQBDvTYrnq9AJLrsE1315JO9hw00d5bGFN7xKQ94fs4qD6Ya4ti3JCo+okhnrQ3svodRTVhNeBUndvmjtPYNQBVRwpq/mnvhxmOAs0CqgdSU70U7A8h5p8o1xaeXQLFEibn5PTGhNv73ILqDLH5FVWt6a6JoewLxobRkKlKOfnXttO5Vrdeq9IOk7czq15ItpMsTZltX7vgq3VTSwQhbL3pMcR2FhVjZDgnNndrHTvov91LpMYCe5qkK4aMfVNSQ/m1ryL04yBpXjxlnziz3uzyZqYvgERH2avobi9iaofBFne+TH1FaOOe3D4gWslwuASA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(396003)(376002)(346002)(366004)(136003)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(316002)(6486002)(66946007)(8676002)(6916009)(66556008)(41300700001)(66476007)(54906003)(478600001)(7416002)(8936002)(31686004)(5660300002)(4326008)(2906002)(53546011)(83380400001)(6506007)(86362001)(31696002)(38100700002)(6512007)(26005)(36756003)(6666004)(2616005)(4744005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VlFldkkycEg3dXZCblpnOUp0aGZnSmlwMlYwOXptd2lMTS9Xc041V0tUWldm?=
 =?utf-8?B?dXFFUW5LTDlkMXNQZmo1eGlkWnY2NXdYbzZMempSaGZZRXcwWWVhZjFFS0dO?=
 =?utf-8?B?NG9KWVdyNTM4ZU1HaVhzUjJjOE9hcFoyL2d3NjJxYVU3UnpXdmNLMlQ0NW5a?=
 =?utf-8?B?MDZOcDIyU3J2czhIN1VqbGJ0citwYWswZittRzZxaDNPYTBwK1ptcHlhWTdE?=
 =?utf-8?B?NmU4TkpWcU5XK3ZuNnA1MXJtQlFwMWtoVHZ0VG9mRm5yT0p1L3R3NXQyMDlh?=
 =?utf-8?B?VHZ4Nmp2SUZTd3ZKM0R6b1JvSDFrbUtRZ3hUbEdnS1NNR0NvUE8reVphbjdu?=
 =?utf-8?B?QVpyNisrQU9qOE5PZmNrZHdtcXFxejJ3QjdGWGpDWU1keHdtbmhOb2xUR2VY?=
 =?utf-8?B?WXlZZnFQWUJKWGtCUHhxU3dNSGYxNzdRc0FlQTVDMkVGcUQrNFRlSHlLOFBh?=
 =?utf-8?B?c1BEOEVCNHBLR3ZnUWZOM3hEQmJnOFNNeGdBTENibzM0L0FYYll5R2U1eDR0?=
 =?utf-8?B?bjJKSkt1QTcyVnBqYm0xVDFLbkFtM3JMdlc5WE1NbkJmblNXb1RIaTdWR2Nk?=
 =?utf-8?B?SDRtVVJoUzdxWDZQVFJkWXVEM1N0U29yL01OMk41Nnh1M1BDM2xjdS9RZmZH?=
 =?utf-8?B?Y1ZtZU1lMHZMczRTUVIwRjl0TlJBL0JkTzI5TUUrVXFGOTAxSlNQZ0tmaDZm?=
 =?utf-8?B?NXZ0MnF1MURLeVludi80bTE2L29CWWRtR3VnNXV4Y3J5NVQrbnZPWnMwbldL?=
 =?utf-8?B?MG9QeGoxSVZLbHJKUU5BbGNsbFhXc0F5cytUMXB1RVZFUkQ2R0lQZVFmUGFq?=
 =?utf-8?B?dFZ2NVlYVVhrNjBwaEtYeGljcmgyclpDRnowMm0vMDRpVUg4QzBDYTdwVXhN?=
 =?utf-8?B?REVUU2twbUw0b3g4bFB2TFB1eHlaclJtMkJpKzU1ZG5uSFBmdFcxOU9oK1VT?=
 =?utf-8?B?L3FNcDFJUnJIMG5qaGhKRE5aOHZiNFhGUzNDeUxlZnF6WklERHNTUU1oSVI2?=
 =?utf-8?B?V3FoT3JBSFV1d0w0c0x3elJpQkFDa2J5a1E5YWNVSytocVhMamU3YS90V0Vr?=
 =?utf-8?B?aHo0aGgyNkcxQUhKbU1BcHVUdjdKRkMvWW1KeWZyajVkWTc1elZ6dUNWR3da?=
 =?utf-8?B?dUZ5QnpVOXFjQzhPbTRwaC9naENET016SmJSeTRoYUNQcWpQelVMMGRKZHJu?=
 =?utf-8?B?L0VFcTZ0Vm5ZRG9VZmhKbUN1ZHh6M054QkdRK1o3MmR3aDlSWkxKdmpLdDls?=
 =?utf-8?B?NzFLMG5ucVZ4aXZ6eW9WbWQ1elVUTnpFdE5uMFRnMW1BMTh1cU11WkVBbURR?=
 =?utf-8?B?SXRmd2hTM1NvMkFhR1c0aWtlSjVHTU5mM3VFdXlmUDlncmpMRHA5QnU4Ti9Q?=
 =?utf-8?B?Z2xmd0drNW9jaHVVYzNjOHlLUUJQKzdIeWlPL1dHT3ZJbmdGUEg5dDNSMHFW?=
 =?utf-8?B?WVhHYWthTUVxL1A1Vm0zSGxURU1PK215eGJDU1JEMnFla2ViVVR3azR2UEhH?=
 =?utf-8?B?UEgzc3U5dVFOT3BnNHM1akF3cmsrVGtxV0YzV2Z1K01JbUdCQVM4NFhZbjNV?=
 =?utf-8?B?SDFkOUFmMERQcFMvZnJYYll1VVBMWEtLZkwvSWN2eTBYdkQxV0cyNDlTcjlh?=
 =?utf-8?B?ZXIvOUxhSjdoQmtzaU9LOWh6MDlLL0pEYkR0cmR0Q0FBQ3FHcGNyc29IY2xW?=
 =?utf-8?B?RENjTDhIb3JCYnd6S3pjT0lqbXZBVXVEcXVyZ0w3dW1MMjQzTTV6c2hvc2RJ?=
 =?utf-8?B?NjVtS05ScVhUYWdzZzdhcUZxZERGbHlLa0JHemhxdzBvbHZKRTF3cTF4SG1v?=
 =?utf-8?B?QzNzNUdZNXIzRko0UmMzb0xpa0JzV2xia1JOMjZ6UE5abnpQWjRNZ0NHTWRm?=
 =?utf-8?B?c2dBRm5hKzBVZE01cWlHUzE2NkNRWEpmV1Z5TWFYYlR6c2tFQkd6WldwVVkv?=
 =?utf-8?B?STZtSDgyOUdnQWF1V3MwQWhxSDJ2S3c4VDlyS2ZmcVRLODluQktTQ0RySjh1?=
 =?utf-8?B?NzRVTkdQVG0xTndNazM2eDEyblRmMDNpZFQzd3llYWFWenhmZkl2eUdjMXRS?=
 =?utf-8?B?NTZYL1diS2w2OU0xdXNjYjBiYWkxV1JXOXI4L2kwWVJJaHRUNERLR1FZVWYx?=
 =?utf-8?Q?aos3BUiWpdCBiS1cloZeHqU9x?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc3fe725-a2d8-4402-79ba-08dbd49e0eb2
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2023 14:32:32.0597
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GpuUYSfhm51n3Z9dYstFUz3iPWf+oGhzdiaKBD2OCfLBxMAb7G0bgaNXaYDgykG4qlQHfGWyYPllGpJeOhvxUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9917

On 24.10.2023 15:22, Federico Serafini wrote:
> Update ECLAIR configuration to deviate Rule 8.3 ("All declarations of
> an object or function shall use the same names and type qualifiers")
> for the following functions:
> - set_px_pminfo();
> - guest_walk_tables_[0-9]+_levels().
> 
> Update file docs/misra/deviations.rst accordingly.
> No functional change.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
> ---
> I had a discussion with Jan about the reasons behind the choice of parameter
> name 'walk' for the definitions of functions guest_walk_tables_[0-9]+_levels()
> and the parameter name 'pfec' for the corresponding declarations.
> Also for the function set_px_pminfo(), it seems that the parameter names are
> different on purpose.

In this latter case I wonder why you think so. Did I end up making a
misleading comment anywhere? It looks to me as if naming the parameter
in question "perf" uniformly would be quite okay.

Jan

