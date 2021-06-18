Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B7383ACECB
	for <lists+xen-devel@lfdr.de>; Fri, 18 Jun 2021 17:24:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.144780.266438 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1luGMF-0000E8-Ix; Fri, 18 Jun 2021 15:24:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 144780.266438; Fri, 18 Jun 2021 15:24:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1luGMF-0000CA-F0; Fri, 18 Jun 2021 15:24:35 +0000
Received: by outflank-mailman (input) for mailman id 144780;
 Fri, 18 Jun 2021 15:24:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CUMw=LM=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1luGMD-0000C4-Mk
 for xen-devel@lists.xenproject.org; Fri, 18 Jun 2021 15:24:33 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f15bceee-c04a-4e94-a031-34a8c2a1a710;
 Fri, 18 Jun 2021 15:24:32 +0000 (UTC)
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
X-Inumbo-ID: f15bceee-c04a-4e94-a031-34a8c2a1a710
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1624029872;
  h=subject:from:to:cc:references:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=mqyn611PDd6fVAKKUOtDkdzYytWsLHTZM38wla5oXMs=;
  b=TECovWn3HHFsHXHru5PubhyBO9KZrGZscbOS40Cwgm3Sj5+afbV5Yy0Z
   GO28vEDnx4WW99WnTPrm0MivCadivD0WJhBCC8tojsuxHfEpxTfkH4CnS
   z2PL70jpY8pF8TwJXlVhXTm9g7KVh46D+Vs1pmcPndEEtC6KEOSd60Nmv
   I=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: jILxIwSiqFHrcQ+/eFF+oZHNznDER+poq/zqRso8ON93ri/lgzKkLxPwBOAk5vLn2klE5ch3g5
 su4k2ZR9sn1IGELKxb6+q8pF6VbaSgT0BRSIMcRCUrs5ZaSlh/UWx+tnMkomXQAga8Q+n46vfB
 9ai/GkG5QrfZYqaiYHkHb+gjp2QQfULjyS3NDqtKTG8A8jPH5KvPoZQwrb1hD3dEaXgsECYI44
 7ibRcQIeyEeYC4oYuGXrZliw40FjpxoLxMsUjGt4vKTjrED/NgBpawDiTbThl+uAGRqB+a3ieh
 0VA=
X-SBRS: 5.1
X-MesageID: 46540851
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:fsKWBq/zy+TXMiTGDgNuk+AuI+orL9Y04lQ7vn2ZKSY5TiVXra
 CTdZUgpHnJYVMqMk3I9uruBEDtex3hHNtOkOss1NSZLW7bUQmTXeJfBOLZqlWNJ8S9zJ856U
 4JScND4bbLfDxHZKjBgTVRE7wbsaa6GKLDv5ah85+6JzsaGp2J7G1Ce3am+lUdfng+OXKgfq
 Dsm/auoVCbCAwqR/X+PFYpdc7ZqebGkZr3CCR2eyLOuGG1/EiVAKeRKWnj4isj
X-IronPort-AV: E=Sophos;i="5.83,284,1616472000"; 
   d="scan'208";a="46540851"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZaCW1ZmbPCCAr8QSBe5goB8XgNtivCoprBq1dxMy3+wSX6YGw/aXmXVsu3VOMWn3PlAqLNcC5V5FGGcEH5EHmp9CPvK+KQ+8iyJlliHINtAblWNU01/tvvPY5g5VGrjCMHEjd0EsiONGrCph/odPyxsuxpxLKTjzeijVFmAwsnzru8G/5fGJ0+U112x1zu96aMSEQP17QfwnlLO80EUxTcw6j8fKwiIrAryDv/Ew1DINCYMoBSnnJ4e3JcCo3v79oyNV3x5mTTNbGagJXRKXb7S2Ap8xLEQouIpFqnol+uHLWwp7mAqthia415MmhwKO8jKe4WiPABWfHiP6CsjJ1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KpDty8QdHfR4l02BoZDsxp/26qG5NlYkfs/5fGe7/c4=;
 b=dOEmoPmfl7OaaCluUq+Qca4PtuxogCCdLAhuptrGjJooe9GFMQZ3meJ+WEfuEoldhHPr4h2OFnulNbYML9O67CxK7j79/SFN/nB4HgSNvtNBkptjGJ8RWARdmjgYPxHDoo0fLvQYCPjTj3/HD+5XR4IKW80y/lfkflu+Z3zTsVau2IXOd0lSHURSQQhIa7r+U1uQasSi2uMH30Lp4h29MMHHgQenIGUPMTbW6D7r+MzAV/hwChvFsctQnqKSxaMVNjZc0w+jUCC+RiXClH/T2tv9VtI+Eu7yVQsJ5qWVpNM5zhMZSfzHmP5+9lTxOadGsL0fS/UeJkxufahRZrplaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KpDty8QdHfR4l02BoZDsxp/26qG5NlYkfs/5fGe7/c4=;
 b=l1h7ysICwPsmBdhhsgymSeSaaq4rJft33gOHsrqsPuTGNRl7tGjgzmnHnBvjjtfJCw/WDCnSnF3m1ZHaLvYSXx7UFmsVhVdrcRznuvimM0fltYi+o7YEsZSj8+nys+OtIpC0sq9ocJEffjSFRL8mSSeEaMFD51aZCvPg4NsNukc=
Subject: Re: [PATCH 5/5] libxc: make xc_domain_maximum_gpfn()
 endianness-agnostic
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, Ian Jackson <iwj@xenproject.org>, Juergen Gross
	<jgross@suse.com>
References: <edaf04ec-335f-a156-34c4-5c0385cba08b@suse.com>
 <99979695-e53e-7764-85e1-64dd4cf9447b@suse.com>
 <bcbf4a71-bf30-5a9e-a399-d4366ee95423@citrix.com>
 <0258fa6c-3202-b012-90d1-f48a5f3e9d8b@citrix.com>
Message-ID: <79cdb790-2db8-0922-5412-d5ab69e7c0eb@citrix.com>
Date: Fri, 18 Jun 2021 16:24:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <0258fa6c-3202-b012-90d1-f48a5f3e9d8b@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO3P123CA0008.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:ba::13) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e3e6911a-d16b-4dff-8bfc-08d9326d29fd
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5920:
X-Microsoft-Antispam-PRVS: <SJ0PR03MB592055C1940D29420CBF558FBA0D9@SJ0PR03MB5920.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6DMIHiYORcW/i3YnWlmejcf5CZ5tE4/5z/CT1NUPe+YnSq71irGcEF67s0YHLY/EJfJAFlLDehNneoBH/2criwZXAzC8FWCtef/kvaEkjdcFy8LPQD4lLtWdEcj3usX/jQpvi7bkXvhxzF2dJVa10UmDAN5P8HWVjycSXOOhC/oo/0dxbecy1hdBp3LzEvPbOVFZw1O5bUsBK/RBYWP4uTIlXNs1z80jxWLYXp+RBvGhbU1i0YrTqZrqoA1+ejY4W28XjBUDKrzXs8O/xGZNj0Xah+S/11VVcCC6l8jLb2ozUrLtW738DnOfEp8uPkfL66pV/ICOiumVCi/EmFbUCNK9S9aGOxJyHQguk/iATlVBlTcAYWGzsroJ9NDxqZ5xSaO+nissqN1hym5N+y50SxhhUttEV9PrADhsLTtZmyJ7bBZpDhaGiWs94rffbQih3s49x3PfL4rhUAR5y+jhEe32UjIgiUf7kw4mzLElnM/N3Q1Y2CcHBk9WBZW9XrkSVG6WAYIR0eng9aPqtmkAdtaZQ1kVG+eCoarFgwPcivT4rrTbbAjPvznlD9eoSlHrJ8yHcUCCNrHIWXQ2ECXP6odth+YZdlbzV/ynafvHW89H+S2Sn3kaYVAyBQZ9JdLlEvZTTr9ejaADQ/xa5VeiTmv7f+DJQZaNKEMQ1xl7Y1S6h81tlPBSTjUWm6V2dRO7
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(39860400002)(396003)(136003)(366004)(2906002)(6666004)(956004)(110136005)(53546011)(31696002)(38100700002)(66476007)(316002)(86362001)(8676002)(5660300002)(2616005)(54906003)(16576012)(36756003)(478600001)(8936002)(31686004)(66556008)(16526019)(26005)(186003)(4326008)(6486002)(66946007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c2ZDZCtGWmhyUTBKeUlmYWRIU1UwSFN1emM4cDVaMDFjcFM1TFJRTkQ1Qktq?=
 =?utf-8?B?Q1JtSGlPWTRIOVRxU3pGZ2MxN2hzVWJpTkY3YnNCWVBaMkFTTXVmYWZqQ0pl?=
 =?utf-8?B?dmNmcFNuRDEyS1lyR1RLTk12aFd5dWFQb3dUdHhSdHVrdDc2aG5tYngvRWYy?=
 =?utf-8?B?Tm0zcFZHMEpDWXVKSFRrdnl6RU5pVHRybVluKzZxU0hPTEVMaUV3SXphRENE?=
 =?utf-8?B?MlhZVWVONEtySUdPN2FBYW9ha3RqVzVhRXJYOElLK29sNFFYZ0NtRFZYM0Rh?=
 =?utf-8?B?OGxGMlN3ZkZRdkQxMGYwcTJoMUs0R21sSnF6d0t3STJVMjhnSGJRZTN0Z2lC?=
 =?utf-8?B?OUhiRU96MmdpY2xONWtUUnRoRTRLMEV2VysyeU95SGxlL3dpOUMxa0F1aW9k?=
 =?utf-8?B?NVRLVDZDWXBsZ0VDMXJzL25VQ1dTeXpMYVlIRmloZG5NVWczY3lCL2R1dFRx?=
 =?utf-8?B?U2prUDhsYkkzWkZQVWpLT3lrWTBqakdtS2lZTGlMeG9hNkxqcnlyZHdCaXQ5?=
 =?utf-8?B?NC9qZTJTdmx0enRHc0ZVNGVyakU1ckFiTW5lWmJtc0I5dGR4ZDE5K3NraVJi?=
 =?utf-8?B?R3BtMUZoMlgxQjN6R1UxZnBTUlNpeTdnR1RnT0d4eWdJVFN2L0FTdXNKSlpp?=
 =?utf-8?B?Rms1WE56Sjg3SjhYZkRwTVdqdlU1d0REYmc4WTZKdzVlRVBrWWN6bnhERlJB?=
 =?utf-8?B?VysremV0RTNWMzZUNzgyalJ3dCt4ckhMMkIzZi9lak1sY2p1VEFxaEFWQThW?=
 =?utf-8?B?dzQ4dmdyUTNsMmJVR2FpdnJEQjE0MWxqdEJxMnBEMHFDRVBmOEF3NUs1dXZi?=
 =?utf-8?B?TlEvZzJpYmRZM1FDUUhwZTdSYWZqOU9QSE5EclMyMnVOektiN1FnNDMyQ2Rj?=
 =?utf-8?B?eVdYMHFVMkk4Q3lTazdmOU5SNDhtcXRPajI4Y1J2eWpvY2p3cVpHaCtIUnBj?=
 =?utf-8?B?VTlGaVRQKzc5K3Q5ZTRPUmRjbk1FbjgrNjlOSFhWZW0vNERkRUdMZWRWWXlr?=
 =?utf-8?B?MzFvd1IrY2pGMmpNUGdDTnBGZEtRZ1g3RHdVUFpnSWhWTU1IdFRLT2Z4c255?=
 =?utf-8?B?VGxOaWRpTWlNT3NkOGtSc3REd1hQNDhpeW1SU1QrbkFOUU1MdGpsYVZCRWNm?=
 =?utf-8?B?emZLbFpSVTVNVTRGaU1MZjN0MUppWUNjN3VZZ0U3ZXdWYVF2bmMwUmM0RS9Q?=
 =?utf-8?B?b0pLbWRWRTVyTTdpVUtaTlB5N203Tm5OVkNPcGgvVGc2VEE0SXFhLy84b0xw?=
 =?utf-8?B?S3RuRzcvR0t4bmFzK1FzZE03V2haTE9yaFg5NXJpK3ZxdmNBMUZYT0FaT29F?=
 =?utf-8?B?bEdjWDdDTTBUVWxjZ2hwbXlUaFdWYVdjRzdXeWZpd0tBbUxaY3FHSmZFOG51?=
 =?utf-8?B?WmR6YkZwVG1SMG1TSzFXVTByNHA1ZEdoVFhyZWtDbFFwN1hzSGg2eGhyM3pa?=
 =?utf-8?B?RThkOTkwa2ZacnFZd2J6azFFeEtlRkVEbXpnaW9GM3NhdCtqb1FOckJISEwv?=
 =?utf-8?B?MUlEQTZuSGhRa3ROSVNIWDVzbTlJNzRZSUg0SkVWb3IyZmljL2x3Z3ZHY1hG?=
 =?utf-8?B?NkZSSTFZZkYxRFFWY25kSi8zaGJuZ1kya25uWHg1TG5YRVU5Q1M4OXViRnFl?=
 =?utf-8?B?aC8ySVduYzFhL1d4WDFoQkVUME1RUmZVNzVaWHNGUVFsYWY3M3IvaGNlREJV?=
 =?utf-8?B?dDNEazJ1bzlvOGttZGtNdDA1ak9BdmRhTklRVDhlSFJaQ0RXc0ZPZjNBamtJ?=
 =?utf-8?Q?8NGbYB4+Qe8dvAYJOm0IKFqxEeV46apYItTYpu4?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e3e6911a-d16b-4dff-8bfc-08d9326d29fd
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2021 15:24:28.8001
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I9J4Q4nEdp8OcsaQ1rM33vyJ7nBa58BN0n7jBp+GKwm+P7ggQQ20KGeTvtzt+YH5aDQ0uVS339Mjz9YDRTEAMvIvg2gjedsK9/fUmb/uuNg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5920
X-OriginatorOrg: citrix.com

On 18/06/2021 16:22, Andrew Cooper wrote:
> On 18/06/2021 16:06, Andrew Cooper wrote:
>> On 18/06/2021 11:25, Jan Beulich wrote:
>>> libxc generally uses uint32_t to represent domain IDs. This is fine as
>>> long as addresses of such variables aren't taken, to then pass into
>>> hypercalls: To the hypervisor, a domain ID is a 16-bit value. Use an
>>> intermediate variable to deal with the issue. (On architectures with
>>> arguments passed in registers, such an intermediate variable would have
>>> been created by the compiler already anyway, just one of the wrong
>>> type.)
>>>
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>
>>> --- a/tools/libs/ctrl/xc_domain.c
>>> +++ b/tools/libs/ctrl/xc_domain.c
>>> @@ -856,7 +856,9 @@ int xc_domain_get_tsc_info(xc_interface
>>>  
>>>  int xc_domain_maximum_gpfn(xc_interface *xch, uint32_t domid, xen_pfn_t *gpfns)
>>>  {
>>> -    long rc = do_memory_op(xch, XENMEM_maximum_gpfn, &domid, sizeof(domid));
>>> +    domid_t xen_domid = domid;
>>> +    long rc = do_memory_op(xch, XENMEM_maximum_gpfn, &xen_domid,
>>> +                           sizeof(xen_domid));
>> Why on earth do we pass the domid in by pointer and not value?
> This is horrible.
>
> What we're logically doing is passing a  pointer to struct
> xen_memory_$FOO { domid_t domid; }, except its all done by void
> pointers, and even the public header files don't provide a suitable
> structure.
>
> I think we really do want to retrofit a suitable structure in the public
> interface and use that, rather than to continue games like this.

Alternatively, declare this interface broken and reimplement it as a
domctl, which is where the functionality ought logically to live.

~Andrew

