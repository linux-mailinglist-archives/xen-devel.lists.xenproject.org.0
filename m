Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B7FC4C8D8F
	for <lists+xen-devel@lfdr.de>; Tue,  1 Mar 2022 15:21:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.281521.479889 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nP3Nd-0005bo-22; Tue, 01 Mar 2022 14:21:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 281521.479889; Tue, 01 Mar 2022 14:21:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nP3Nc-0005Yk-UU; Tue, 01 Mar 2022 14:21:32 +0000
Received: by outflank-mailman (input) for mailman id 281521;
 Tue, 01 Mar 2022 14:21:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Qfhu=TM=citrix.com=prvs=052ba2b28=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nP3Nb-0005Ya-MF
 for xen-devel@lists.xenproject.org; Tue, 01 Mar 2022 14:21:31 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e22694af-996a-11ec-8eba-a37418f5ba1a;
 Tue, 01 Mar 2022 15:21:30 +0100 (CET)
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
X-Inumbo-ID: e22694af-996a-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1646144490;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=CFq7ucWFa/8Vfo2JLBh9/+mDVj4ToCSNMC7UOOXAgzU=;
  b=ASnO1m2KjLMNJJBgiiqpwg66xAtUvScqj2rVunc8tG2WtNdQfUANs94l
   Gr/5mlfiNtUiQFd2FZ8V6t7IOyoqGfupW7YCXpfdOWVcPFe2e7Q1+2/Er
   ZPbHhAlzavtCDJrvzPuwdPHWB7EVJtItdk/Ok8fisNacNJyrjwE0Qrmzs
   A=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 67510505
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:QNHp46M++a9/+K/vrR20l8FynXyQoLVcMsEvi/4bfWQNrUol3mMGy
 zBMWDyOb6uKYmT8KNh/Pd/n9EICv5GByodrHgto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdleF+lH1dOKJQUBUjclkfJKlYAL/En03FFcMpBsJ00o5wbZi2tcw27BVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Zl
 NFdq6TzWwgQNajDor4QdDN+SnovMvgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALNs7kMZlZonh95TrYEewnUdbIRKCiCdpwgmht35gTRau2i
 8wxamB+RxruRzp1NVYzL9EEjtau2yf5SmgNwL6SjfVuuDWCpOBr65DyNPLFd9rMQt9a9m6Iq
 2SD82nnDxUyMN2E1SHD4n+qnvXIny7wRMQVDrLQ3vxgjUCXx2cTIAYLTlb9qv684nNSQPoGd
 RZSoHB36/Fvqgr7FbERQiFUvlbYug4CY5lCHNQx7Q63kKfzySDAXTkLG2sphMMdiOc6Qjkj1
 1msltzvBCByvLD9dU9x5ot4vhvpZ3FLcDZqiTssCFJcvoK9+N1bYgfnE447eJNZmOEZDt0ZL
 9qiiCElz4segscQv0lQ1QCW2mn8znQlo+Nc2+k2Yo5Hxl4hDGJGT9bxgbQ+0RqmBNzBJrVml
 CJZ8/VyFMhUUfmweNWlGY3h5o2B6fefKyH7ilVyBZQn/DnF0yf9Id4Iv2ogeB4wa5dsldrVj
 Kn741g5CHh7ZibCUEOKS9jpV5RCIVbIT7wJqcw4nvIRO8MsJWdrDQllZFKK3nCFraTfufpXB
 HtvSu71VSxyIf0+lFKeHr5BuZd2lnFW7T6CHvjTkkX4uYdykVbIEN/pxnPVNbtnhE5FyS2Im
 +ti2zyikE0OALWjOXCMqeb+7zkidBAGOHw/kOQOHsarKQt6AmAxTfjXxLIqYYt+mKpJ0OzP+
 xmAtoVwkwCXaaHvQelSVk1eVQ==
IronPort-HdrOrdr: A9a23:WcndNaw4i4T3Tf2ptAUCKrPwIr1zdoMgy1knxilNoH1uHvBw8v
 rEoB1173DJYVoqNk3I++rhBEDwexLhHPdOiOF6UItKNzOW21dAQrsSiLfK8nnNHDD/6/4Y9Y
 oISdkbNDQoNykZsfrH
X-IronPort-AV: E=Sophos;i="5.90,146,1643691600"; 
   d="scan'208";a="67510505"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zz8CpiKRMsJrNGSKa/QegXiqORufyKQcOX2q/5UVgaDW5TOMdjrwUxgNQVFHmiVt10ho6aVbtt4jE85J8N+SacxHU3SLQeWhRGrAK1DVgKLvtf/7/Xf8gteEHEDML7grUMtLqGY66xv3loo6ph7gJaHCPCK3rQ7UmJmFwwNdKVVECALCRek17YpQxzp8/BzSxwCM42BtLUf9Ag+NuisJtgGf/MW+bMbE5+ZHztYl+72VC2lAOtD/TpHcN5y7ERzZwGRk7ED2mosuyh/Dcf+cxhR85712wHZyN7YXkCvlWnrNsYLPkPMnHy1QApnOeE4EBrntw4Z4qUQQOq/B4JWB5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=asEOo2hUVtkuimU0mOHJme/HCaJCwWp4xy/3Mmvsl/k=;
 b=eXBfnqHK66lXfcG5eRFXNdTtyQZ1XYDZWaHACh0O5+juSUqoNT2k+L8Jp+8cUcfSespLKF0Pv3E4qPQF4eMY3ab+a5358G4BSxoTpIyN8npyq2WJLx6wh8TmJoZkbHTbJMeBRH3GkwsKZqEQWI0Ua9xcAFXVPYCBqeU1s+Kz4BI6DYdD0i/OVRhCFE55R3CnEhgesu2xQ1ek2FUgYbx/ZewjBiYURj4r7ZPvJEq/O/vlXCj58fSMcz2+Yk9ALj4+sztUVpX6jp6isWHF0grqnEqHJAjR82Mq0m6IZO9XtZ4fEVjfQ052aHtytl1SsR7718lGgt6Hq4MqISWflvq64Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=asEOo2hUVtkuimU0mOHJme/HCaJCwWp4xy/3Mmvsl/k=;
 b=VT65dr7re9MNuPiWmCo6//KCqD4XePjaD+15ExQR6XEquqpu0H2oV99DdDttlJQ4rSA5nDA+dnuJ4s0f+56aSw9S+AcYIPXn0YUyn+aPDBLFmUGPgmESH4alS5t41m3FuyroNn9dAAn7gIIJH9tdPdBAz1DO37T4vynu9Y0Tylw=
Date: Tue, 1 Mar 2022 15:21:16 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] x86: fold sections in final binaries
Message-ID: <Yh4r3FNL5Wfb0Rbm@Air-de-Roger>
References: <03851bd4-9202-385f-d991-c9720185c946@suse.com>
 <Yh4i/QPAggI3AVpC@Air-de-Roger>
 <3ed7482b-c445-92f2-66df-a075f571bbf0@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3ed7482b-c445-92f2-66df-a075f571bbf0@suse.com>
X-ClientProxiedBy: LO3P123CA0006.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:ba::11) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bf08fcfb-f0e8-48ea-d227-08d9fb8ec1e6
X-MS-TrafficTypeDiagnostic: BN7PR03MB4514:EE_
X-Microsoft-Antispam-PRVS: <BN7PR03MB4514FFBDACF352B05B7620128F029@BN7PR03MB4514.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hB7wBtUBpitqRnLyDgT6AcECnUXKDXG006ON9ZH7JL5pDFQNg5Z5/vy8wAHY5Iox/IVKPTkTh0B/TYd8fw74UlhafapVHYyAglNmhfqAJdHeJ8XR5DK2u8rR1n1R3PtE35s3YO0fysUlPBovqZcHwBc+RBotOy1H3uw34t4zkUTmm/Ns9gTBQLHtlt4Z+6TE7bOwSLPNlfnzLQqJz3Yelo0ils5Xpo2VH6Z9U9qDUt+5K6/2+u3j/INhgA0dfNfG+JFNYwoxZQVjnJWyLPtVckl2rUlQ+mX09oL1q7wnaqKHf6lW85ar1ewfFZpo1RGA5TFsLARU0ftVRrEOJF/jc4Spse/EPbqRAQqv/dzpwtcs1qJ/ac3JJG2i9UPbKzWZ3H25wGDboguvLIwQvaiugRhKPjzkXxZz+xyXCqhY4Gafct/06V8I34Dq3zgQCj39Hff4vxlyOiisw3TSkNVDgUyarELYH/rf783lr8v9jbo1VfMaQXQHcNfP7c63jehiB9CQYYLwUuHzor9Kg18Tk143MvSo5PQobZ4a1JS8PtdNjYWDbLLT3+am4jtE6Bu1AWLesNi6XvdRz1RiQnZs8IOKyS/IUolHTcDpkvs32/GO+h8Pq1o5kEpREQP4R4zbWETj6eQCUeCIk7gPxfV2ZA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(82960400001)(6506007)(316002)(33716001)(6916009)(6666004)(53546011)(8936002)(54906003)(86362001)(83380400001)(66556008)(66476007)(66946007)(8676002)(9686003)(6512007)(6486002)(508600001)(2906002)(26005)(186003)(5660300002)(38100700002)(85182001)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z2NlQ2FnSDgrRUZrM00vLzkvalVsUUw2aEVzcU8vVm5CRVBjREMxTzFCaFdG?=
 =?utf-8?B?bTk1YW1oVkswY0IzN0Jad0NlTnBYVkYxN0J2M3puR0NCSHJ6NG1hMWdxK043?=
 =?utf-8?B?SENWRUd6aW5Ja3ltUUUzT3JaL3gzOU00NTA1QlJPQnJ6NHNBTW8rbGVRd2Jn?=
 =?utf-8?B?ZGJXUElobC9KeksrMEV3KzBtS0Q5QTBnZ3pVQTVVdExobVhidkxyYVdjTWFz?=
 =?utf-8?B?WTlDcVlpcVdyNmM3WW1nbll6YnZwcU0wL2VtTWcwYmVYWUsyUzJIdE8vekhG?=
 =?utf-8?B?bUFyN0xBV3NSQjUvc0prV081ODlRaVg2Q3A5bDFkZzVRT0o1Ujl2NHpLN3BL?=
 =?utf-8?B?SkRUNCtBZVl5OCtuNFp1dkdLT3ZXaUdadXU5Tk44ZE1WdHdzQ2lMK2tBRVpt?=
 =?utf-8?B?bnFEV0tXVWw4TmI1RmRCR2p1TVhvTVhJYXVuWkNpZjd1THo0dUNSVmhUaDcx?=
 =?utf-8?B?aEcyc2VpYmxWajdEL1FicmNya3BBTlNlMkJYc2FZUmlHSkVnR2pqWU9xWVky?=
 =?utf-8?B?S0Uvb3VVSVZKUU5yKzU4VW8vWUVadzlCTnFZclJZOHRuQmhpdTdxTFFFdm1X?=
 =?utf-8?B?N3c4NHVTMk1jUzA3V3ZIdFlqVkpmbmlsbUFuNW5JcURCVmp2S3MyQjhiMEtq?=
 =?utf-8?B?MDZxN3NISUVLZTQvSHRHblRuaEhHalBvWXBjczd6UUJDWGtjcW5vaEcwT3hx?=
 =?utf-8?B?bkEyRmxyWTVVQVRTRmxDTE9wUUxhZUEzbDBvdmtFVXRnMWFzcGJ4QzA0Yitw?=
 =?utf-8?B?K3l5VmJCRW05OGtWTlB0ZkpXTmhqVW5BSzN5Y1VPem96aitMV2E1V2ZjT2lW?=
 =?utf-8?B?ZnVPakk4RWluejNpR2YzYWRlRFBxZU1LejVnM0dJb0NxTmp1WEgrb01JSnU5?=
 =?utf-8?B?eC9BbkFiSDg0Rk1EbThKNEtXSzdKeG5ka3c2WGNpNHhwbzEvQlFHRW0wQURm?=
 =?utf-8?B?K011VURPRTN6L1U2YXdoYTJnUXhpVXIrV0VLWnhmTXdlSGJLVExSOW5lNkYy?=
 =?utf-8?B?NzNxL0JyREIwT1R0bUk5MlQ5R2VqbFpBemRqaFh6UjZUeXk1MkljYS9VejJv?=
 =?utf-8?B?WURIYkx1UUI0ODZjMW1YbVBaOTVsSTNrN0ZZbTFZVGRQYTNDU2xGZUtLZWtk?=
 =?utf-8?B?NTg2bWorSGJ2WHdUeGRtdFJGVHk0OCtOR1JnZGdlK05zc2I5NkxQdEEvYUs4?=
 =?utf-8?B?TWN4OWhDZFNrRVZNUE9SMW5RR1B0dmlQd1VZY3RsRFVuck0vZUFwU2g5dFA2?=
 =?utf-8?B?MUdvcHcwVTI3N3NPUVA5R2RKclFQU001MnJPTGpwRFNpWkFwM0Rtbk9DeGFC?=
 =?utf-8?B?Qk1Wd3grRzlOSk5QeGZTYWNnQ3ZnUFZudHVzbU1xeEVTYnk5UWtOdCthVnhq?=
 =?utf-8?B?eFZDMXhOWXlBVEhzMWFUZWZBQlIzK2pISXYvVGZkSjIzQ2xXWDRKcEpncU1o?=
 =?utf-8?B?S29LNVdLdzVaT0sweWJNQ0hzZ2hDSEtnK3l4Z0pkdHB0ZVFRRDMxc2ZsRmF0?=
 =?utf-8?B?UytoeU0zelZtRHF1eHJSckloamZ1YXhINkFlalVWTHNoRExFWmNId0dINWlN?=
 =?utf-8?B?MGUwaFV2WGZVVFEyQXc1a2tKbkxlM2lKdHV0L3p0NHVXRWZyY3F0aHJ2K0JT?=
 =?utf-8?B?ZVJQVEJ5QVViK21oTHE1ZmVjVjhxVjZWdHgwa1FJQmVsWDFpQlRBL3NMSERT?=
 =?utf-8?B?SUtvYXNzeTE1MUJZampTZUJncnlkdXFFM3VvRjVmZWRrcFJnWVM5ZXY1QWp6?=
 =?utf-8?B?bE9wUVVYQW54MGRUK01BOFQ3NlJLbTFZTWdpbWp4ckRuNTZTSnk5Q1J2ZmRt?=
 =?utf-8?B?NFNGVVFON205Z2NOaVJJZTcvalQrQkR5RzlramtrbzZaV0YyOHphbkZBL2lZ?=
 =?utf-8?B?eDN5WFBiNnhqODZKc25ZR2F3YkExYWNDdDdvVExvaW9JMU9oNWZsYVU1SE5r?=
 =?utf-8?B?d3hzWXBLNXd2aDlyNHpRekNmTVgvU1Radm9UNUQ5b0lnd0dTQUR2KzVXbkpU?=
 =?utf-8?B?T003NlVXMXQrQkM5NXRoVkxISlpqVzZEUXdjMS9ISDQxVnhtbk4rRW1zTTEx?=
 =?utf-8?B?UVhJakNoYXpkbjd6K0ZkMW5GZzlSVmZpV1diWEgxcERRbkQ4eDJzcVc4U08y?=
 =?utf-8?B?NnBlcWlCbUMwbXRJbmYyeUxqdHM2OWRCWWtCZmZVYnExQ0UrZW9ka0t4S1hL?=
 =?utf-8?Q?xfA+lP18cjH1NrwHvwIbplw=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bf08fcfb-f0e8-48ea-d227-08d9fb8ec1e6
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2022 14:21:20.7943
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OxtpW94KFm9ekU7MWLtbAOpP27QMD1VJrf6rvtcRLFV+6sMPtbnvsMU45+VSVfHj4gjZx3f+QW2B+dMcz3DANw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR03MB4514
X-OriginatorOrg: citrix.com

On Tue, Mar 01, 2022 at 03:06:30PM +0100, Jan Beulich wrote:
> On 01.03.2022 14:43, Roger Pau Monné wrote:
> > On Tue, Mar 01, 2022 at 09:55:32AM +0100, Jan Beulich wrote:
> >> Especially when linking a PE binary (xen.efi), standalone output
> >> sections are expensive: Often the linker will align the subsequent one
> >> on the section alignment boundary (2Mb) when the linker script doesn't
> >> otherwise place it. (I haven't been able to derive from observed
> >> behavior under what conditions it would not do so.)
> >>
> >> With gcov enabled (and with gcc11) I'm observing enough sections that,
> >> as of quite recently, the resulting image doesn't fit in 16Mb anymore,
> >> failing the final ASSERT() in the linker script. (That assertion is
> >> slated to go away, but that's a separate change.)
> >>
> >> Any destructor related sections can be discarded, as we never "exit"
> >> the hypervisor. This includes .text.exit, which is referenced from
> >> .dtors.*. Constructor related sections need to all be taken care of, not
> >> just those with historically used names: .ctors.* and .text.startup is
> >> what gcc11 populates. While there re-arrange ordering / sorting to match
> >> that used by the linker provided scripts.
> >>
> >> Finally, for xen.efi only, also discard .note.gnu.*. These are
> >> meaningless in a PE binary. Quite likely, while not meaningless there,
> >> the section is also of no use in ELF, but keep it there for now.
> > 
> > Should we also use --orphan-handling=warn as to recognize orphaned
> > sections and attempt place them? We have now detected this because of
> > the 16Mb limit, but if we remove that check that we could end up
> > carrying a non-trivial amount of 2Mb aligned unhandled regions.
> 
> Yes, I guess we should use this option. See below.
> 
> >> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> >> ---
> >> TBD: We also use CONSTRUCTORS for an unknown reason. Documentation for
> >>      ld is quite clear that this is an a.out-only construct.
> > 
> > I've found some (old) documentation where it does also mention ECOFF
> > and XCOFF apart from a.out:
> > 
> > "When linking object file formats which do not support arbitrary
> > sections, such as ECOFF and XCOFF, the linker will automatically
> > recognize C++ global constructors and destructors by name. For these
> > object file formats, the CONSTRUCTORS command tells the linker where
> > this information should be placed."
> > 
> > I guess we can get rid of it.
> 
> I've taken note to make yet another patch.
> 
> > The patch LGTM:
> > 
> > Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Thanks.
> 
> > With the possible addition of --orphan-handling=warn.
> 
> As above: I agree we should make use of the option, but I don't think
> this should be squashed in here. The option appeared in 2.26, so with
> the current documented binutils baseline we'll need to probe for its
> availability. I'd therefore prefer to make this a separate change,
> and I've taken respective note as well.

I didn't check when it first appeared. I'm fine with a separate
change.

Thanks, Roger.

