Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D62F39436B
	for <lists+xen-devel@lfdr.de>; Fri, 28 May 2021 15:32:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.133923.249426 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmcab-0003fT-8r; Fri, 28 May 2021 13:31:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 133923.249426; Fri, 28 May 2021 13:31:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmcab-0003cr-5b; Fri, 28 May 2021 13:31:49 +0000
Received: by outflank-mailman (input) for mailman id 133923;
 Fri, 28 May 2021 13:31:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WKFi=KX=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lmcaZ-0003cl-7s
 for xen-devel@lists.xenproject.org; Fri, 28 May 2021 13:31:47 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id dd6dd223-130b-40ec-a9a1-4f0be38b0e18;
 Fri, 28 May 2021 13:31:46 +0000 (UTC)
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
X-Inumbo-ID: dd6dd223-130b-40ec-a9a1-4f0be38b0e18
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1622208705;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=XAyMUqU7ZwznyIIqeZ7k/AkSOQ20qZfN52rezn8JFek=;
  b=bEUtWnsPcOe1W4OqkV1sQmkB8+Ot0iecV9g3yQe+JpZk8Dj8mvu52/p9
   GrCjizi/zFqbQym31vivOqOvfcAnXZKuzoXd0bSNTQk+pPzb2ycAkrqK7
   7+NUttrbHlfGXo1hcQ0uI3Daz2UlLV28mycKUqOxqYgst+qlr1CezhHDX
   o=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: KQsVnlpdedQbr0Pdykprs09289PnzOa5nqUyFGy9XfzvibrsiVvlKMHR0CeOykEMLS9nzk52sA
 oB05VajYgnZUU7oNUXLzoDeQrKgoQUa65fUgU18p2u5gEiz4asHO6kP5VidtYc1c7ZAqUTkTzw
 UaW/KNAau99Ewm7bxe4F8Qzj2Bb0cCnYIion0wOrJCBY+fBpmNQsz6PsRUM0q+xXE9e/XKKj1w
 9dzyFdOp5/eQnfLYtqus/tHhQsucStOVzxz8whGoaTPy4MORBpjWYbwQFEbgK625s8i8FgQBlr
 Tio=
X-SBRS: 5.1
X-MesageID: 44611574
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:tC4+Va+irC95sM3rqetuk+E3d71zdoMgy1knxilNoENuH/Bwxv
 rFoB1E73TJYVYqOU3IXOrwXZVoIEmsi6KdhLNhW8baYOCIghrSEGgP1/qZ/9SYIVyOygcF79
 YRT0EcMqyOMbEZt7eD3ODQKb9Jr7f3k9HL9IOuqEuBVTsLV0gH1XYFNu5gencbeOAvP+t7KH
 P23LsIm9PPQwVqUixubkN1LdQq4bfw5d3biXltPW9q1OGQ5QnYo4ITAnCjr2Qjuy0m+8ZWzY
 HwqX262k3C28vLjyM03VWjp6i+1eGRmeeqQ6e3+5MoAwSprjztSJVqWrWEsjxwivqo8kwSi9
 XJow0tJYBa7G7QZHi8pV/W0QHm+jAo9nPy1Daj8FveiP28YAh/J9tKhIpffBecwVEnpstEy6
 5O33iUrd5+EQ7AtD6V3annazha0m6P5VYym+8aiHJSFaEEbqVKlJcS+ENOHI1FND7m6bogDP
 JlAKjnldlrWGLfS0qcknhkwdSqUHh2NAyBWFI6ocCQ0yJbhjRQ01Yf68oFgH8a+Z4xIqM0xt
 jsA+BNrvVjX8UWZaVyCKMqWs2sEFXXTRbNKm6JZXXmDrwAIGKlke/T3JwFoMWRPLAYxpo7n5
 rMFHlCs3QpQlnjDc2V0IcO1AvMTmW7VTHGz8FT4IVYg5XwSaHmKzfrciECr+KQ59EkRuHLUf
 e6P5xbR9X5K3H1IJ1E2w3lV4MXEGIZWsEOoNo3H3mf5uHMNpbsvunad/i7HsvOLR8UHkfERl
 cTVjn6I8tNqmqxXGXjuQPcX3P2dla6x7hUeZKq3NQ7+cwoDMlhowIVgVO26oWgMjtZqJUscE
 9/Or/81p6hrW6t5GDS8lhzMhVTDkxp8KztOkk6iTMiAgfRS/Iuqt+fcWdd0D+sPRlkVf7bFw
 ZZuhBe5b+3B4b4/1ELN/uXdkahy1cDrnODSJkR3oeZ493+R58+BpE6HIRsCATwEQBvkwoCkh
 ZrVOY9fD71KtrSs9TysHVUPpCJSzBEunb+HSYTwkiv8nl14qkUNykmtz3Ha7/Ive5iLAAkwm
 GZvZVvqoZpNF6UWDECad8DQQRxgVKsce175TS+FcNpc4/QCVlNpB+x9EinYjEICzvXHhYp9z
 zcxRP9Q4CXPnNt/lYDjfrNzG4cTBTAQ6vbUAFfjWQ6LxWShl9DldaRYKy9ym2QbUZH7N08HV
 j+EHYvCzIr/suw0hGNnjaECDEB/bUBesLgLJlLScCY5puKQLf41Z3u28UkvaqMabjVw5g2uf
 r2QX7iENviY9lZkjComg==
X-IronPort-AV: E=Sophos;i="5.83,229,1616472000"; 
   d="scan'208";a="44611574"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hc/ySrG0N7SzpgmEn6NKszuQ+5stpGvCQG6hXhx29a/+c21Nd4QnY3B8MU9YMqtTGXX5RvycYY+UILRldsItPu1eVP0SflqdxwV8WZvhMZmZXs+gHm+oWax3vtE+00Qj25gFRrOMCcC2QPjYn1EFSTMzgkiqCsP5sMHi7rs8GwqgwEc14rjM9P2/pO4xSscoQyjAaLfUC8jaO5TN4joC3ZSQ5OGO/S/C/6svt/TlOqr0Vxhnw9LQwZ8SGskrpzf7hCilT9HaMthXHGK50541Mn8ju/934oTerpU1YAGbBzwblXLMiuvqAJCbdEwX1atShbcEpK/9gVpiWJSrQ+CjGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5GYo8kOOcdZRaw88SL3GvBsnx9iPp+rZg/kwed91s5g=;
 b=aABXR9SzHfwID4yhyg0akga9jwgVyNIFMJ67EIBgFqR3qnVG4TD5XmmJz4eqauXZrfVhv72uRJY9ErqegcqbcSi4TQ0RGj1cp/PJp4FLttdim3ks4sqlZSKh5ACKqDI8JrVHEA667d1j8iahGW4aidWWWQl0v1+xeURzMGJE12L1mMX9tG6INGQPODtLb6kUmRyce57xUr6EAzDXzf3YQ/+a9g+dXb7QXTZWhzkdNLPOpC138US6iEPsyb+saj6skid8IjuHi3k6qsNzK2/bcv0V9GMzuxi7jpf6rKsZ+LV359YrWdQxPalSXwc0jGm9tlz0nvARKx1pSHyOALbCnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5GYo8kOOcdZRaw88SL3GvBsnx9iPp+rZg/kwed91s5g=;
 b=FElOBdxX16+W/tf2s01cIA5jqQsc/Vb2mWuSN7Le2TnsZIgc/VuSAHKsAzqtIQz/Vg4qDeAzBSsu9xXw7PpSe9EjJz/Ej5TiJh26gNaPgDcMPTXaqugvNRsAuli1fIOrdJ1DqCuwxZP+LhJeGvrGnpMr8diw8OCnX+8j5rWaZiQ=
Date: Fri, 28 May 2021 15:31:37 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Julien Grall <julien@xen.org>
CC: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Wei Liu <wl@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>
Subject: Re: [PATCH v6 1/3] evtchn: slightly defer lock acquire where possible
Message-ID: <YLDwuQrJsYU9PAFT@Air-de-Roger>
References: <01bbf3d4-ca6a-e837-91fe-b34aa014564c@suse.com>
 <5939858e-1c7c-5658-bc2d-0c9024c74040@suse.com>
 <938eb888-ec15-feb1-19f7-b90dfee822ae@xen.org>
 <YLCqQz9xS4HEpabG@Air-de-Roger>
 <27d54d81-bec8-5bc7-39cd-60e9761e726b@suse.com>
 <079f2f2a-0797-b650-ff47-7e595ab29589@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <079f2f2a-0797-b650-ff47-7e595ab29589@xen.org>
X-ClientProxiedBy: PR1P264CA0031.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:19f::18) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 82f3c8d2-079a-428b-552e-08d921dcede7
X-MS-TrafficTypeDiagnostic: DM6PR03MB4841:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB4841E4C3CCF0C9B641D9F5148F229@DM6PR03MB4841.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LUY1qQKsG6m0UQGEhWJ1FaV1TFwMlxfxyR9ftAiI6UZJ2J+BwHtdE4e59HVZqx7lWcqZ9ay6mslwIFsfGAzOlU5dct7hvSpilu7RyVfDB003PLy732usHMlFA+SAUz/b80mVOrEyV2AiZ2OdQ96odZL3lFW8dVdkPNNqARmjcqTFKgOQFHOmvGfzChMVIh0N1tqGqSLrKHEfbphpn7VE9YKIjAqNt8hHamNTvJUfuuRudjOyhoyAv+S0wD9pcIxfqBTBsOL/K24AX6hnrG+dfaZaL9Gv8KDdPzJWpRnW+tBpdtuAgR3KLDUUcEIkB1JOmfi6KLeTSEMy8aIf1cVgne8VEHV3Nf0F6DBA/CLPY68X0dCU3OA82fPzDTdpyE5wmUWHEgdVW8yqTQEU2Ks3Zq4t3OHixD0EGoA7kD5a7VUtHtJ/XAcAklr6VkBIhkPQIMW9sSC/e9SGxHhN6oMxvAt9w3j7EIiMUktCTDiUk8QEocwTzoWNrgPoa7LOdyPSUKzFZbEQyc9NhTRkJUvhpNZ5qDYTlOFKCXIwKUL5hQ05JMZSdcscVbCffk1YS9dm9KvIXsSi2YJzWd+LGJoVUXp92OVbRkPucRxqf9/TUks=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(366004)(376002)(136003)(39860400002)(396003)(346002)(38100700002)(66476007)(33716001)(5660300002)(66556008)(9686003)(8936002)(478600001)(2906002)(8676002)(4326008)(86362001)(6496006)(54906003)(6486002)(26005)(53546011)(66946007)(16526019)(316002)(6916009)(83380400001)(956004)(186003)(85182001)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?bjJqYm1vRWJFUUhzc0NpSFdFVWJocVplNWhCeUFHblJqendOeFlvcE1OTTVS?=
 =?utf-8?B?aUtUQ1F0dytqU1dZZTVjMW9nUTBrMU1LTU0vMDhnUnV1WXFtdGp2YVFMODRS?=
 =?utf-8?B?WkdtTFpObzlXOXJ1NEV1L3RET01oczBqR2gxOWVPcTYrU3o2NzdZNVVwdXYv?=
 =?utf-8?B?YTBxS1ppRzIrcEVQUjBCNC9RWUdOQTdwOHVJWGh2UnhLU2t6eWcrNGVYY0l6?=
 =?utf-8?B?T0FuWWpqaWNMQUozRnVzNUZ4dkFHbWJnNzBqeTVEdjBNUytPRnhGanNON051?=
 =?utf-8?B?cDlaaWtrZHdzNERERDNvWUhHaXdhU0x4b2k4L2wwbXBPaDF1MkhBWjVqNUtO?=
 =?utf-8?B?akkxM20xVjJRN3ZuTnpESkVpak1pOHNCeS9zcGlxUHNUMXpNVlN0c2x6MFRL?=
 =?utf-8?B?QzlteGkzakEybSsrZEp4d0xRYkptb21iNkNUb1dJb3BONkl0TkE4YmhacTg1?=
 =?utf-8?B?U0JEdGZRQ1liRDJpN3JEdCtGbFVaU0lVV215dHZTUDFJT1JSZndQTEorU3VN?=
 =?utf-8?B?T2FTY2JyenlKV3BIS0Yxcmd5dDh4VDNlZ2hSelF0MnBIaDNoMWp2UXFlV3FT?=
 =?utf-8?B?bDAzclV1N3RRTmdVSTF1K05aWGZQbnhudXdMTWEwOXUzLzlONXluWDVCNHY5?=
 =?utf-8?B?K2I1T2p1VGdUTnRpQk9MOFo0Sk5HdzhzZVk0bEpmZXBQKzA5MDF6cXFFajBI?=
 =?utf-8?B?ZTlkMHE1U3VFV2FmMjkvN2NaK0s2MFAxekM5ZXloMTN1SXpPc1kxQm1jcHZD?=
 =?utf-8?B?RXNzUytWaUtJL2dLQXdFbXp2cGdIcG5zcW03RVBoMFQ2a0JHMkw4TEdlN3BB?=
 =?utf-8?B?YjFwNG4zbEFobWFoVkJ2dGsxakVNWHFHSXBFQUJEZDhNU2NXeW1TUTBRK2ZX?=
 =?utf-8?B?ZSsybW9Dc3c1ZFdaekhYbWoxSFhZRlpEYUZuYlNPdm9tOVBhekUrMFBucnlm?=
 =?utf-8?B?OE5Jd1lOWEtTaVdjM0JobUdIcjcxVFJ5RWpHYUxrTFNCM2JSRjRBMStLWnVG?=
 =?utf-8?B?Vk5ERjZCTDFPVmQzTlo1YkhmMTRWM1NSMzRMTUlBVmxnZm9RTnlqQ0Q0VWZh?=
 =?utf-8?B?MWtoNW5FekV5Sk9NdXp1NWsrZmNoTHQ2TUc5UStLRHdmMVExclhTckxZUGVl?=
 =?utf-8?B?ZllHNnkxMjJ1NmFhT21XN1B5VUlTM09INFJLZFFYb2d5MmNuZ1M1ak1meFdV?=
 =?utf-8?B?aG9GU1IvVHVxdHNMK3NhT01XZ1UwYXlPR3F1ZGlBTW5IaWxEZlZVWk1wMnN4?=
 =?utf-8?B?UVZhUEU2ZURMMWY4RWpML2VNZ2hnZU5iU04yTm1uaEJxSGVrRnF3TjFBY3BQ?=
 =?utf-8?B?VFc3VVFva0VONE9Cc21vLzc3V0k1QVZmSHMwR25aQmxSbFhKN1p3RFBKM3Av?=
 =?utf-8?B?akVxMWJMU3lHSkE1NEptZ2JwN0RrNFh2RExRMmdvemV3R3pXSE11R2lYdVdR?=
 =?utf-8?B?dVdiWnd4QW50b1llRVhCaHkzSGE3RWo3dDFSRlZkSTJ2ZGk1TU84eTcybVdD?=
 =?utf-8?B?WVZGRkVwMFlUU2J3aWltSzUyNXBra2h3dk5vdHZZNjdNYUpYL1ZWdldGSXlY?=
 =?utf-8?B?QUhVWXZoanIwNittUC9wWVRva1ZXTWI4MjRXTFF0VnVYS2NyQ2hYbGR4NTdX?=
 =?utf-8?B?Tkw2YzdKTnI4b0JKcFRrSEFER3pUVFBQVlpkZG95REcvNmc1N0d6UFZmdjhC?=
 =?utf-8?B?ZzNFS0c4QlVFM3pEbFp3VE9ONWNNL1h3LzRub2RrcGNsbVFQR1lUUzhDYXFl?=
 =?utf-8?Q?M6uhu02S/1X5oT+4DSqEE+PIINAP3mjWRbZPvJD?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 82f3c8d2-079a-428b-552e-08d921dcede7
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2021 13:31:41.9728
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RfK1zCsWe5ltSnxeRe96CnEU4M4WTOLgqyN+EGsgHvC5XOzeBVALWPfNzHYy/XKj+Kp/AsEZ4QZLpV4ipQuEqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4841
X-OriginatorOrg: citrix.com

On Fri, May 28, 2021 at 11:48:51AM +0100, Julien Grall wrote:
> Hi Jan,
> 
> On 28/05/2021 11:23, Jan Beulich wrote:
> > On 28.05.2021 10:30, Roger Pau Monné wrote:
> > > On Thu, May 27, 2021 at 07:48:41PM +0100, Julien Grall wrote:
> > > > On 27/05/2021 12:28, Jan Beulich wrote:
> > > > > port_is_valid() and evtchn_from_port() are fine to use without holding
> > > > > any locks. Accordingly acquire the per-domain lock slightly later in
> > > > > evtchn_close() and evtchn_bind_vcpu().
> > > > 
> > > > So I agree that port_is_valid() and evtchn_from_port() are fine to use
> > > > without holding any locks in evtchn_bind_vcpu(). However, this is misleading
> > > > to say there is no problem with evtchn_close().
> > > > 
> > > > evtchn_close() can be called with current != d and therefore, there is a
> > > 
> > > The only instances evtchn_close is called with current != d and the
> > > domain could be unpaused is in free_xen_event_channel AFAICT.
> > 
> > As long as the domain is not paused, ->valid_evtchns can't ever
> > decrease: The only point where this gets done is in evtchn_destroy().
> > Hence ...
> > 
> > > > risk that port_is_valid() may be valid and then invalid because
> > > > d->valid_evtchns is decremented in evtchn_destroy().
> > > 
> > > Hm, I guess you could indeed have parallel calls to
> > > free_xen_event_channel and evtchn_destroy in a way that
> > > free_xen_event_channel could race with valid_evtchns getting
> > > decreased?
> > 
> > ... I don't see this as relevant.
> > 
> > > > Thankfully the memory is still there. So the current code is okayish and I
> > > > could reluctantly accept this behavior to be spread. However, I don't think
> > > > this should be left uncommented in both the code (maybe on top of
> > > > port_is_valid()?) and the commit message.
> > > 
> > > Indeed, I think we need some expansion of the comment in port_is_valid
> > > to clarify all this. I'm not sure I understand it properly myself when
> > > it's fine to use port_is_valid without holding the per domain event
> > > lock.
> > 
> > Because of the above property plus the fact that even if
> > ->valid_evtchns decreases, the underlying struct evtchn instance
> > will remain valid (i.e. won't get de-allocated, which happens only
> > in evtchn_destroy_final()), it is always fine to use it without
> > lock. With this I'm having trouble seeing what would need adding
> > to port_is_valid()'s commentary.
> 
> Lets take the example of free_xen_event_channel(). The function is checking
> if the port is valid. If it is, then evtchn_close() will be called.
> 
> At this point, it would be fair for a developper to assume that
> port_is_valid() will also return true in event_close().
> 
> To push to the extreme, if free_xen_event_channel() was the only caller of
> evtchn_close(), one could argue that the check in evtchn_close() could be a
> BUG_ON().
> 
> However, this can't be because this would sooner or later turn to an XSA.
> 
> Effectively, it means that is_port_valid() *cannot* be used in an
> ASSERT()/BUG_ON() and every caller should check the return even if the port
> was previously validated.

We already have cases of is_port_valid being used in ASSERTs (in the
shim) and a BUG_ON (with the domain event lock held in evtchn_close).

> So I think a comment on top of is_port_valid() would be really useful before
> someone rediscover it the hard way.

I think I'm being extremely dull here, sorry. From your text I
understand that the value returned by is_port_valid could be stale by
the time the user reads it?

I think there's some condition that makes this value stale, and it's
not the common case?

Thanks, Roger.

