Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C61B36F83A
	for <lists+xen-devel@lfdr.de>; Fri, 30 Apr 2021 11:56:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.120439.227764 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lcPsQ-0001Ik-Lq; Fri, 30 Apr 2021 09:56:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 120439.227764; Fri, 30 Apr 2021 09:56:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lcPsQ-0001IO-Ie; Fri, 30 Apr 2021 09:56:02 +0000
Received: by outflank-mailman (input) for mailman id 120439;
 Fri, 30 Apr 2021 09:56:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jCGG=J3=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lcPsP-0001IJ-R8
 for xen-devel@lists.xenproject.org; Fri, 30 Apr 2021 09:56:01 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 043ad108-a3f2-4afe-86f0-0426a93b6643;
 Fri, 30 Apr 2021 09:55:59 +0000 (UTC)
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
X-Inumbo-ID: 043ad108-a3f2-4afe-86f0-0426a93b6643
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1619776559;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=kuOf9la/IxfIMrrBEUp69vNwMJLJDXBi6L1PeCOtS5I=;
  b=W15xx05ATB4Pvo/MUDWY9sCzg7QMlC1koMS8ojQMi9BxLx/ONGABrLhR
   1DWqYrBcVxGHIVe3m9bWso2t647YUjkwHpx9dSwYck+KipsFyhjvOVSaW
   cs6YlVFHorkEHT7u96efPPWypQWcKgCjitRcfFTabNMxy75O2VawRGwBp
   o=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: tPyNNSaIr4QEGJ0pMs2X7zbCyT6AiRqS/Vm1amKplXTT6alQk5dKv14K3YIHEV/BwggRFbCAcH
 e7/Cp6dAjp4QMF4MDXMHjnA2rWfRWXKnLirPP118Qy3s7gEFzljiw9HtlV16I4dAUR7ylP3p2Z
 TljYzvE/ocfNaghlcn+/670Zhqyx2QFfcRSeiGrAIhFCv9Hqv/vFaTyRN7YBBXKW0drRORfg1m
 dnB6SC+t7+ycWkrgH9RoVyniS24F+WYofpwceTVL7mQJn/iI/8tPF2B1234JWKwRCOHqcMGTDD
 lkg=
X-SBRS: 5.1
X-MesageID: 44301502
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:JOiXxarfMs/ewVfvflXw4GQaV5u6KtV00zAX/kB9WHVpW+SivY
 SHgOkb2RjoiDwYRXEnnpS6NLOdRG7HnKQb3aA4Bp3neAX9omOnIMVZ7YXkyyD9ACGWzIJg/I
 9aWexFBNX0ZGIWse/T/BS4H9E8wNOO7aCvgqPkw21wSBxxApsA0y5SIG+gYypLbSNBAoc0E4
 fZy8pcvjy7eWkWaMPTPAh+Y8HoodrXmJX6JSMXHhJP0nj0sRqEyp7fVyKZ0BAXTi9Vzd4Zn1
 TtvgTl6syYwpOG4zDG0Wu71eUypPLAzZ95CNWImowpLFzX+3uVTaBAf5HHgzwvuuGo7z8R4a
 jxijMtJd565X+UXkzdm2qV5yDa3Dwj62DvxDaj6BOJy6yJJ0NIN+N7iY1UaRff4UY71esMqJ
 5j5G6Fq4FRSSrJgSWV3am3azhRikG2rXA++NRj6UB3bI12Us40kaUvuGlREJsGARvg7pEmHO
 REHKjnlYlrWGLfQHbDsmZ1xtuwGlw1AxedW0AH/veYyj5MgRlCvgYl7f1auk1F2IM2SpFC6e
 iBGqN0lItWRstTSa5mHu8OTea+F2Sle2OBDEuiZXDcUI0XMXPErJD6pJ8v4vuxRZAOxJwu3L
 zcTVJxrwcJCgPTIPzL+KcO3gHGQW27Uzio4NpZ/YJFtrr1Q6euGTGfSWopj9Crr5wkc4Pmcs
 f2HKgTL+7oLGPoF4oM9Rb5QYNuJX4XV9BQlc08X36Iv8LXOqznvuHWa5/oVfnQOAdhflm6Lm
 oIXTD1KskFxFusQGXEjB/YXG6oWkGXx+MzLIHqu8wojKQdPIxFtQYYzX6j4NuQFDFEuqsqOG
 93ILbtlLKHtXC7lFy4qllBC154NAJ48b/gW3RFqUshKEXva4sOvN2ZZCR00GaYIAR8C+fbCh
 RWqVgy2a/fFe3e+QkST/acdk6KhXoao3yHC70GnLeY2MvjcpQkSrA8WKJwEg3PPwdvmRljrV
 pCbANsfD6eKhrezYGeyLAEDuDWcNdxxC2xJ9RPlH7ZvUKA4f00SmAjRD6oW86PiQMITz5Z72
 cBt5M3sf6lo3KCOGE/iOM3PBlpZH6MCLxLNgiDeb5Zg6vmYg12UGeMiwGLkh1bQBuby2wiwk
 jaaQGEc/DCBVRQ/kpV1avn63tYXGSQdUAYUAEzjaRNUUD9/lpj2+6CYaS+l1aLYlwZ2+cHLX
 Xuej0JOD5jwNixyT+YkDuPDm8d250rJ+DRZY5TNI376zeIEsmlhKsGF/hb8NJZL9joqPYMSv
 /aVAmPLj/0YtlZrDC9lzIAAm1Tp3Ylm/+zh0Ggw2i8wXIlAf3dZH5hXKoWJtmA727iA9aEua
 8J+O4djK+VCCHWbNXD9IT8KxhkATnXqXStT+4ppYtP1JhC/YdbLt3+a3/wyHpD3B8CN8/6m0
 MVfbRj7Nn6S/1SVv1XXxgcw0Egm9uOJnY6qwDaAucxelc2kn/QVun5l4bgmP4KAkebohH3Nk
 Ta2ypB/+3dVy/r789QN4sAZUBXYlM78nJs4aercJDREhyjc6Vm8EChOnGwNJ9bR67tI8Rbkj
 9Kp/WJlfSQbSz2xUT5uiZ6OLtH9yKfevyJaTj8b9JgwpidIlSDgqyj/c61gnPWcFKAGjglrL
 wAU1cRYMRFgiQll6st3EGJO+rKnn4=
X-IronPort-AV: E=Sophos;i="5.82,262,1613451600"; 
   d="scan'208";a="44301502"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dSp9XmlDhFAKfvg9qfcQeQ5XN/OGveX9IU22DhYYtB2rHB2vsjr22ue0viIeg0SSLq3OA5xnbj/JaPEwqTxlIHMoc1yWV+HCjwKXHE7BbE81HV5+31TEotHfvxZKUfADfThm6YLLfMNgrKZiR2T6u8jx36GSBD73eYVFh4JyByM+7qpNo/zeXLx03R1/JsJMNw5zV4ocQrXT2ce3fAbxJLYItIeGb1GIkoBH7NFeWJbaqg4v7djuRO2P4M5kfn2WYMhKQsA6AT+Cf2WcYFt0vtbXhnLRt8ABqaFqIb+3WD72LqrhGEcrIG1KjgytvfEKZTNd+nZbS7AV7XjAS3wESw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UhrOKO1pJ0GlrFmkPhTE+RRD16OA/UsRDTxlz5xPP1o=;
 b=RNdruhn5i+V0RV4A2z1RaQg2LYkfUqae1y3ZTQ/XEv5DQ2QGD6+vKmjYMXcbdJVTh0QWM6fGRT/UU+rhs1DWrU/4uZdUarpIz+htO4Rb4A1/YvKz0W9xjkexUaJEDo0a/IfWpzX1GkHveSBj+/2CbKSQ4WHY1d6k5Js07wG8VZbVsWws9t2idkELdOp2EmwlHh4hXYbuJH7aW0x7Qj1ObNO5JmIz8Ff/KAw5USp66PyCylWtmMwSC6+uiYMQbNLdntoUjcmarHSbDMX8SiKqK0X9xUA50pMHaW3331W9ZOgZbvIA+TsZ7wxb0QLvvOo2VFmaUwl3/3mmP3IyD06kNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UhrOKO1pJ0GlrFmkPhTE+RRD16OA/UsRDTxlz5xPP1o=;
 b=qazRxvihrxLDggRv0WxX/CpyZRN2t6755NNG/BHSm3gZdy2H6z5P9Ay1eikQGyDBRyd3UE26fD1K5RNYTdBrZ/fjYhPFw/0JDqFeOMqAzzRpn14oXJDdfgP7CnNax5cn8eC+Z0R+Vu78uMr1gzVXdz6s29iMoX4vJugquGIIkcA=
Date: Fri, 30 Apr 2021 11:55:50 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Daniel de Graaf
	<dgdegra@tycho.nsa.gov>, Paul Durrant <paul@xen.org>, Tamas K Lengyel
	<tamas@tklengyel.com>, Petre Pircalabu <ppircalabu@bitdefender.com>,
	Alexandru Isaila <aisaila@bitdefender.com>
Subject: Re: [PATCH v2 09/12] x86: make mem-paging configuarable and default
 it to off for being unsupported
Message-ID: <YIvUJqtdsOLia8nc@Air-de-Roger>
References: <3cf73378-b9d6-0eca-12b6-0f628518bebf@suse.com>
 <26dae9ef-5fcb-f806-059d-7cdd2974ad40@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <26dae9ef-5fcb-f806-059d-7cdd2974ad40@suse.com>
X-ClientProxiedBy: MR2P264CA0161.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:1::24) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 17c5aeb4-ac50-4af2-e1de-08d90bbe25b2
X-MS-TrafficTypeDiagnostic: DM6PR03MB4762:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB47629C43DB7664D85168432D8F5E9@DM6PR03MB4762.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HdB9smfNXhQEtnJ9miHHxFWjqFZjPhoxRhJvXbokj49wJhtuK9CRQ9ZlTMH/aMOkNQoU4iHYA1HHakQSrJwJwvcg5bz5Q/9C4rj9lZEmDRE/ArDLtra3tI2EeFP3yX9wrqePNUB4Ml5jJnUvLB60MMZNIeJVU/sCYyjcm+bZTfYCz4U1xTH44FDv3x1CIuhWbSSxNBKM6NRm8ZgjcnovSdq45k7dzFh9blfxiCOwDiW3kKiBVPiDfubWgUxXlXi+UG8Isc4CWdpysieN8vqUSae9K+HEjJQtNFDja1XxzC7+yhXWWX8M6WAZ9HD9OBP182RGRat1aSkZgTxxs0N4M4RIa4CWkGDtldz63eKLErBMMz6/adtq4QR+PZ+jqSM0VrRjy2wD3258KKC5SYfFIx0WtyBiVezh3zST7wR+vyeCn6gDYUvgqaWrk7w189q/ZBp0GyA9voOB02tX2OYGOUco/bH+6q1wAQw5mTAVG34WIVDRBZhoNKPEYztTawTSQJW/LTyzEODyzjikKVuzoUTOodbNSavZ/U6vAjzPt0nq19pdytn3EbTIqKUA0frfyDnDD4dSk70wyRtBykbOI1if+Tfbr2YI5K+6fhSZxAw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(376002)(366004)(136003)(39860400002)(346002)(396003)(8936002)(8676002)(7416002)(54906003)(4326008)(2906002)(956004)(6916009)(6496006)(26005)(38100700002)(86362001)(66946007)(316002)(186003)(16526019)(66556008)(478600001)(33716001)(83380400001)(66476007)(6666004)(5660300002)(9686003)(6486002)(85182001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?OWN3ZXpvdFFJRE8xcFhONDk4Nks3bE1qQisrank0TzVocjJmQ3dqaTN2aWxy?=
 =?utf-8?B?ZWtjcWx0M2xkdVhTNGdPODZQSkJ1T1doS25xN2pUNXJjbVpmNW5yK2I2aDRo?=
 =?utf-8?B?NUlxQ0FNYkFkQld4SjBMWXpvNHk5ODdHaWNBY21BbFlaTHZnUE93TG81RFpx?=
 =?utf-8?B?ZkRrdnIwc2cvL2J6Um5PZ3VSenE2UTI2THVlQU9tbHczRkJUTGl6M1pLRW5w?=
 =?utf-8?B?RWhKZkxkSUN2a3lDTjk3TnpJY2VLOGlqMXpIUXY5SlM3RXFwdU51MlhMNlZB?=
 =?utf-8?B?OE9xRlhLWHA2MlB0OEVQOTM4Z3YvN1hwRit3MDNIRTNJM0s0bHdIV3Z6bXhp?=
 =?utf-8?B?Wk1Pbk14RjNMZkhtZUs5YUJZV3AwbE5vbmhobUg2b2R3NDIvRFNsQUM2Q1hr?=
 =?utf-8?B?Ynp2cTE0THdrTVZZeEczemZPWC9lR3NjK1dZQWk5SVFqMUQ0MGhHZlJWT0F0?=
 =?utf-8?B?M0tIdVFyRk5xTS9XSFMyVm10NEdrWFJtS1JJWStmdUJqdWl5WExScHNMSmRM?=
 =?utf-8?B?RlVYVTNsbUJZbnZhVWNFdUtiMGgrVlNHcU1aRDdzWEZqYVdXdEppN091c1JW?=
 =?utf-8?B?aDRBbWV5NUZncVJWZmJRRURVVlBTVnd5SmJPRkRJeUVoVnBPN3dwdmRxRWdG?=
 =?utf-8?B?NHNhcUxpNHIyL3JZaGhJR1dEVGg4Q0JsUUFUMXYrRFFEWVVuOE9YdGkxUEJL?=
 =?utf-8?B?dXdPaUY4UG14UHZoT0pHMjl2dENKdHIzN0xTTyt3U0pEcHNQUytFZkRMNGpp?=
 =?utf-8?B?UWpzZ0wwK3pGYmxFekRTVENpckQ5cUUzZTNMZWRjOFFZT3VROEtEMU1vZGFi?=
 =?utf-8?B?dnB4My9iV1V6a1JRaGhBLzE3R0J0RmM5TkdlalczYjg1N0ZraTU5am5hSmFW?=
 =?utf-8?B?dDdKZGN6MUxGc2hVM0x3eHRiMklRNUcvMXRPUWNwTGhUeDdYQ0FPNWVDUGwr?=
 =?utf-8?B?ejZTWExZSkVydENZd2MwUDNNbG9XbnkvMWRiRERyNytNZnpnL2F6TTI4K3Ux?=
 =?utf-8?B?N0ZFSHBodGxJbFZnaHN5Z0owTTZ3VFIvZXVOV05BNStndzVWcU9YclhPRUVQ?=
 =?utf-8?B?WGlFeXZkbFVUM2V1Y2N5UjFUemNrSjRiYjdnL0E5d2dKMUtYSWpFbWRmd0Jx?=
 =?utf-8?B?K3NSbmkxK1piSkRtTnE5VnVpK1VBY2ZlU2s4WHNrSVkzNDdyVmdTZ1NDYWpm?=
 =?utf-8?B?Q0piMFk0NW00dWdOeUF6ZytsK3dFNExRK2loaC9WWWZaSTNxZHBWaVVJUVdi?=
 =?utf-8?B?WXZQSVBMdzVRM0VhbWFVdkJMNDdsN3U0WFJqNkRQQmZrTVVVSXZqRUdFN0hB?=
 =?utf-8?B?SFhOTHQ3NkxVOWwxYThJV2h0Y0tMSmtTQ0ZPRkVnRkdrUXRzdmhmRUNBbUIx?=
 =?utf-8?B?UDZEYVJpaDdCZE56UnlaSmdBWHRXUXBOMGtNWXFZdTlrZTJ1ZUc5cFhUK1hx?=
 =?utf-8?B?NytjNjd5K20zTFBFdWtqdm0wNXRkQUprV3d5VWhyVEU1ZWM3dHM1TFFzU2Rt?=
 =?utf-8?B?SFkwWXZNYnNHVHg0aWtBUkFzYnJsWWZtdC9YbmpkT1JPL1EzVTRwaXdheVpU?=
 =?utf-8?B?VlpjRzRLYkxKckp5WW5IaFdXMzlEcFRqVENJOFEzWkJyb0ZOLyswbXd4Q29R?=
 =?utf-8?B?OGFKRUcwa0UrdU1HaGk5TmMySWY5YVc0UmF1Q2JrN2RVZmRiMzhvNjlGK1JM?=
 =?utf-8?B?VWVPN0JwaG8zUklheStkTENpZmRNNkR6U3libVUxRmVXYnl6enJ0ZngzcTdl?=
 =?utf-8?Q?zKTQ6tdUtmwPL/Jp0ZVG9pt/dftIJ9bQuKelKTq?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 17c5aeb4-ac50-4af2-e1de-08d90bbe25b2
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2021 09:55:55.8367
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 97YzYMmb2EinZvxblVBieDtbxn9oKhA7LSSUE2Zdw+VUzrFIadao+Z8Od/Fg8FnS4qa29dLrgoqvFq/pMLeiQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4762
X-OriginatorOrg: citrix.com

On Mon, Apr 12, 2021 at 04:12:41PM +0200, Jan Beulich wrote:
> While doing so, make the option dependent upon HVM, which really is the
> main purpose of the change.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> v2: New.
> 
> --- a/xen/arch/x86/Kconfig
> +++ b/xen/arch/x86/Kconfig
> @@ -15,7 +15,6 @@ config X86
>  	select HAS_FAST_MULTIPLY
>  	select HAS_IOPORTS
>  	select HAS_KEXEC
> -	select HAS_MEM_PAGING
>  	select HAS_NS16550
>  	select HAS_PASSTHROUGH
>  	select HAS_PCI
> @@ -251,6 +250,10 @@ config HYPERV_GUEST
>  
>  endif
>  
> +config MEM_PAGING
> +	bool "Xen memory paging support (UNSUPPORTED)" if UNSUPPORTED
> +	depends on HVM
> +
>  config MEM_SHARING
>  	bool "Xen memory sharing support (UNSUPPORTED)" if UNSUPPORTED
>  	depends on HVM
> --- a/xen/arch/x86/hvm/hvm.c
> +++ b/xen/arch/x86/hvm/hvm.c
> @@ -1932,9 +1932,11 @@ int hvm_hap_nested_page_fault(paddr_t gp
>          goto out_put_gfn;
>      }
>  
> +#ifdef CONFIG_MEM_PAGING
>      /* Check if the page has been paged out */
>      if ( p2m_is_paged(p2mt) || (p2mt == p2m_ram_paging_out) )
>          paged = 1;
> +#endif
>  
>  #ifdef CONFIG_MEM_SHARING
>      /* Mem sharing: if still shared on write access then its enomem */
> --- a/xen/arch/x86/mm/Makefile
> +++ b/xen/arch/x86/mm/Makefile
> @@ -5,7 +5,7 @@ obj-$(CONFIG_HVM) += altp2m.o
>  obj-$(CONFIG_HVM) += guest_walk_2.o guest_walk_3.o guest_walk_4.o
>  obj-$(CONFIG_SHADOW_PAGING) += guest_walk_4.o
>  obj-$(CONFIG_MEM_ACCESS) += mem_access.o
> -obj-y += mem_paging.o
> +obj-$(CONFIG_MEM_PAGING) += mem_paging.o
>  obj-$(CONFIG_MEM_SHARING) += mem_sharing.o
>  obj-y += p2m.o p2m-pt.o
>  obj-$(CONFIG_HVM) += p2m-ept.o p2m-pod.o
> --- a/xen/arch/x86/x86_64/compat/mm.c
> +++ b/xen/arch/x86/x86_64/compat/mm.c
> @@ -155,8 +155,10 @@ int compat_arch_memory_op(unsigned long
>      case XENMEM_get_sharing_shared_pages:
>          return mem_sharing_get_nr_shared_mfns();
>  
> +#ifdef CONFIG_MEM_PAGING
>      case XENMEM_paging_op:
>          return mem_paging_memop(guest_handle_cast(arg, xen_mem_paging_op_t));
> +#endif
>  
>  #ifdef CONFIG_MEM_SHARING
>      case XENMEM_sharing_op:
> --- a/xen/arch/x86/x86_64/mm.c
> +++ b/xen/arch/x86/x86_64/mm.c
> @@ -994,8 +994,10 @@ long subarch_memory_op(unsigned long cmd
>      case XENMEM_get_sharing_shared_pages:
>          return mem_sharing_get_nr_shared_mfns();
>  
> +#ifdef CONFIG_MEM_PAGING
>      case XENMEM_paging_op:
>          return mem_paging_memop(guest_handle_cast(arg, xen_mem_paging_op_t));
> +#endif

I would create a dummy handler when !CONFIG_MEM_PAGING in
asm-x86/mem_paging.h.

> --- a/xen/include/asm-x86/mem_paging.h
> +++ b/xen/include/asm-x86/mem_paging.h
> @@ -24,6 +24,12 @@
>  
>  int mem_paging_memop(XEN_GUEST_HANDLE_PARAM(xen_mem_paging_op_t) arg);
>  
> +#ifdef CONFIG_MEM_PAGING
> +# define mem_paging_enabled(d) vm_event_check_ring((d)->vm_event_paging)
> +#else
> +# define mem_paging_enabled(d) false
> +#endif
> +
>  #endif /*__ASM_X86_MEM_PAGING_H__ */
>  
>  /*
> --- a/xen/include/asm-x86/p2m.h
> +++ b/xen/include/asm-x86/p2m.h
> @@ -136,11 +136,16 @@ typedef unsigned int p2m_query_t;
>  #define P2M_PAGEABLE_TYPES (p2m_to_mask(p2m_ram_rw) \
>                              | p2m_to_mask(p2m_ram_logdirty) )
>  
> +#ifdef CONFIG_MEM_PAGING
>  #define P2M_PAGING_TYPES (p2m_to_mask(p2m_ram_paging_out)        \
>                            | p2m_to_mask(p2m_ram_paged)           \
>                            | p2m_to_mask(p2m_ram_paging_in))
>  
>  #define P2M_PAGED_TYPES (p2m_to_mask(p2m_ram_paged))
> +#else
> +#define P2M_PAGING_TYPES 0
> +#define P2M_PAGED_TYPES 0
> +#endif

Since you don't guard the p2m related paged types in p2m_type_t is it
worth having diverging P2M_{PAGING/PAGED}_TYPES?

I guess it might be required in order to force the compiler to DCE
without having to add yet more CONFIG_MEM_PAGING guards?

I don't really have a strong opinion on whether the code should be
removed, IMO it's best to start by making it off by default at build
time and remove it in a later release?

Thanks, Roger.

