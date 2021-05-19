Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC9B23896A5
	for <lists+xen-devel@lfdr.de>; Wed, 19 May 2021 21:27:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.130373.244280 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ljRqp-0007mX-8r; Wed, 19 May 2021 19:27:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 130373.244280; Wed, 19 May 2021 19:27:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ljRqp-0007jo-4M; Wed, 19 May 2021 19:27:27 +0000
Received: by outflank-mailman (input) for mailman id 130373;
 Wed, 19 May 2021 19:27:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RCSE=KO=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ljRqn-0007jg-Mf
 for xen-devel@lists.xenproject.org; Wed, 19 May 2021 19:27:26 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 192efbd5-9497-479b-acf9-47e2513f4bed;
 Wed, 19 May 2021 19:27:24 +0000 (UTC)
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
X-Inumbo-ID: 192efbd5-9497-479b-acf9-47e2513f4bed
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1621452444;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=DvekPUmQwPfrv9nUusMjykgwzqhBcwFkWiiRwly1mNU=;
  b=AlcjPNyIcKmkqeGhuYaZRG6+pOLuj8vSetGatiuqqGhy/gCQ0tT50yWe
   h75rGQq2ko2vfF+TluH2D1Fym6xyN8cfLoobP9AqesVNB0nctCcU1Hxmb
   GZXmjhVBb0JW7AjJ+9t9ll8RoldojjNwsUk0Jec14D4Qcg86nflRMxJgn
   M=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: XrjIJCONLPUlen8Uyn5Z24sv1FpRPr8NK4lzNvBlhtNAOxpcpZVdN6rCFXug1y/Qhpk5NsgQBL
 xXK5umPpMfamT/0nysMQJTqPj/6Xqivzfe5ZmngXwTFEQ78Zq3AbFIWfB/VRVT4T843zA6zHPD
 zuKt5KXxNnGbSXgHwL9NrDx2OngCWUpu8SbS9N9E/iMOKsT0GaIqcTiOM6ycboxF4qaWW8/NPr
 23jds3o+502ATO2+8qNXzJjFUDLrcStTXz5kNEbN91sUG+5kUIe/h3ID9itWiJjGUtWZ+ghYX1
 kmE=
X-SBRS: 5.1
X-MesageID: 44271284
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-Data: A9a23:pbvcO6rJljxNe+tCDdnNFD981DZeBmJ0ZRIvgKrLsJaIsI4StFCzt
 garIBnQP/3fNzemLtF2PIWz80pUvJPWmNNlGQBrpCtjQixH85uZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlVEljufXAOKU5NfsYkidfyc9IMsaoU8ly7RRbrJA24DjWlvQ4
 IKq/aUzBXf+s9JKGjNMg068gEsHUMTa4Fv0aXRnOJinFHeH/5UkJMp3yZOZdhMUcaENdgKOf
 M7RzanRw4/s10xF5uVJMFrMWhZirrb6ZWBig5fNMkSoqkAqSicais7XOBeAAKv+Zvrgc91Zk
 b1wWZKMpQgBEL+didQjYgliNXsgAvJ+8/j1MF+liJnGp6HGWyOEL/RGCUg3OcsT+/ptAHEI/
 vsdQNwPRknd3aTsmuv9E7Q8wJ56RCXoFNp3VnVI5DfVF/s5B7vERL3H/4Rw1zYsnMFeW/3ZY
 qL1bBIzME6fOkcfZj/7DroeoeaRwVLbcgQDkwyQhqo3zGXY6lxuhe2F3N39JYXRGJQ9clyjj
 mnP5Wj+DzkRPcaTzjfD+XWp7sffkCW+VI8MGbmQ8v9xnEbV1mEVEAcRV1awvb++kEHWc95RI
 kMb+y0qrIAp6VemCNL6WnWFTGWs50BGHYAKSqtjtVHLkPO8Dxul6nYsYCwQeewYhd8MY2Z06
 QCxlJTbFBt1iejAIZ6CzYt4vQ9eKABMczVbP35VHFNYizXwiNtt10qSF76PBIbw3oWsQ2Coq
 9yfhHVm390uYdg3O7JXFLwtqxyrvISBagco6gjNUmuh42uVj6b+PNfxtzA3ARtaRbt1r2VtX
 lBfwaByD8hUV/lhcRBhp81XTdmUCw6tamG0vLKWN8BJG86RF5ufkWd4vGkWGauUGp9bKGWBj
 LH74FwBjHOsAJdaRfAuON/gYyjb5YPhCc7kRpjpgilmOcEsHDJrCBpGOB7Bt0iwwRNEufxuZ
 v+mnTOEUC9y5VJPl2HtGY/wENYDm0gD+I8kbcCql0j4ieLGOhZ4i94taTOzUwzw14vdyC39+
 NdDLcqajRJZVez1eC7M9oAPa1sNKBAG6Vre8qS7qsbrztJaJVwc
IronPort-HdrOrdr: A9a23:wLzY7aG4uPqAZWBEpLqE6MeALOsnbusQ8zAXPidKOH5om62j5q
 OTdZsguCMc5Ax8ZJhCo7C90cu7L080nKQdieJ6AV7LZniDhILCFuBfBOXZrAEIMheOk9K0is
 xbAs9D4XfLfD5Hsfo=
X-IronPort-AV: E=Sophos;i="5.82,313,1613451600"; 
   d="scan'208";a="44271284"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FTD1HBdIfDQ+j+Mnc+KFmcIudVdYFlhssokU1K6IRsL8mE62y+QTXu7xe20xSXSsInSJDH9+gQYfgPZYM8kg8FD1RrqFnT67ncc2kACIJ3wMghhCIw8b95uB3G3Cu923QfxjH4NOgRV1pQwTWr08792AKa10o9QZrnMOBXRITAO8+Gtfq6380/kIny1ZhQJE91BAD0wa0feb7/EVKLh4HQc9W8Tn0kUAvDX4SiUbor/d/qpXULRP+Ca5E/wsBIJMRjXUGZIQtprG4PoihbiKiP4VuNrnKLeSA1qDj/jqn93K2d64q364acBpfKdT/beRck63nsF+mG3m4fw9hoFaqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DvekPUmQwPfrv9nUusMjykgwzqhBcwFkWiiRwly1mNU=;
 b=J1OXckm9JRATfeGvhDM2hbBCdLKD3GoQoFUFxSVvh+sgts97UfxGkT1s4vPy87VeQVrjMzdxCQxm2v/raH3R+mTqWK1BW8NQgnukEtRG8ebdGjLfiH8CWmMR6Q5nUnb8hCeM2gMx94t1dEPOLCTJ2lp/kCrlijmFJKJIxLeLLEp2Ode52GH+E0K61Wbis2oczmRlecbmFiFsbIMRuu4a7CLDQf2p8V05SJNNsEoZyYfgKX8O12mupSAzw7VL4Xq+XiwMEVl0z9IU/AYWYPZonkfzPQDKAl66T3jgP2IRpGiMRSY0OvKTytIgGSW5ldjXrNVYcszwaygOcdW0iHy1Uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DvekPUmQwPfrv9nUusMjykgwzqhBcwFkWiiRwly1mNU=;
 b=cD9kLPqAAJuOFl3UD/qZmJ/ERdOXoM+c7pO1e/hYR88dEf9WQxZgS86OyTYyVAGXql1oW64L+n78IqDjVnHvKGqRnpaNtRAjHuk/9IX9fdjv68wz8SwtE0I2UyIrv2O2n2R9+xGxAja4GS52lx0SYoTxET7G461BEhc8bkM6ISE=
To: Dario Faggioli <dfaggioli@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>
CC: <xen-devel@lists.xenproject.org>, Doug Goldstein <cardoe@cardoe.com>
References: <162135593827.20014.14959979363028895972.stgit@Wayrath>
 <162135616513.20014.6303562342690753615.stgit@Wayrath>
 <YKSv/BGxuy+OCn3t@Air-de-Roger>
 <b596d5ea2e96be5c6d627e14b87beb51ba4a094e.camel@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 2/2] automation: fix dependencies on openSUSE
 Tumbleweed containers
Message-ID: <26642b6b-c988-406e-040e-905bdeae1b2f@citrix.com>
Date: Wed, 19 May 2021 20:25:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <b596d5ea2e96be5c6d627e14b87beb51ba4a094e.camel@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0379.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a3::31) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b4301a55-5795-44e4-fed6-08d91afbe8ed
X-MS-TrafficTypeDiagnostic: BY5PR03MB5000:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR03MB50004D6A6A8064F571371986BA2B9@BY5PR03MB5000.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: g/5hdPX+nB7ToazTsX2XA73yI0O8jeAFpNHa3393c2M3PuubF1FUjhJMibmF85SBe9XZTBmCApWFe7dOwlcTF91qaaIQdytVeH6yR/BjKTTfEp4Lro1hXmGelJT4no+51Am8SaCZJ3WITGG32b5NHV+GuLnmdMRvuQVA7/DieaiOtUhlEuMhIFhqg9WgWXGyf7rR3p+bUtcg4xCIqdNbe7xNZikhPNrcr6F3haFjJQNrlUrm3BBCAcSVqQw9cOyuMboIdGYT8sLillD6vTsTG5S051HZ6sCrfxIyC6hjsP9sWLDYqM/CSKPaldzPTsLPzb3TjiuRgdObkvFZq+58ynsz51i0pY5OAQYW0DaCi3QDDKkQrI5nPq+QP3pK4z9JSv+Pk1ZsGpJKXrrDRw36vVWxy2I1Ua6hAnQv4biLzt1dMl4FqNjxmvIHIWJaoBbFLAZdtJpxjoc+f6DZFWPydnTG/2nruexlq+KlV32c1V3yWoYeP2EYR65IDHHJIYFSOSNDbMDv4TMIpjoLDTQGAte+fqQ3/H8VaBqnxWjnIMil9//a1xqagNwWyjS7Q53BE7n8mxCfp2xsmy3vCnqyCPU3xQTl72J7FGDPWLFV7E+NePzOqGLBJjdDHF84X+avhdvlbXCpVsWV8jT7aYydOqumgBP36TMDUFpKLNSL107B69LUZ9zQyb7Th4ojNoYe
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(39860400002)(376002)(396003)(346002)(66556008)(66476007)(478600001)(8676002)(31696002)(66946007)(38100700002)(4326008)(110136005)(6666004)(16576012)(5660300002)(2616005)(36756003)(956004)(31686004)(53546011)(6486002)(316002)(83380400001)(86362001)(6636002)(186003)(16526019)(8936002)(26005)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?VFRGN2xLV1l5d3JsWWgzdFJZR2tMdHlqam1vMHlLRDAxWUNOZ3dHNHJEWE1Z?=
 =?utf-8?B?TXAzZTJ6aHJsRUZjcExkQkp1S3VtR0FEei9FbEJkSHMyUXZYdk1LVzNBUDBV?=
 =?utf-8?B?SFVENmRvamhCbExHWWtlQ2trdnZGSGZuSndCb3crQm9qRlc4dXNVbUpuc0JI?=
 =?utf-8?B?R0haYkRJeUYwZlV5UC9zTUdFR0VVVGlqMml1L09EYlpuNEJOYXBCaWFsaXZG?=
 =?utf-8?B?UmNaSGo3ZGQxUU1UOFg3VjFybzRnY21pQXJBa0lVNVRjNzd6NnBQbkU5WmtJ?=
 =?utf-8?B?bkU5bDV5UW9HRFhpZ0pYUW1TUFN2QjdSSXNQQlJQUVdCTzYvVlRJU1JlMXFQ?=
 =?utf-8?B?R3pnVFE1bjRwb0lidG94S0twS0pOMVZoZE9qdWlzeXdNSjhRMjRTVVpBWDBU?=
 =?utf-8?B?Yi8rVy96OGkzcGZFaHlmOVNmUkR3bVExNm1ydVlkc09nWnBJSU5qSEk1K05U?=
 =?utf-8?B?NHZicHpYZTV5KzBEMHdqK3UzNGJRODVPd2o1Rm9wZ0FoaEZRWkU2aFpBdlhv?=
 =?utf-8?B?Y0srRHdOR2l1S0xNTlFPRS9xVGV2MzNnQzhBdFVuT25aUkU2ZHpNNUFHakw0?=
 =?utf-8?B?QWt5dlh6ZkE0a283TUtBTmFNV2RnQ2VXaU1BSjQxa2FGNUpkWEJacEhzaGhF?=
 =?utf-8?B?THhCVTFKczVHYW5aTVVFM0s0NklubHJZN3lwNTNMTEhMeVdIODVMOTd6MFg3?=
 =?utf-8?B?dWpscjlKTWZKUzBjaVpzVllVNGlMODROMWZabVNZNDYzTmpzcG9xS1ZrVGtV?=
 =?utf-8?B?K2JMeDlEajVBWGNHaFNKbEcyc0w4MGtYV2gxVWwzNnROTHcraTJYTHVibjNx?=
 =?utf-8?B?K2ZCT1Y1VldnRm5ZYytyMGRzQnJzVlVjWFYvNDBsSE9IQldBamVYRVZ4LzV1?=
 =?utf-8?B?Yit4VGVTSjk5Q2o2N3lyU3dDWGhVV2MxdkFteUtET0JZY2ZoeFZCdUpZVTgz?=
 =?utf-8?B?dGZsbjJlOXNQaDhyNlFiamZKMlNNeWZlOEVORmR2ZGdYaE9TRkJJTC9nUVcw?=
 =?utf-8?B?MjZ2bGw3MlNRTVZOVWxPZlVKM0tLbmV4WmcvVDU2VU55Qm43VnhFdUk4NFl2?=
 =?utf-8?B?M2o5YTNiZVY0TlJGQzV3ZGZhK3J3WWh0UGtjV0tYdUNkbElBdWR4WWhjS2w3?=
 =?utf-8?B?dnFVeVIvSDhHTENWSGxQRzhYWmdlYmhPRnlaNmxhUWt5STF6T1Npbk9qb3o0?=
 =?utf-8?B?Mko4MHZyRmRmSS9ZZG9McXMvL1JLMFdob2pERVNiUGlJYVZucndCeUcxMTFI?=
 =?utf-8?B?eDUrZjNvQ2Z1ZTBEWElGa3QvdkxJZHArN1lNdVJxWk9jdlJESkMrdEpDbmZD?=
 =?utf-8?B?Uk1ubDRNOVdubmtGN0NidVVwREFkZWtnY1E3MEV0TUd6NTRsbW5tMEk1d0J0?=
 =?utf-8?B?Q1dMNFd0dHZXcFFvNW1yWGZsTXhxZGhaeWJ2MmNabHBoemU2ZVBoRkMyY1dy?=
 =?utf-8?B?VTdrd1NQeTBmeE5hL1VSV0kzVkVnSmx3YVp0NmttSGZYWmlzdW1vMnBpU3dV?=
 =?utf-8?B?c2ZPRTBxSnRZWEJMUnVlRndwOU9FblFra0NiSVo4YmNLdkRsYUw5eUJCc2dw?=
 =?utf-8?B?aTJha2pCNHNRS2tCeHFidGJFMGNKcnJIMTFhQVFLTFpHaWNtdGlIYUlKLzY4?=
 =?utf-8?B?ZnFWM1BpNHBtRVJTaUdjcnBjS0dtRWdpc0FmSWVRMG05dlR1c3RaYUlyUmNw?=
 =?utf-8?B?bmd0SUY3VTQ3WG83QXM4N1RBeGI3RHBhNzJWdGYzY3BXcFRLeXAvMGljNEpB?=
 =?utf-8?Q?FiFYn0Uq2UquTJNsDlaEMra+ufV9b+/paCX1yxK?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b4301a55-5795-44e4-fed6-08d91afbe8ed
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2021 19:25:49.9708
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /4BFDPZs4zktMWWN1WU9c5yKkqawWq+X5PNPwtxA/Qh35zohA4PbYyiX57X5kYQ+qqC0fFdVSdQKfLW0NHkY2ONKvtW73Tp0kMEBd3s2RnY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5000
X-OriginatorOrg: citrix.com

On 19/05/2021 18:52, Dario Faggioli wrote:
> On Wed, 2021-05-19 at 08:28 +0200, Roger Pau Monn=C3=A9 wrote:
>> On Tue, May 18, 2021 at 06:42:45PM +0200, Dario Faggioli wrote:
>>> Fix the build inside our openSUSE Tumbleweed container by using
>>> adding libzstd headers. While there, remove the explicit dependency
>>> for python and python3 as the respective -devel packages will pull
>>> them in anyway.
>>>
>>> Signed-off-by: Dario Faggioli <dfaggioli@suse.com>
>> Acked-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
>>
> Thanks!
>
>> Can you try to push an updated container to the registry?
>>
> Yeah, I tried, but I'm getting this:
>
> STEP 8: COMMIT registry.gitlab.com/xen-project/xen/suse:opensuse-tumblewe=
ed
> --> 940c6edbff9
> 940c6edbff965135a25bc20f0e2a59cf6062b9e8bc3516858828cbb7bba92d8f
> Getting image source signatures
> Copying blob acc28ee93e9b [--------------------------------------] 8.0b /=
 3.5KiB
> Copying blob 89c6eef91991 [--------------------------------------] 8.0b /=
 57.0MiB
> Copying blob 20dabc80d591 [--------------------------------------] 8.0b /=
 90.6MiB
> Copying blob 5ea007576ed8 [--------------------------------------] 8.0b /=
 2.0GiB
> Error: error copying image to the remote destination: Error writing blob:=
 Error initiating layer upload to /v2/xen-project/xen/suse/blobs/uploads/ i=
n registry.gitlab.com: errors:
> denied: requested access to the resource is denied
> unauthorized: authentication required
>
> make: *** [Makefile:15: suse/opensuse-tumbleweed] Error 125
>
> So, either I'm doing something wrong, or I was just misremembering and
> I don't have the permission to do that... Can we check if I do?

Hmm.

I built the container locally, which reused some of the layers you
pushed, and it all pushed successfully for me.

I've committed this series so xen.git matches reality.=C2=A0 Lets see how t=
he
updated container fairs...

~Andrew


