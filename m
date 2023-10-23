Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F34777D3831
	for <lists+xen-devel@lfdr.de>; Mon, 23 Oct 2023 15:35:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.621465.967919 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1quv55-0008Ec-VJ; Mon, 23 Oct 2023 13:34:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 621465.967919; Mon, 23 Oct 2023 13:34:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1quv55-0008Cn-SE; Mon, 23 Oct 2023 13:34:55 +0000
Received: by outflank-mailman (input) for mailman id 621465;
 Mon, 23 Oct 2023 13:34:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OVTz=GF=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1quv54-0008Cf-8K
 for xen-devel@lists.xenproject.org; Mon, 23 Oct 2023 13:34:54 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on0624.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::624])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f1c1b644-71a8-11ee-9b0e-b553b5be7939;
 Mon, 23 Oct 2023 15:34:52 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAXPR04MB8542.eurprd04.prod.outlook.com (2603:10a6:102:215::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.11; Mon, 23 Oct
 2023 13:34:49 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25%3]) with mapi id 15.20.6933.011; Mon, 23 Oct 2023
 13:34:49 +0000
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
X-Inumbo-ID: f1c1b644-71a8-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BetW6GXQaQI+hlNDorO/JYYyoM25eqogEG96FCn0lNkRw1QOvy9b7tOgSx1g9VeG6b5x+LG0sN0GSUnDd3FstY+zieucvNxB+p4LJfW1G1hEC5V/pQQzL97M1XUvPpXxC6cYUd/+FkwymjyIjYxCcI+ZjOBRwxk6/4cmuf0+MMgYLLP8p2IHFsX02tKWaNRw91t7ulyekKFtdfGM/zxd4sizbBxdnRK+v1JF8wsS59QRhUMKCfNvybnqALJ15UTxZ8lr1WtiAxtHyoukXfsv7839B2eUXhjWsSsgt7g+BuvzanSW0yGhG2zLWfNB9VO0afqqx/dr4IVwvqmPoo6y9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fMLjx89QHNR1E+jgaLS4qyOoGIaRXeLbh2j3ZcXFmDs=;
 b=HToIVGsZxgmGzubPPJTitr8vwA2sm1AqV8GnQlEd790VqVlSNy/t9CEGgcsVX3cJhC3HKQKTTInswyhVxLX10OKOvKCy8F3YkE6mEsaXyOO9infmOGEh1C/coHwDK0Sjj6TUVI7lFeD7lTDBo7cVgbTm28hqWLpOdy557SEaca8m/kCL707UkFdAKDuHz3Ooy/WWWrCNu7Xl4VCvxiuJULdoDojEzTYjU3Sl/NgH1fw+8FxSd31I96DPLvMyqhZtUof8ovfFO+mEKVcpfza9taeZuXE2dYvYed1jGQvAC6PdlCPICcDn8jCRUsK1J3n413pFcw2ZsxcZh2a7QZH/Bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fMLjx89QHNR1E+jgaLS4qyOoGIaRXeLbh2j3ZcXFmDs=;
 b=rAmCcK5AQNA+rvMsQlyFcvy2Raz9PQMVCvlAdd8oGo+ktCnRNt5Qdvqescf61V/sy2syldXTZkrBHVoj3FD2uoGvUWn42Q1Rkw1V44vzRiWqltZ0Kel2pIRlfdjXdUicE7PEVqe6N0g1kRNIVdmHIxOao14xLfyNNZDbthKcY/zT4YDZef9nqBOcDJ7mtNyvGkZLwzkHGiZyrmmbGeSrYC+ejOo3yK9kCODOzSU8IJNNa2t8jNt5ItzmAIRVKY6WkFxgYSE2kgyRWQNJJWNJz1fhI1nFYB/Bn+KKgxJnf/CxYN5t3TiNvXkac9YFyBlFdmSu8itGh15LA3yrnMlV2Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <89778285-5cba-8fb5-70bc-710b6dd30a10@suse.com>
Date: Mon, 23 Oct 2023 15:34:46 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [XEN PATCH 3/4] xen/include: add pure and const attributes
Content-Language: en-US
To: Simone Ballarin <simone.ballarin@bugseng.com>
Cc: consulting@bugseng.com, sstabellini@kernel.org,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1697638210.git.simone.ballarin@bugseng.com>
 <fd5421162a00aa782e0776324ff6497193c1e3d3.1697638210.git.simone.ballarin@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <fd5421162a00aa782e0776324ff6497193c1e3d3.1697638210.git.simone.ballarin@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0122.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:94::6) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAXPR04MB8542:EE_
X-MS-Office365-Filtering-Correlation-Id: af92e36a-8d4e-4b19-4aaa-08dbd3ccd3f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	vgko2TRiCG8I1zwnmSHsdiusQ+AxWMWE0N3ktADDniOiGErbDvCpXzbW+9dVRLP+T6Z90jn3hU7Ipi3r2q/LaZ7paymGNCdd1ENLryc1dU5OITQjEJFrBvI6yf4SiWGsXJzLYEpmQlz7CnNL4kFS6PRc5W2a3ogvUC+PGejUDye4g4a5lLmUEWFcd+ajeFr/yR4072bFiIQH0J0mSbD/nK/evPB7LOY9U71Gw++pSLay0y2S/zx4vJejPaerHjMDD0OIbZTdDVP8ZVEUYnhRrxwPpZG6kWgPd6HtfJ5ZfwkbTOEoVDq6HGq5PXPSntMvXpRnlT9qHLE+/NZvHGJ6DjuwYec4emXUs5TKwPznh1x1ELR1BYh8ivf0P/gDYtBo4buTChWoD0DJ4rcAK5VdobCXqOpx9sg1p57xC+kPJSQAg/dDdO4L8jfJTlnvNDkTzEX2nVSx0jEMJwpmyE571GntwSdzAV2XLyqkT2wuevJFpijODg7z/WxQtgMHVlq86H+yOYqahHQCEQYkoH6uqiQ0BajF/uxp3GLdhxAzwyWgD4WikGe67q+T/DulQgW6bwPCIIOQGkRYPjowVfmcVkIbKr5eLEvgcT/4wlrnGhXFB5yOUTukzizMom7lvtrjeanvrFJswNDcYtt/Q2UQgQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(39860400002)(346002)(366004)(376002)(136003)(230922051799003)(64100799003)(1800799009)(186009)(451199024)(36756003)(53546011)(2616005)(26005)(31696002)(38100700002)(6506007)(6512007)(6666004)(316002)(6916009)(86362001)(66476007)(66946007)(54906003)(66556008)(6486002)(478600001)(31686004)(41300700001)(4326008)(8676002)(8936002)(2906002)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VVVKZjAvTDVQVjdUNWtVUzlLSm9sMWN1ZStyWGJ4dlhoeXY0d3F1YndEa0h5?=
 =?utf-8?B?VlR2L0I5VjFjNi8zT2hvTTlobFpJbWt5eW1raVU4TmxtQTlOSE5sanJESHJa?=
 =?utf-8?B?MmJMUW9nTWc4TkVUQWlxMHMwU1BObnJlZ2M2eFNyWG45V3QvQmhEV21DS0xV?=
 =?utf-8?B?Qm8wckxTNWNKQ2p2WXN1QWtvZUZZdHUyM3hvWks5MEN1aUtlY1UvSHI5Ny81?=
 =?utf-8?B?dWhkTzhDcTlxcDlGUi8vRlBmMUNmNURXSFdSL2FtNmJtanA4QVlWUUl1aUdM?=
 =?utf-8?B?OGRqa1VuZTV5MjAxZkNYYzJISjBxalpscG12SmlZVFNUZXM0SjNMVXVub3J6?=
 =?utf-8?B?dVl2dkJIMzA5RnJDYURNQ2dya1AvbDN1V0NhY1RROUJNOHNvb3MrRmdqc2U1?=
 =?utf-8?B?c2IwNlVER09tZkMvanBibitsbkI3MVBlOEUrK3pjVTg5Q1BiQ0N3RWVIeDZG?=
 =?utf-8?B?RFl2d3BGWURWUGV6OFlHcEJiVElXZzZoUC9POVI3cmM1Nm8vMXpiUmlPRGNz?=
 =?utf-8?B?NEdCd0UzdWU5S2daR1RtRktvdnVFWFNEWVl4bjUvTVhxbkQrRUQ1TFdkcUV2?=
 =?utf-8?B?WXYvRUEvWDFFMjY5VTc4OXg1MkxHanJISlNLeWExQnB6ZFdidDJwN2hoTHh2?=
 =?utf-8?B?SXc0Yi9PQkdySnp6T0s0Sks1UnVkMVRQenBuOXpVUlFTTTBtQzZoY1BFRzlm?=
 =?utf-8?B?eDZVaFJ0djcveXFoWkhVdnM2Qm5FV2V3ZU1FTVVQbkRQdTVXNzBBVi8zWjJ2?=
 =?utf-8?B?eXFxaTlwZDZ5S0EvUEZWY0RRaEtYTHVMN0Z6cDRPM1RmV0l2N2wrejlMYWNU?=
 =?utf-8?B?MjdPLzVQazREZUhqQnczRzNiaC9ic3FYN29sYkFjeHE2OVlNY3Z4bUNTWHhi?=
 =?utf-8?B?TUFKMlNiY0M3T1crS1FRSE5IdjJON0NKczcvZjNueG1DaXB6ZDAyaU0wdGVp?=
 =?utf-8?B?SW14RHBXMXdVa3NtcTAza0ZPQWVPbFhQamtMS1lmVmFLdmZ0aW92cno5WjJL?=
 =?utf-8?B?UEtma01YcC81ZGNydnEzWlJobElGMlVGcE9JSC9SMXVlU2o5TFNQcU9PcDZX?=
 =?utf-8?B?N2JxUVBtaThZQkxVek9UREI5bTVBVmF2bSs2M1A2ckZmQ3ZpSTYvMUEwdXNn?=
 =?utf-8?B?aUh1M2ZpMmF3cDg4enhCUWhVVHB3MmZCaG9mNFM1dWJCekdzdTNBRkJnOEEv?=
 =?utf-8?B?clFOeE5TWHpGaFo2NWZKTHU0ZVUvU3dValo1NGZYSmRORExCUDVtTlNLQmRL?=
 =?utf-8?B?SzhjeWdYUjAzcjVyTFZMd2JuYkhGa2MyaDJLTzBFZVVMeDJnYWhQbnVuZGp5?=
 =?utf-8?B?YmIvdWZqR2JOY3BuOXRZQjlYa0E2ZUVGTldTTk4vNWJPeFRKM1N3dGlZcDhk?=
 =?utf-8?B?YmVOaUUrdkg2RkZiNnQ5b01OcEdhMzRhSkF6RUVpYmJ0Yk9iZ3JyT0Z6N0tV?=
 =?utf-8?B?dVFHTGIxTVhCVUxKbHRmY2ttZDArbm12QzJMZXd6VzJoWGE3ZmFzMEh6R0gv?=
 =?utf-8?B?VmY3MVdoa2RjZ0NlQnc2VlRhN0VoelUxUG52UTFYTUhvTTA0cXZNYkNhejVL?=
 =?utf-8?B?N0VyQzZBQ2NqZnBpTklYZ1N1Q21OdTVQZHZ6WWJ3akZnTjhLSHFYdUlLcmdG?=
 =?utf-8?B?UzZud2Z3SVZXSTBEazJvSm91ZXFaMnZ1bWptNkZwc20vc1NRV2JGRU5WOTB2?=
 =?utf-8?B?U3JEOFBRZUQ5a3NwT1hFN05oaTdwSFY3Rzg1bXJMenc5THBEZXFhOFBscEZQ?=
 =?utf-8?B?NGU4ek5ETGdPdXpmYURBeHovV3ZDYVU5cC82M2ZoQUFxamYwSnBjOVBReXZS?=
 =?utf-8?B?VmZCaDhlcHZ1Z21TMExueXlqVS85WHcrbUNaT3NFYWFQejNkV2k3KzRWME5w?=
 =?utf-8?B?Ulh2TGVONmtjaGxyazI3elFRUS8rQWlaMnRPQUhXbGhTWW80R0xYK0F3ZG92?=
 =?utf-8?B?N2dONFVRcXVCMjc2NG5MYkI0WUZtdXFXTUZNSUdEeFBPWUNxQ0FiZzdMa3NT?=
 =?utf-8?B?ekowRUlJR21XOVJDU0JHb0pSbjNNREhkU3N0SUN3WmxtemJNcGo1anM0bzJW?=
 =?utf-8?B?cXF5a00rVmVTTDl1bHh0U2g3MHh4WHVpczhYb24wM29xcmQ4QTdJeEhXamNo?=
 =?utf-8?Q?v+cih22ejEedqRR29jTUZN0dM?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af92e36a-8d4e-4b19-4aaa-08dbd3ccd3f6
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2023 13:34:49.2978
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VRzs0Ov+fMMbG05R2B7aERLbDEDmCGI8qt8T3Rz0S/h98T17e604j+M1u4wGQdELGvNkmszo3NCdSaaVH4ouzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8542

On 18.10.2023 16:18, Simone Ballarin wrote:
> Add const and pure attributes to address reports
> of MISRA C:2012 Rule 13.1: Initializer lists shall
> not contain persistent side effects
> 
> Add pure attribute to function pdx_to_pfn.
> Add const attribute to functions generated by TYPE_SAFE.
> 
> These functions are used in initializer lists: adding
> the attributes ensures that no effect will be performed
> by them.

Adding the attribute does, according to my understanding, ensure nothing.
The compiler may (but isn't required to) diagnose wrong uses of the
attributes, but it may also make use of the attributes (on the
declaration) without regard to the attribute potentially being wrongly
applied. Since further for inline functions the compiler commonly infers
attributes from the expanded code (discarding the attribute), the only
thing achieved here is a documentation aspect, I think.

> --- a/xen/include/xen/pdx.h
> +++ b/xen/include/xen/pdx.h
> @@ -164,7 +164,7 @@ static inline unsigned long pfn_to_pdx(unsigned long pfn)
>   * @param pdx Page index
>   * @return Obtained pfn after decompressing the pdx
>   */
> -static inline unsigned long pdx_to_pfn(unsigned long pdx)
> +static inline __attribute_pure__ unsigned long pdx_to_pfn(unsigned long pdx)
>  {
>      return (pdx & pfn_pdx_bottom_mask) |
>             ((pdx << pfn_pdx_hole_shift) & pfn_top_mask);

Taking this as an example for what I've said above: The compiler can't
know that the globals used by the functions won't change value. Even
within Xen it is only by convention that these variables are assigned
their values during boot, and then aren't changed anymore. Which makes
me wonder: Did you check carefully that around the time the variables
have their values established, no calls to the functions exist (which
might then be subject to folding)?

Additionally - what about the sibling function pfn_to_pdx()?

Jan

