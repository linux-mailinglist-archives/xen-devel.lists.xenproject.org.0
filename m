Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6304D62B4B3
	for <lists+xen-devel@lfdr.de>; Wed, 16 Nov 2022 09:13:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.444207.699160 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovDXJ-0000eR-Gm; Wed, 16 Nov 2022 08:12:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 444207.699160; Wed, 16 Nov 2022 08:12:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovDXJ-0000bt-DK; Wed, 16 Nov 2022 08:12:45 +0000
Received: by outflank-mailman (input) for mailman id 444207;
 Wed, 16 Nov 2022 08:12:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1l6N=3Q=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ovDXI-0000aM-At
 for xen-devel@lists.xenproject.org; Wed, 16 Nov 2022 08:12:44 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02on061f.outbound.protection.outlook.com
 [2a01:111:f400:fe06::61f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 71db5e5f-6586-11ed-8fd2-01056ac49cbb;
 Wed, 16 Nov 2022 09:12:43 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8794.eurprd04.prod.outlook.com (2603:10a6:20b:409::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.15; Wed, 16 Nov
 2022 08:12:41 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5813.018; Wed, 16 Nov 2022
 08:12:41 +0000
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
X-Inumbo-ID: 71db5e5f-6586-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UnZjYBM8ffucMUfJKo1Y/vbGa0DQx13EkiaYKZ3WW8pueecVuIitkHVoNFA96oX+Uox7nLju/y3PFcY3h7Kac8TT7EE/s+6lzqd7/SzLsMfsJ3aot1WBCYBEILT8enQ9fPC/bxMzJIKUkh1R93SOxtErq2X/vXnWmQG+slYpxMffWqFWKk0+7ywlobwrXZphzVRkZ/BieLOGnfWF/z9Raepfu0Gmupwqpx9MbdMG+QVWRdBl1PqG2ZBOeiBmh2d2+M+ejTYM81SJEx77JnSwDylTbPwctg0U4eK5rWRpIZgMhW7L5TRbB0Vg5JfnBE3pDS7cks/FK4mwR7pelE11JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jqgolSxYtVGhdN06ntmkpJuIbIH+m4ZtlHmJSCb0w4A=;
 b=MJxnmKFgy+BildsrjbFOPixhSV7LP3hm43tpFm1TAV2MUPs/vTEA/P3zlUiwQuT+spT6lkumpfGX8nDY5oe5FpnpFS9+DJ2i4DoswyLnTVD2T9W9o7GHy4E/uZKkT+QhwXPQ1WAgivAOkd9fhonE5Z8qzmtXzmKkGxlMfVmVIxTAzE81NL9e/d+xySOfMQselGoHuQhUBEhGivFfqSdql96DvOn6V1PFTcdoCnrmudff25uy8QY/SwWpgaCtXS/IgaV0BMRQ3XddN1vL40w3LaHFRLyjqRcL8NVVyGE3jXc8dbOLRszs1vXo/C8sVpUpTsDOEXeaYwxGy8Rhcr/e4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jqgolSxYtVGhdN06ntmkpJuIbIH+m4ZtlHmJSCb0w4A=;
 b=ObB9qsWVINMgQ6r1ivqumkcscIzyFM/YJcDFfDcWWJNvOQ1GLtatj4LHIM1GNFs8NCFCJ6v+73NDp2o9uJrBx37kCLlf7DHMN+BuyI8mudRv3wJDbaByJ+wgOQOGbWIiAdxCx0qWaValEQ6eGo1djr3L1fkgjraRAhC6h1z9ydni8TXdBn3Z354rdw84K85RbNLJVKNGnk7N04kpmUn7QkulgZ7JTygJ+45G0RzZD1V5stzbCkzRhb5lGiiv9u2OLTcO56U42T9UBo4hKj9XFXqOQEqM8ZoN0adRkgCvv7JRmBEvZZ/R72CW1LxQXYkhyujhsTFXuUbyNrUEAVWI7w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c0b2f394-c5f9-d69d-fc98-c6bf47676e70@suse.com>
Date: Wed, 16 Nov 2022 09:12:39 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [XEN PATCH for-4.17 v2 2/6] xen: Used SPDX identifier in some
 public headers
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Henry Wang <Henry.Wang@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20221103115204.49610-1-anthony.perard@citrix.com>
 <20221103115204.49610-3-anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20221103115204.49610-3-anthony.perard@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0499.eurprd06.prod.outlook.com
 (2603:10a6:20b:49b::23) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB8794:EE_
X-MS-Office365-Filtering-Correlation-Id: f605043c-5642-40c3-4bde-08dac7aa553f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	b1erEgLcZtDUazontavK14rtfUc/w5cDwN2/gaPeoPNswDtAYPuMcQhyssr3DZNfnu5oBf5UbufFLRgIR6w5woETtX/kWmQhwUyc5+wh+ZkNTMaRzYXPhdRq3ficrkxN+ZotWoFUt0FhN8QJGq0yfpT1YLNZTpvI+gSntOPkehy4nfCV9C2GU1aFpeXefSybGr9RQcpiDH2SZ1WDgFZ9HqemVuwM7vJFbdzhruBXUEeOxh/htYAU1eJg4BLFkFC6d1vJx3x8sO8lJ88etkGie3WpoURcVYdur6OI62I44mUyC14mSBFZSjHLdazbO8H37Cwh1w4mct0ZoCaEhkZAV9YZkIm5ef7Nnr5+2ya/iu5LCh+ZcYx1BdkQfdZCAHEA9oFtw+Ohf7mBIc+Lcg6PsIeLu0QSdLhCirzoErmeSXguZMBBX+L3o2NvKo1t8ZDIzvmOiZkGlLOG5yOIAgBnsO2/tnmntdcmAZ++i08Wvoxs7cUjucEAhD3Q2GWKENLZl4IfPVjnVTTc77RPG15JOh3N+KRNWA5rvsGjA867yn9doJLuG+GQZ+gSMco5JFu0UxjzwsGrwG8MVOxc+eOvdHCaBUOkq0JIbhU616jCZyc/qqV/CUIXbYzCkJ6jaiL6PfFxHPcEW9l3mhrM4n32sESBY2bO/+bn/5nvCUIwQohb+KOHGpOcvzfWfAjRtGSnGeX+1UZH6Wma4vQzXKa36QLwhRc+X5r1y545lPUz/ylqYI1ad4qnqgu2RghvTp8FeXs/j0GINYFt+H2KBV35wxTeS/oz4d1jNAq4kcY5SC1ivVJYCpg4IA0OPRjOlQwS
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(39860400002)(366004)(396003)(136003)(376002)(451199015)(38100700002)(31686004)(36756003)(86362001)(31696002)(8936002)(7416002)(5660300002)(4744005)(2906002)(186003)(2616005)(54906003)(316002)(6916009)(41300700001)(4326008)(8676002)(26005)(478600001)(66556008)(66946007)(6506007)(6512007)(66476007)(53546011)(966005)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RTI5R0g5WXE3bFZMMWF6YzI4eUtoSGFhOE4vSE45QmE3cXNPMXB4bk9INVlV?=
 =?utf-8?B?a29iZDg2SmhQY2xPcVJtWmMzSFlOMEdWL250UUZtN0laLzNkTkRvUTVPNWg1?=
 =?utf-8?B?VXZkMWh0amJEY2E5d0JCNEFHZ0YyWVY1RzUwSEhET2pjcm1BbGZjKzBFTUg0?=
 =?utf-8?B?Z3pMbWZ0ZU91R00yaFYyWS9SWnJSOVRGM3FiY2hRRmFiWHpZR1JBM1dhR0dB?=
 =?utf-8?B?Nno5WlVrVktFL2dVSEZDak82eVVINng2dGFoTkI5NVdzb21CeDB4azlIYTZj?=
 =?utf-8?B?VFdIKzA3WC9YZVFhajVFbXFYMzhpOEpoRFRuKzV6OWVMYzhUTmw5aWJBRUxB?=
 =?utf-8?B?em9XS0wyT2pYV0tmUkcvbmlNL2Q3TzhWRE9kbFoxcVRxWU9yQklITWlVREpF?=
 =?utf-8?B?dGN3MGU1UHhvQTlSSGpHQTJad1o3UFBPM0FqWUpNSVBSbk1mdHZKSFRyTko3?=
 =?utf-8?B?YldWMFA1bDFxTXN2bklOQVJHZTdvY0xoTEtSbCswZEI1U0ptQ3ZnNHI1Z1My?=
 =?utf-8?B?YllzbDhZR2lheVhQUXBYZ1JVNCtlMHNTVFdNYjg0SG1LK0Y1cmdxa3UvWlpr?=
 =?utf-8?B?TndYejBmYnJiRXdOMi90K3JCbmUrVno0VVV1WG1ScFI4UHZidDVZV25iVmRU?=
 =?utf-8?B?cWNSNlQ2NXQ1M25md1hkNlBWUmdQWUZoZE16R3kzOTBhYUlDQ2N2Z2hoZzVn?=
 =?utf-8?B?MFhNcDM0enZGV2NYRnBvMXlHTUcvZzFHUDFud2l0R3YwckFKOWxFWnJwa1lQ?=
 =?utf-8?B?bXozNmg4dnkxQW5pR3ZxcDBqWUJwRWZleUxhUVQ3R1crRnM5U3RQS3J6MkRv?=
 =?utf-8?B?L2U3QmpkendSQXJIYXRwaWIvQlkySE44VXJhS2t0T0VEMGI3QnQvakN4V3dP?=
 =?utf-8?B?OXd2dWVCS1V0UStkRDl5cHZzeW5GN0xWNG4wazVqa3Y0eWpOT3Juc3o4S0J6?=
 =?utf-8?B?d054cEhWUnk0b0pVL3lhblY1ajRaYVVXcmhOdFNpS29DVEZ4SGcxZzU0dzFM?=
 =?utf-8?B?dkp2c1BLYkcxbjNVdVN4dnM3UHY1bC95Q2JzbHFXdXpCVUROcHpDeTk5VHFC?=
 =?utf-8?B?Q3FVSk5zYm9OSjkxalRqM2tqd01sRitwUXNRaWJGTWxBVGliZk5hcVR1Ukc1?=
 =?utf-8?B?Qm15eUwydEJFUVJ3b1JKOVUydVUrUDVQYmQyOVJaTTFXbEVFKzh1UXhFNU01?=
 =?utf-8?B?QVcrTWViMktSSXJPci9aVEhXQXNxN2lFbW9mSzF1bzMvNUJnNmNQMHNGMzB2?=
 =?utf-8?B?ekNJR1RKbDN2ZFZ4ajZDbm00L0Y1ZHZMVSt1RG93YXhCM2hUZEFHKzNBSmpP?=
 =?utf-8?B?d2dHWDUyQmlzbENiSWUzS3A0eGlXZDhEa2RLelM0RVNMU1FlWkREMTVScGMv?=
 =?utf-8?B?RFBpSnVKYlQ2d1d1RHdTd0FPRDRKeWRLYzdheGxMNS9ONkFwbTJ4U3F3L0Jt?=
 =?utf-8?B?LzZ1RHpLSFJSdWVrL3dFdEp4RkNyT2JDUENsQVJPcmVoVDZmY05JdFJOOXBn?=
 =?utf-8?B?cllOTDBhMWkxV0FRV0V5MHRCc0FnOHVDelhTT21ST0UwNnJGOTdFck1aVGdD?=
 =?utf-8?B?UVFtTHdkY0NUK0FOVlI0MkJsSytGNG93cVd3dElRUkV4SGpJWHdHdlR3WURY?=
 =?utf-8?B?Uy9LZ09QN1ZKUmQ5TTRJamdrc2paeENTcWVEalFjL0lWc2tmV1lWdjBLTTlk?=
 =?utf-8?B?K0JnelVvQlh1bWlTSnl4bTUxcUJ0YW5ROStvT1A0VDVJWE5pOE1peEkrNitU?=
 =?utf-8?B?dkhYUWQxdExhYWV4VGxmSzY3VSswUUhSK2dUeHo2NHoxd3dnMjFvL0traFNP?=
 =?utf-8?B?RlJKY2lZellKekptNHJqZG4zZ3A1ZFk3TDI0Y0dERlVlS0d0ZnVLSFpyVlFJ?=
 =?utf-8?B?YnBxNW5BVTdkS1g3T1VCRkEwb0JCWFQ0QWJTSll4cXVEVzlzbi9UNEVzWXY2?=
 =?utf-8?B?ajNOUDVkN3l0OUV3SUJlbkI2WWFsbFdOVWFoWHlreCswUzI3dXpMZDQrcW9a?=
 =?utf-8?B?eGk0Rys4WHJ6WUxBTkp1b2ZKUlRJV1BOTUdNblJiTEd2NHV3S0ROQ2xlTkFZ?=
 =?utf-8?B?Q0dscVBicVBpRmVoWDFEbmhWWDRkdEgzTDluMGJZcVlmQTFjK24yWWNvWklz?=
 =?utf-8?Q?BZDTeewTuLBHCiKMGMhUk0+L4?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f605043c-5642-40c3-4bde-08dac7aa553f
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2022 08:12:41.8363
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vsJ5vzkxPUyte9h0giwmgCMnIlCVkQWFgltDOQEPJ+KvuMINDef1awmxcLt17TmsEyIJDg+8yUW+rigG+w21ZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8794

On 03.11.2022 12:52, Anthony PERARD wrote:
> The script "tools/include/xen-foreign/mkheader.py" is going to do a
> sanity check on the licences of those headers. To ease this, we will
> replace the verbatim copy of the MIT licence by its SPDX identifier
> equivalent.
> 
> The text of the licence has been check to be the same as the one at
> https://spdx.org/licenses/MIT.html, except we don't have "(including
> the next paragraph)". The text is also the same as the one in
> "xen/include/public/COPYING".
> 
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



