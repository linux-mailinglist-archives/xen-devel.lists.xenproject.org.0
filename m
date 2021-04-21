Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1248B366B63
	for <lists+xen-devel@lfdr.de>; Wed, 21 Apr 2021 14:57:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.114482.218189 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZCPq-0007vW-Gs; Wed, 21 Apr 2021 12:57:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 114482.218189; Wed, 21 Apr 2021 12:57:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZCPq-0007v7-DU; Wed, 21 Apr 2021 12:57:14 +0000
Received: by outflank-mailman (input) for mailman id 114482;
 Wed, 21 Apr 2021 12:57:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wOap=JS=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lZCPp-0007v2-24
 for xen-devel@lists.xenproject.org; Wed, 21 Apr 2021 12:57:13 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0984879c-6f88-48f2-814b-3383ae21b8cf;
 Wed, 21 Apr 2021 12:57:11 +0000 (UTC)
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
X-Inumbo-ID: 0984879c-6f88-48f2-814b-3383ae21b8cf
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1619009831;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=LQqU/FqXHMC/u8lWSIZAxn0lBzNcGhAYT0ibP1a0C20=;
  b=iR+c2XMi0p6r41btqgJb0ckvd7KS9yUgQ6qDbKT09EsbL1zO8q/twXor
   Ef4cJHdm6G/Lamb6/QG5tE4/PXzofihUdhaner+Djw8W+8yN5/ttf759u
   EPQJGr6xfPfxHhjCvDtUncoeHokWRm0pz+WPSrE1PoFC3v7B8jvbPEQh3
   M=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: SwvDTRlfIjwvc79UmOcdws7YSkR7H9YVg01pvdyNFcQC3dCrttNeN7caP32eWjZw2heapSoMOC
 gGU+humInGGQ6n4hRdilX86gQ72pJJmEkoSWun33KukR5pDBHYF1h7sIBBe3AQUkyoHbz+kJgJ
 +ln1sv6dMTGm25Ydg6At8patqjLwo0FkYBXrS8KZB58Z6cr0sBc5SdZ3aakzECfumR3blcPmIR
 pUBfr7w+9lLM9PPpIxKlDbeNZLaNmqmXJkNCi5h4X/AwhxbcsStun4XPJ8K/eWUeeTnShFAhRK
 cQ8=
X-SBRS: 5.2
X-MesageID: 41909314
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:T1KyRq2mmyNi2xOT7YhjCwqjBch2eYIsi2QD101hICF9Wvez0+
 izgfUW0gL1gj4NWHcm3euNIrWEXGm0z+8X3aA4Bp3neAX9omOnIMVZ7YXkyyD9ACGWzI5g/I
 9aWexFBNX0ZGIase/T6gO1Cstl5dGB/ryhi+u29QYScShBQchbnmFEIyycFVB7QxQDIJI/Go
 aV6MYvnUvQRV08aMOnCn4ZG9XSvtGjruOnXTcqJT4CrDOPgzSh9aLgH3GjtSs2fjtTzd4ZgB
 L4uiPj4KHLiYDe9jb90Cvp441SiJ/dzLJ4dbOxo+w0DhmptQqyfoRmXNS5zXMIicWi8kwjnt
 WJgzpIBbUP11rrcmu4oQTg1mDbuV5DhBGSqy78vVLZrcP0Xz48AcZa7LgpDifx0EY8oMp6lJ
 tCwmPxjesLMTr7gC//69LUPisa73acnHs4neYfy1xZXIcOAYUh1rA3wUJPHJ8MWB/98YAsed
 MedP302fA+SyL8U1np+kl1xtuUWG8vWj+4K3JphuWllxx5tDRi00AdxNYEnnEGnahRd7B0o8
 D/doh4nrBHScEbKYhnAv0afMexAmvRBTrRLWO7Oz3cZeM6EkOIj6SyzKQ+5emsdpBN5oA1go
 79XFRRsnN3U17yCPeJwIZA/nn2MSCAdAWo7vsby4lyu7X6SrauGzaEUkoSn8yppOhaJcHHRf
 CpOtZzD+X4JWXjXaZFtjeOH6V6GD07aok4q9w7U1WBrobgMYvxrNHWd/7VOf7jCjAhVmTjAm
 YSXTT6Kclah3rbHEPQsVz0YTfAa0b/9ZV/HOzx5O4I0rUAMYVKr0wUhD2Cl5i2AAwHlpZzUF
 p1IbvhnK/+j3Kx53z042JgPQcYCk5U5b7nQm5bvANiCTKtTZ8z//GkPUxC1nqOIRFyC+nMFh
 REmlhx8aWra5qKxS4jDNqjOnmAj2QaoW+LS5t0oNzF2e7VPrcDSro2Uq14EgvGUzZvnxxxlW
 tFYAgYAlPEGij2kqWjhpwMDOTZf91x6T3bevJ8mDb6jwGxtMsvTnwUU3qSSsaRmx8pXCcRrE
 Z26bUjjL2JniuPJWMzjP8jCkBFbH2aDdt9fV64TbQRvoquWQlrCU+WmDSRingICxrX3nRXol
 akEAq5VrXgBEFHtnVRz6DwmWkEBVm1TgZXcXB1sYp0CGLcnG18uNX7Opab23eNa1cE3+EWOC
 zEZzxXOQ9129Wrzneu6UO/PHE9xowZO+TXALE4GoujqE+FOcmGk7oLEORT+4sgPNfysvUTWe
 baYAONKijkYtlZlTC9tzIgOCNurmMjnu6t0Br57HKg1HpXO4ufHH12A7UaKcqb9W7qWrKB14
 h4l8s8ua+1Pn/qYtCLjaHRYDgrEGKdnUemC+Upo4tTp6Q8qf96GITaSyLB0DVfxwolRf2E33
 82UeB++vTMK4Vvd8sdd2ZQ+Ucojs2GKA8uvhbtCuEzcFkxhxbgTpK0yquNraBqDlyKpQP2N1
 Xa6SFb8vvfVyaI1LIRCcsLUClrQVl57G4n8PKJdoXWBgnvavpK+0CiNGShNLBaU6qIFNwr31
 5HysDNm/XScSX22Ard52QmZq1P9nuqWsO0DkaHH/VS/9mzJFSLhe+r7aeI/UHKYCr+b15dg4
 tPMVEUZIBEjDIpiYUsyCi8SqDtuCse4hFjyCAikkSow5Ss5WfQAFpPPgLYiIhHRDU7CAn+se
 3VteyDkGnn6DdL2ZPfBF5dc9FHFd8XVJX2JU5VWIEtla/t+bEujCRFaAovCGB5iCmV5ZIT4Y
 uE
X-IronPort-AV: E=Sophos;i="5.82,238,1613451600"; 
   d="scan'208";a="41909314"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dNeuhuyT08ZFKurHSKQvBAmuaIUS9FAsGvRamhc7G+0yJ8yPBjAx+TIHbvdL/ZNeO5v6DgxZQArQLL8WjX1Yh7zmrjO2ErWgKP2qqxQofU5em5mqM51p3nv4EDJA09bIiAGSHl+1zF+w+I5kBHVR2Z9qY/lv9KqIVjJmxVZ4hz6pqIU9dep+ngDFAfgLqKz1KvuMgfAWUpjPf6dtNvzTFdrwRHlvNXck4FXkezgdHWj/yxy0qZrmS0jTymivYGquQsjesPKKQIrVeqcpMiGcGHI3jJLAJWlxryQICTNDmztEOMyma9yg9oPolaKhjOmJy0JK2FIWdV/GADIBWfx47Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r0vcNzL+VYM82B5WynwoK4IUPy8Lo2fOWLelQ9gIPYA=;
 b=DNmDvBUobA2llnvrN+rdmtMyPDTlDo4P2ZTEDGiuAeU0PZAOH9INlwkyTZkewnjkrM40S2Iqc/LBUuYLBlJpCwzAUjEiMO4IHpXwsBw7MDmIgPFBBQu9dhEzkftnsVUJZVY+r+Pu83tFobNAdFFiR5K427joBV0c0vvq6GiEFQNplSDS6qkKts23cRmEev05Sb7o4igZeMN8446ErwWxBem5xL61+hZq8SHMiLbkt0Abp/C3la6w+/gQO8Qlmz0R0crOjhIC8MPpSuYviRaQEup5JxbKMAQBhaMlhfgkhezfzeH6/KtDew/du3xCIn6nPrpK5FGQKsfLXD3mIvQa0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r0vcNzL+VYM82B5WynwoK4IUPy8Lo2fOWLelQ9gIPYA=;
 b=vIWAK4RJcCTpEIfxc1VTnNDgqNf/jBPdWiun2TTjx1XPOubprhYMxI5Vg/1E76o7u3EUBPDNzhrXcDjsF3gRwsyJn2EjmTFdbBT6WZUFl1UKzrX1sCG7TRehhGCJRRFPytAtz4F+OOGxUgkMGCKdqMGSYG5u/chOoEmkKv+2JEc=
Date: Wed, 21 Apr 2021 14:57:01 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 2/8] x86/EFI: sections may not live at VA 0 in PE binaries
Message-ID: <YIAhHTsNlG7lQarM@Air-de-Roger>
References: <b327185f-db31-50c8-ec76-6ef8f2fcfdfd@suse.com>
 <5d7c61b0-8441-dccc-4917-cc8a436fd96f@suse.com>
 <YH/nzmkQMhsJE4mw@Air-de-Roger>
 <deee924d-f124-5563-727a-71ddb39403f3@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <deee924d-f124-5563-727a-71ddb39403f3@suse.com>
X-ClientProxiedBy: AM6P192CA0080.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:209:8d::21) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7248df02-9891-4445-8d1f-08d904c4f887
X-MS-TrafficTypeDiagnostic: DM6PR03MB4218:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB4218DFB5A5CB14C5CCED2DF78F479@DM6PR03MB4218.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mgd/nS8/YAL86WjpYc0D0I9bZqoJ9i6+7v/JQ4qg4ACYZV6lyYmIZkbO3dAybG1s+uk03Q9PeYeG5Km8CpB+DwH52DHG9wa5O97y5m3HV2h5cwRX+fhEEKxeULhbfEgva43YYfSfoKg8UaP2hVgUcxDu2fRWpXpO0hsJa6aVAGz6fy78WiaDoTEuze5097hRY2bcjAsXDYYe30uIXUL8facsaTxIO4XAJFTGWZoTXOKnfd3skKwiw2A2egvS0GSeT6oYcSxdg/eFvloFD9VV3MhYZUT+TWoHQaIA8nwXrxImsqRFgqHjdtpceRJvzPG4JplNbRoMUgtIdGq7W86dxtYufIfK+qtaMwGNyote5Hk5YTg0Hvq3uj56klcM5VTZdjHQxLG2MTpazuDVn4qAofWhGmtLc3pQwUoDJEi+LwnnYrWaPD4n2wW3zou8wvyR9kDgJOPgS+Q3Uay3I4LkxseMNMS1YssrovWJotC33l4pGeWlbrSarwmVgyPiriGvXqfu56Hh3QoQRWlSDDYGEatc4lxvV0Ds/0dYAo/u9HFzXXqL+SXqk8W3lLbwypr/y9eXcTMHGbALOl0tLq9VkdvJVl2a8/1/Xk/t5mzU4OM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(396003)(366004)(346002)(39860400002)(136003)(376002)(85182001)(316002)(6916009)(9686003)(6496006)(8936002)(16526019)(186003)(6486002)(4326008)(956004)(38100700002)(53546011)(86362001)(8676002)(26005)(2906002)(478600001)(33716001)(54906003)(6666004)(5660300002)(66946007)(66556008)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?QzRScFRsOUlXU08wRWdITkx6QWxqS1NiRm9FZnNiTnBsSjF4U2V6U0ZPQW1w?=
 =?utf-8?B?d0ZGWGE5aWI1ZExtTGU5TmN3cXpzcStyb2lwSGRJLzhSeTB1RHB4dEY2b3E4?=
 =?utf-8?B?b0pZRlQ0YUhwYjJNdXpFMHpjQkovV3gzV2JqdXhHRHBOcXBzVmZXM2RublVK?=
 =?utf-8?B?WHBPS3BSeVp0UFZJNWVnMUkyUUVxRlMyWXVXRDZyZUszZDJUbE1UcWFER0tQ?=
 =?utf-8?B?aXZHQno2MTB0SWNFcnBKanl3S2g3ME1wbTU3eWZKN2x6RGs4MlYzTXovUmpx?=
 =?utf-8?B?K3Vma1J1c0w3Z0V2SmlNVGQyam1zQ25EWHRvZlJ6aURZazZVLzM1T1QyTlZH?=
 =?utf-8?B?b3JrcW1DOW4xZXFkalVGSWl3Q2pUUmRvb3Z5eWdmQ1VrZ2p5cEJmeDlHSE1P?=
 =?utf-8?B?Nk1FZUhTZ2NkSUxtV240V2RLMVdzYTZOMEpZY3VzNnVVK1dpQ3Fia3hlUmR5?=
 =?utf-8?B?cXJBa1J2NzlOU2xsRDlKK1NTYzA0MnFjN2ljU3FxTWE2Vk1BdHZnQ2NpbDZG?=
 =?utf-8?B?cTVrNldnZkQ3U1U5SGtwZ2ZaWVZHUWZtWDNGYzBDejFtazNKd3pMclhxOUNC?=
 =?utf-8?B?QjhHN09INHdhbng3cStMb2YyK1hmbEx2L1JqMnQ4eWRwS0p5RDhnWHorWHFV?=
 =?utf-8?B?MXNwT1FkZzdLdFcyOGp0UUJDVjFIRjFhYmFkYklmeE1pMDkrREdMKzZqemV5?=
 =?utf-8?B?NUlFWERJQXJmUUJwMVZBN0N2M3ZnYlJOVjYvMkUvd3FnT3hMZ0I2alhZdDU1?=
 =?utf-8?B?UkZENmNxa2RldUM5dFROZEFEVlZmbG9MbHRLNW9QQTY5MmJEclpGNnV3dG1D?=
 =?utf-8?B?NFRJSFpOV1YzR2xQU3gxSUxlU1hHbVBqREJvTXRnT25PN0V2NXF4MHQ2KzVK?=
 =?utf-8?B?NjBLYlFJQUtsdkdETXI5UjZodnBUb2MxYWRKMFZzU213RVRDL2pNR2dQSmlq?=
 =?utf-8?B?TFFiWjhWVUZQTlZUQWtldkVaWHJ1eDJrakFpaVl6MjNhb1FuMkdvNGhhQnZS?=
 =?utf-8?B?TFRGemJnTHdzUHczYkNUNnduLzZVZDdpcHVCdnVTUWpXUldLdWFxT2lzMnZY?=
 =?utf-8?B?WVU0N3RoZVBFdUVWdHFvWW1TY3BWUVNTN2N0L01WazdLNkdDYXo0T1lMdjRu?=
 =?utf-8?B?NmlnajFDKzUrL2UwTzgwejhJdHZMSGZBblB5MFJTYno1L05oNVRKR0NOZUdh?=
 =?utf-8?B?VitHa3dXUmdLeEdZVnRHMmFzVTJvc0tPN09NVkZmdG5vTEc3eFN0ZWwzN1lJ?=
 =?utf-8?B?RHhMTVMwN1VMdE9jT1pvVFkvbWNGZjlpeUdhUkdWS1F5amJMZndYSnBnS1lk?=
 =?utf-8?B?ZnAxMmFzczg2NUVjVnVTMWFXUWl1ZkFPelZZd0FjTDhNMUxEQlhqdDRCRlhk?=
 =?utf-8?B?eG80WlcrdXpBS2tHMStudG1IWS90MGlodmVjT2JoM21FaWI5cy82QVg1L1BP?=
 =?utf-8?B?UHpFSldWUWxvSVIzcTkzdStkU0xCRURMWE9qWWFiMHJzcldQbjNHclAwc1Ay?=
 =?utf-8?B?NnU1c3BPT05uaWw1OFQ0MDd4R0tkaERnYlEvcjkvcEFyWDA0dVF1WDU3ZmZq?=
 =?utf-8?B?ZDEzc0dmOEYvcUtGeXZEYllVcXlReEtmR2pBWkpIVHcxUDdNYlQvT1pQeHgr?=
 =?utf-8?B?Yjl3R2Zobk1qZUptZEF5SWJ6UGw4cGkrTEx1Z0JOYmFVLzhPVTlxN1hUak9S?=
 =?utf-8?B?MFpuc0M0N2JCdlZxQ2VtQW5CTFYrZUt2NE1zWTJqOVZiRnl6K0twQSttWGJS?=
 =?utf-8?Q?2smPpwI3Vy1txhP7/HjL0ZhZ4nmmoVyIaow6jPN?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7248df02-9891-4445-8d1f-08d904c4f887
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2021 12:57:08.2058
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YpcIggvtNUI58PxmvzWLPbtGF4hxfohGunfaPhaiyAWgz1vD0VLeEZepLBROt+kO1yzx/YR3BycZbg4dhMc+SA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4218
X-OriginatorOrg: citrix.com

On Wed, Apr 21, 2021 at 12:32:42PM +0200, Jan Beulich wrote:
> On 21.04.2021 10:52, Roger Pau Monné wrote:
> > On Thu, Apr 01, 2021 at 11:44:45AM +0200, Jan Beulich wrote:
> >> PE binaries specify section addresses by (32-bit) RVA. GNU ld up to at
> >> least 2.36 would silently truncate the (negative) difference when a
> >> section is placed below the image base. Such sections would also be
> >> wrongly placed ahead of all "normal" ones. Since, for the time being,
> >> we build xen.efi with --strip-debug anyway, .stab* can't appear. And
> >> .comment has an entry in /DISCARD/ already anyway in the EFI case.
> >>
> >> Because of their unclear origin, keep the directives for the ELF case
> >> though.
> > 
> > It's my understadng thonse sections are only there for debug purposes,
> > and never part of the final xen binary as they are stripped?
> > 
> > Could we maybe remove the section load address of 0 and instead just
> > use the (NOLOAD) directive?
> 
> (NOLOAD) is meaningless for PE.
> 
> > Does it really matter to place them at address 0?
> 
> That's the convention for ELF, and also what ld defaults to for debugging
> sections.
> 
> > I also wonder, is this change fixing some existing bug, or it's just a
> > cleanup change?
> 
> If there were sections at 0, the resulting PE binary would end up broken.
> Prior to binutils 2.37 this brokenness is silent, i.e. the linker doesn't
> issue any form of diagnostic. The change therefore is addressing a latent
> issue - if any such section started being non-empty, we'd be in trouble.
> 
> > I also only see the .comment section in my binary output, so maybe
> > it's fine to just remove them from the script?
> 
> Which binary are you referring to - ELF or PE? In the former case, yes,
> that's what the statement is for. In the latter case I can't see how this
> would be, with .comment being explicitly part of /DISCARD/ in that case.

So from a bit of searching I just did it seems like stab sections
where used during the 90s with ELF, but that this has long been
superseded by DWARF 2 becoming the default in the late 90s, hence I
think it would be fine to just remove those sections even in the ELF
case?

Thanks, Roger.

