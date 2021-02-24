Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB495323BD4
	for <lists+xen-devel@lfdr.de>; Wed, 24 Feb 2021 13:20:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.89326.168129 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEt9S-0003zB-CF; Wed, 24 Feb 2021 12:20:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 89326.168129; Wed, 24 Feb 2021 12:20:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEt9S-0003ym-8d; Wed, 24 Feb 2021 12:20:22 +0000
Received: by outflank-mailman (input) for mailman id 89326;
 Wed, 24 Feb 2021 12:20:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Qs49=H2=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lEt9R-0003yh-49
 for xen-devel@lists.xenproject.org; Wed, 24 Feb 2021 12:20:21 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b4efec8c-fa26-42fc-a931-9caae9d0c5f8;
 Wed, 24 Feb 2021 12:20:19 +0000 (UTC)
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
X-Inumbo-ID: b4efec8c-fa26-42fc-a931-9caae9d0c5f8
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1614169219;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=XrvU96T7nHlvZ7qKNbyDITn0nT2TzC21rEcOWPP9Oao=;
  b=Nqzdh8csc33eWOzEoiwR4w0d4Jrdu00PHGXYJ27HQ14gR4k0Zu4LmY/t
   svBpyRRXu6Q+rGEM0R0VfEpLgbWP0sWXEyxn6LJbZa7vLgwoLmzRABQWH
   qTDBjQ6eg7th7Oiuc19wfJfaW323GxQdiL2lIviz0SzBLpKgxDUtu2h14
   U=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: Qlx1dVVS2khDOSVX6Fl2AuMOzuSYdTyq8Ymeg7zCWkJNpUiUR2sChmW6L6UfAXNvGfTqDvi0jD
 RybzboO33BPU2WxGH8ZLxvKsyK131Hd9qMzmTeFfYTVOH7klJTCwM6qAm4U2c5wPurVFlAACvm
 Zt3ECG3yajEJZef0Ipltl4tCxMaQrh13Joo+wyaOYZkoRzeKz2hxp1TFnuMGysoEdmXUSw/Sxp
 7F2z/CiaEHwybbq4bi0HrF0VzGlcuxeUJ/7CmFofv7jYQgNizH0rPZq3dFZOgPPbKID7twuJt6
 s64=
X-SBRS: 5.2
X-MesageID: 37843278
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,202,1610427600"; 
   d="scan'208";a="37843278"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GnhuUWrFmO+wMOiTtmqRFMes7++2U7GM3aiqvqeLxflZeXS/34oXl67wqLso485qwmQrKntqG5f6OT+c9PMxuy7SGjjaMLvdvqg1yiVLU/qvMs2b5THQx5oD/eT1H9swInHS5Dus+uLT2d4/bG6kip/yoIynkaRKPGaoAI1MMlbvxJNcld0TxvsMJC18IXW0LiYu17/2QYR2alsKRzaRpoEyijfRMTBQ3/ZkvT1fNweAIPH27z9ct8uF2J7CgFOtCvQsWbdaK4mvU7JU7cdoB6xSRcczfFku3+9YsBfVDNdqYCfjK1KZiW0zXFJx4QIImq/ujmo3Y0uKFiy9sCT/Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ok12U9rxEGFwWYAsm8WBJ89Xf072quc4MNURba2/bAs=;
 b=BcFykGl8OnVmAqjXyuy7Anc+EwObfDAJ/JwKX5AsC5ic0rLDoHgk35h88mqHDx7qPR++sQ2z2NnC/JVnMvGCaniUjXv/dfqRFb4kQGcSTFU2+OelgOjl6WrnZ5nOuIv9s2clr9InzVIeyNvRMyFeYGxf//1TeRyplbHUbG87jix/t3A/z3771O3sDDM1Izj4UyBncaNvcOVqAQEW0XPAbsx0kb5pM9ICZ1qR7fZFD9BMdoz8FzKUpPoc5HUkcv4+GoQoCBa4a1PasaIczbc4AldQzMT/eB5Xbxp/TSVrrt0utoR/0uC/4lyWacMCcfuwX2TatsK7vMlHuHgFEbJmHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ok12U9rxEGFwWYAsm8WBJ89Xf072quc4MNURba2/bAs=;
 b=kSAxdNa0yY84wqHrLWFRdDTHWHy581+EvH3RzxJ+CHcWmtEwJeHaAvrAViFuyVKKVqm+Cm7UYjRu6X+eYAmF0Pe4dRhlE4/p0Y1pqb7qqO97kJ+FudVtJnL3NsL+HMx1feVqOmUIQo7FojY+4eEfysPa/Hj91+S2WUO2hxrhiXw=
Date: Wed, 24 Feb 2021 13:20:09 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: <xen-devel@lists.xenproject.org>, Jan Beulich <jbeulich@suse.com>, Wei Liu
	<wl@xen.org>, Ian Jackson <iwj@xenproject.org>
Subject: Re: [PATCH 2/2] hvmloader: do not include system headers for type
 declarations
Message-ID: <YDZEee8loZJeAKZ9@Air-de-Roger>
References: <20210224102641.89455-1-roger.pau@citrix.com>
 <20210224102641.89455-3-roger.pau@citrix.com>
 <ad25d5b7-2f95-91f1-ad46-eb686cd4f397@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ad25d5b7-2f95-91f1-ad46-eb686cd4f397@citrix.com>
X-ClientProxiedBy: PR3P192CA0020.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:102:56::25) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 67717d43-c7c2-49b9-4aef-08d8d8be8a9f
X-MS-TrafficTypeDiagnostic: DM5PR03MB3371:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB3371A2CAE2360ED2FDCD30FB8F9F9@DM5PR03MB3371.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AzuBx12BqKgni2xtn93wwXakVHiP/r+hA+BsGkI+o+acK0o9TgcMFHFRtvxnrjhME2HA1jxP6vxEYlTiIwyl3GRMnOuZ/pvl9p8J0c+Mc1hU2x3d6jBVVStOS7v/4atkcAHCrQ+IfAqcjFsfpetw1RNqfWB2Xp5U2yYhmADDBfuC6/9PyIkzzEkB6MuPS2spMNW1OePEuDaEffn/BEV2+p5KHTaQLX0BaYyYdXzp9LndxGkvdLU2tk6sALdBXLYG0Qp1wRnGgLO0njfI6vd5GbCAgvTIe6vV5qBGSBnxn2IaqsbezIiu52DqS1ssZosfqFrCvLKmOgVrTIle6pQKjsPRIzLE1wGGni7T+NMwOQGaz2vo3qDNN4ry5CQNFUg3LJbCEhjC00NM2i4kXw4y6HcTgKOeptMhD+ftE1IByveuOs19o8tiXCUbflgjOsCLCXjH7tSp2kvfTzKCqkHoWaAET+Wdv1TcDgP9os7lSR/UxPYzAPpXGsKHIwQNOYhLelMN8tccAyA9yw0Sr+ea9Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(396003)(39860400002)(136003)(346002)(376002)(366004)(4326008)(53546011)(9686003)(16526019)(26005)(5660300002)(186003)(956004)(6862004)(478600001)(6666004)(2906002)(8936002)(4744005)(316002)(6496006)(54906003)(86362001)(6636002)(33716001)(85182001)(6486002)(66946007)(8676002)(66476007)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?elJ0Y1d6UE1TRUdSODJJazFLZUREZ3JEWGZ5TjQxQXFrbEdWU25qdDdpSVNz?=
 =?utf-8?B?VXUwaDRScmFLbUFJdTZiU0VIeXNUSFdHYmtaLzE2Ly9nWmExRHNUTUYzMlVv?=
 =?utf-8?B?dnpUVWkvbmh3ZmxtTTBtbUVHMGNaRlFad3VGMEJ6T0pOd3hNeWpobEtRVDdQ?=
 =?utf-8?B?Q1N0TFdrUEt2eW85aUt2d0FQeFcxZ1NBZHRPWnlDWDNXRG1lSzFvc21PUmpJ?=
 =?utf-8?B?eWVRN0FlZVBSenBETDUveVAzMUNhUTZXNjA1UzNEVzhyQXRlU3lXR3Z0ZTV3?=
 =?utf-8?B?c0tyd3BCdXFXVTUrV1p2ZVc4SjFlZksrREZpbXQxemdrYlVueW1aZGp3aTha?=
 =?utf-8?B?aVZnWlpvZ291NTJnMDNIUlZVaEtmR1huMGV5TnY3WXlQOGw2eUZISTBOWE0y?=
 =?utf-8?B?UU14cWFwaUJ2U0hlNlFZS0IzeTNYamxLYXdDRUtPVzBXd0U3dlBEZFI2dXpw?=
 =?utf-8?B?bkY5NFhRVjZGM2ZQNzR1UVJlTWRsQzJRVEhGenZTSk1Ia2hjeTFwMjd0M0lU?=
 =?utf-8?B?dXVEL0wvN0pHMWdHRkVoYUwvM2xPRS9HZ2dEMmtrNkZSNmlCcWhiVFRUMHdz?=
 =?utf-8?B?aVd6SXJtZndKdkNRUWtNTmEweGxVbDRKZDN3QkdMTlo2UDREcTNhSGUxb2o4?=
 =?utf-8?B?dWJudHdZcVFhdzRNM1h5TklodlgvS3lua1RMcy9vTWI2RGRPZUVkK0lFUWJJ?=
 =?utf-8?B?QldiMTRsZVkyK3ZVTnJuNjhjQkIybDlIVnJ4aXhpTWFlOHRPVjRqeDV1dGE0?=
 =?utf-8?B?Y1VuMk1GSlhHRWh3ZnVEbGhML1VxdXdNclZFemhhcVRkYy9VWnpUZkt3OXVw?=
 =?utf-8?B?ZlFnWHBWaUhGbnlMc2pyRjVvRy8zVGtWUDVoK0ZoeGxTTTR1L01TM1FTRDUr?=
 =?utf-8?B?UXJkTFJrZ3JsKzZUZWRiS1hDcDJ6SVM3Yk83eVFZL0M1OXNabkVsY3JNYXZ3?=
 =?utf-8?B?TUl5REhHWmFURGh3MTFSeVlrM3N0Z01rNndBN2NNTFhCeE5uaFpJM085VURi?=
 =?utf-8?B?RW1yT1d5VDUvTjR2QUpDVXJETG96Sy90UVY0ZUJ3QXpEdTdLOTRNTG9IYy9u?=
 =?utf-8?B?YkhXUTlnT3NmV2NyQnFwdmwrTTZlcXRWQlVZaVZLZmNhSXc5ZGZSTlNMZmJH?=
 =?utf-8?B?RStxS2owMElTWS9RQmwxQVZWaHh6TjhkS2ZFYzhwK1MvV3N5dG1qYnZlcHdo?=
 =?utf-8?B?eFE3dm1EOHZVdmdRUDZKSUJLQUlvZFJ0c0J0YXdLNnB5OWtwYkw0Mmw2dmlK?=
 =?utf-8?B?UUdubURCYXgxM1B4cEdiNll2N3YrL2tZZmFqRS9kaWpqODAzMVFHMnI0aWVC?=
 =?utf-8?B?eW01V2VBNTNBYmlvWnU2S1FpU04rd0NGTGV0L2QyV0I3QUJNNkF4WVlTYVNu?=
 =?utf-8?B?T1pabVBUKzNIWXNaN2tGVzZ2WFVNSDVmRVhFMWZTcmVjcjJaZzVOd09uL3hr?=
 =?utf-8?B?Tm9LR21ESTZGZUF0dVJsSXJUWFU1Tm9aSmt0QW5MYkFDbVhYVGFFbFBRaHdG?=
 =?utf-8?B?TlU4V01HMTJmZGxMRjlieC9LRTJBaStjTlloVmNBWUlkcjhkS3lia2UrZDNE?=
 =?utf-8?B?YXpvL2FCM040WGpJOUpOQUVoaFJSM09HM2wwZ1lxdHdZNVFCdnQrMFdHenRO?=
 =?utf-8?B?OS9TazIyaG9KYUhHS05KZ2pkQkVaTk5CRnI3bEJDcURaSGJVZXZRazdMU0Mr?=
 =?utf-8?B?M0w3Lzcrd2w4c0dZelRYRzRvOVZjN0pkdzVDZkdnRGdlZnNtNmJWQ1lNOGkv?=
 =?utf-8?B?eWlUMkRRSDRmMENERjIxaXJWMHNlVEhkVGpsTXA0Um40MUdDdzVwVENVT2Nm?=
 =?utf-8?B?MmtHejVCOXRYdjRXSGo3Zz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 67717d43-c7c2-49b9-4aef-08d8d8be8a9f
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2021 12:20:15.5171
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6JkzcORD15gsrdwBG6e3MBseHmJ+GpaOFTK9khY/g2hHEhEutW5s93nTX4bVTDzHP7ks9DCNYV4zym1lJwuakA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB3371
X-OriginatorOrg: citrix.com

On Wed, Feb 24, 2021 at 12:11:45PM +0000, Andrew Cooper wrote:
> On 24/02/2021 10:26, Roger Pau Monne wrote:
> > Instead create a private types.h header that contains the set of types
> > that are required by hvmloader. Replace include occurrences of std*
> > headers with type.h. Note that including types.h directly is not
> > required in util.c because it already includes util.h which in turn
> > includes the newly created types.h.
> >
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> At what point do we just declare Alpine broken?  These are all
> freestanding headers, an explicitly available for use, in the way we use
> them.

The headers are available in Alpine, but they seem to be specifically
tied to the native bitness of the OS, which is causing us the issues.

So they are freestanding AFAICT, it's just that the bitness they use
is not portable.

Thanks, Roger.

