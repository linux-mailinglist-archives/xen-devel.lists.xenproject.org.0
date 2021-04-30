Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81F2236F7EB
	for <lists+xen-devel@lfdr.de>; Fri, 30 Apr 2021 11:28:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.120424.227733 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lcPQq-0006zQ-RI; Fri, 30 Apr 2021 09:27:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 120424.227733; Fri, 30 Apr 2021 09:27:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lcPQq-0006z0-Np; Fri, 30 Apr 2021 09:27:32 +0000
Received: by outflank-mailman (input) for mailman id 120424;
 Fri, 30 Apr 2021 09:27:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jCGG=J3=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lcPQp-0006ys-1L
 for xen-devel@lists.xenproject.org; Fri, 30 Apr 2021 09:27:31 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7e9e7d1a-1f98-4a1c-bd8b-fdc83389265a;
 Fri, 30 Apr 2021 09:27:29 +0000 (UTC)
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
X-Inumbo-ID: 7e9e7d1a-1f98-4a1c-bd8b-fdc83389265a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1619774849;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=Wd4oGLUCn58ujj+D6RpzwvNyloUoBpzwsL1wmk/htKI=;
  b=Gjfr8CuSeC8Uk99ii1CQNXW7L59ObWn5DYKJophw4phAIjPuEYTRjjs0
   gKLGVq4le6QXgVolPRQBnPHSLoNlKsx5NRTcJt593GkjjzbgDg+kuTGqt
   DOkY4cysfM+1tqNjTLqQCH5ZW05W5vsdZ0z7aq+uneeCba/NF4UMCfecG
   w=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: /6ZctzDox71SBbbhFS1pEGVmQPsLfJrE5QBTgNQyWIyQAxmn036mJxrjrpUwjuFFhsIs/hYLKo
 CqwgQrrOG29KWuyDgB62qNQ8y6rTE2TKqcc8dsPmJvx4+NI8JAZBu4GJJ8GLM3AMlaZMmH1tP9
 FkqkEayMvP68lQEtE8kdBLk+008fiWt4cA2bLcc/zztkudKZVFSqrD5wcDaTKXvMeUpS5WR5KI
 mBo1LiN0L7yZbSDY+T/JBwSBfJXBF+FpF5vJ+29t+U1sBH/sRypX+ZLWkJ1CJ0C+Lk25vFb1c5
 MIk=
X-SBRS: 5.1
X-MesageID: 44299964
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:wDq7l6BGaLKLwMblHegetMeALOonbusQ8zAX/mhLY1h8btGYm8
 eynP4SyB/zj3IrVGs9nM2bUZPvfVr1zrQwxYUKJ7+tUE3duGWuJJx/9oeK+VLdMgXE3Kpm2a
 9kGpITNPTZEUV6gcHm4AOxDtYnx529/Lq1gPrFpk0McShBQchbnmFEIyycFVB7QxQDKJoiDZ
 yH5tdGoT3IQwVrUu2QAH4ZU+/f4+DRnJX9bhIcQzIh4g+CjTSngYSKbySw9BEYTj9J3PMe4X
 HI+jaJnJmLntOa7lvn12HV54lLg9eJ8Lp+LeGFl8R9EESIti+Gf4JkMofy2AwdgObq01oylc
 mJnhFIBbUN11r0XkWY5STgwBPh1jFG0Q6Q9Xa9jWH4qcL0ABIWYvAx/b5xSRfS50o+sNwU6s
 sitAj1xvknb2K0oA3H69fFTB1snEavyEBS6tI7tHBDTZAYLIZYsI13xjIkLL47ACn45Io7ed
 Medf302fA+SyL8U1np+kNrwNCqQ00pGAaHTkUoqqWuoklrtUE84E0CyMMFmHAcsLo7Vplf/u
 zBdp9ljbdUU6YtHO1ALdZEZfHyJn3GQBrKPm7XCVP7FJsfM3aIj5Ls+r066MyjZZRg9up9pL
 3xFHdj8UIicUPnDsODmLdR9ArWfWm7VTPxjulD+plQoNTHNfnWGBzGbGprv9qrov0ZDMGece
 20IohqD/jqKnarMZpV3jf5R4JZJRAlIY0ok+d+f2jLjtPAK4XsuOCeWu3UPqDRHTEtXX66LW
 AEWBT1OcVc/mGmUnL1m3HqKjbQU3262ag1PLnR/uAVxoRIHJZLqBIphVOw4dzOCTAqiN1zQG
 JOZJfc1o+rr2i/+mjFq09zPABGM0pT6LL8F1dDpQoANVLIYa8O0u/vPlx67T+iHFtSXsnWGA
 lQqxBc4qSsNaGdwigkFpaBPn+FiWAQ4FaHVY0VlKHGxcqNQOJ4Mr8WHIhKUSnbHR18nghn7E
 1ZbhUfe0PZHjTyzYO/jJIVA+nbX8JmgBiiJPNVrX63jzTfmegfAl8gGxK+W8+ehggjAxBOgE
 dqzqMZiL2c3Qq0JXAHm+Q+Ol1UYGGxCLZLZT71Irl8q/TOQkVdXG2KjTuVh1UWdnDx/0sfvG
 DnMBaZYOrGGFZbp3Be3Jv76V8cTBTuQ2tALlRB9aFtH2XPvXh+ldWGYae+yEO9QFoPyON1Ck
 COXRIiZidVg/yn3h+cnziPUUg8zpI1J+rHEfAIaLfIwE6gL4WOiIALF/JZ54xeKdjrq+MHON
 jvIjO9HXfdMacEygaVrnEqNG1Is3Eii+rvwwCgw26i3nIzaMCiaWhOdvU+GZW74GflTfrTj8
 k8otIxoOeqMmL+LvSB0rraajZfKhXV5U66JttY3qx8jOYXjv9UGZKebB7jkFdg9z86JN3vlE
 wfTL9giYqxcbNHTog3QWZh4lEtlN6zN0MlvQz9P/8mcTgW/gvmFuLMx4CNlKEmDUKArjbhIF
 Wz8yVS+PHeQiuIvIRqfZ4YECBzaEIm7m5l8/7HX4rMCB+yf+Urxiv2DlaNNJtcQrOCA7Mes1
 JT5MyJhfaec27d1BrLtTV2ZoJI/GDPe7L/PCu8XcpJ+ce9I1KCn++D59Oyli7+TX+DUHsj7L
 c1PXA4X4BkkTktjIo+zyi0ROjWmyse4iVjyAAisEXs1Iig6HrcBmdcP2Ti881rYQU=
X-IronPort-AV: E=Sophos;i="5.82,262,1613451600"; 
   d="scan'208";a="44299964"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xor/Mk48uwBnpZk7/o0FcoNX2SrQVYtr78Im0Kgrnsk2hAyK38A1pyX2A1xkfXbuJLKCrSwNQT1oHZJPqHA5PxREYgZCGBO+ma5bFlXjw4BeetKc5mGcVTzjU1DwU4KjeuJ+R0WKLbloqM9cYUy4yw0XEjPJbSA584U+7nRobQz2/fqFFRROBT2D33g/sjEXAyU1t3kCobMbzRWIMjOXisLRLYGvZQORtd1BbqkuUi2T1pOwfjoM7to0CHpjq08GIz/dvXB4+fayNLSFrszLp4oiRRvO3I/o+TbevDbif9VIpTa/8cY69q3Q24tj03k56iSSkT+Rr1WpS1xlcIODww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2hGM3BEftBMwCwPrYwEQRChJCVSj8+w/8zrmQPt3DTY=;
 b=SpsRa5VENAw0KncG2I3/9umxTFwGO6Qm3HO7MNFYYx6NG7aaOMQdmZVYsZLzm2gwqNANeLWgimjtwCsjxgkvZfl6EXzW4Avx4AX5O5sYIA+32K82qfnkCSImX6KRPQHEXaUcZ60n5cuG0h82du4v2lmOo81kodI/3z+aMBShCE2SHY8J8rQ29P1bJY3zv7B24gSrur+SHNUHn1z+BcbBmYGJjnZiX7wKjWlRd7hAWdqUq7C/hoSsUF9I1LohWyJds8P2DGPUoWbRrL95fCj33KwdyLWKOLTpqOn6HvhA6wm/DCBzQxF6ESQe5rbgLP5jAxlYmfY6K6u674oE+cf/3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2hGM3BEftBMwCwPrYwEQRChJCVSj8+w/8zrmQPt3DTY=;
 b=ksJj8+hcuL47ppCsnuBKojm0iZxSYsBIedLCrgfUGP+mVKocPUZyGiKAQ0R8lelvLlxVEKz8oct5NidhQ0/o1/rJZUV2XU6uzFPfTyKPM3PGhy+hMQLx57o1SSEH7LttIfTHgvQ45YtkoeVDF6y6rlnkip6E/gkXijckm6sWylo=
Date: Fri, 30 Apr 2021 11:27:18 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, George Dunlap
	<george.dunlap@citrix.com>
Subject: Re: [PATCH v2 07/12] x86/p2m: the recalc hook is HVM-only
Message-ID: <YIvNdhW+8QOP18aP@Air-de-Roger>
References: <3cf73378-b9d6-0eca-12b6-0f628518bebf@suse.com>
 <b99313df-f466-cf95-d772-c3153745c56b@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: attachment
Content-Transfer-Encoding: 8bit
In-Reply-To: <b99313df-f466-cf95-d772-c3153745c56b@suse.com>
X-ClientProxiedBy: MRXP264CA0025.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:14::13) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 49f8928e-b784-4402-a87f-08d90bba2a48
X-MS-TrafficTypeDiagnostic: DM6PR03MB4843:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB4843A40115A55AB4BAD66F958F5E9@DM6PR03MB4843.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9Rj/bg7fz6gVPuAeQiEm9l4S3y9eUx4GUR53dnLwzzLhW7/Wn4VoRhbFTMAfbbBUoGxKvypzim88VSVU8rFw2bI4/pcEUdWFc9QmHwyxFMHqe0avKg+TdeWQ5g/+ITp+iPZ/DkOh4rW3qvKCnfO+FGTxrMgIzP1ImST/lUVQOpfV6J2v+7wTQ7bJJx8mUbTyyJYzsTWFbacp47suYjflEtgEbqrdgdSUahSdZoVrfQi9wKTe6dHS1jEsrfqoi5YGPxVuqTmu7SedHc0Cd4FbW3VbphhzrKsysuIBHCY+02ni4PeEYjfgl1kOVJEYVCYEVMuJHfl1fQ0Z1Tp6YGmI+tpmM/Y6GCG7vLPdl7j6pOQwW19VoeXLLqgRSjB6pjS7so2b7ajIeoO+e3/RwPkrNQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(136003)(376002)(39860400002)(346002)(366004)(396003)(66616009)(2906002)(621065003)(956004)(8676002)(107886003)(316002)(6916009)(9686003)(33716001)(54906003)(4326008)(186003)(26005)(6496006)(86362001)(6486002)(38100700002)(4270600006)(16526019)(66946007)(478600001)(73894004)(6666004)(66556008)(8936002)(85182001)(66476007)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?SDJTT256eE9CTm1oUCtjWDZlZksyUHdMYUMrSWZvSlZTNW00eEFJYXhiQU5n?=
 =?utf-8?B?dDFQOUd0TUg2SWFmc1R2UG9QQzlodUw0dE9DVWZBelphWlc2MnB3R1IrM2t0?=
 =?utf-8?B?K3dHWklIbUpGY1ArNVNsMVVrUXJZWGt2TzVKd3dNNi9Uc0JHREFENVpPeTFK?=
 =?utf-8?B?MDlhSVZQVUJXdXEvODlmV1VYWkEyUUtqemRaSzhJU3Vua051ejkrejBSd09l?=
 =?utf-8?B?STk0elVzMm9MY1JHQlkrRTJ4dWh1TzNVRzRuSGxOdkZnYi9XVStVdmRMVDFv?=
 =?utf-8?B?NFBNVjhpU0NjclZVUEdsR0xvemhHblBSMi9xOC9pTmhmK0IrUEI0V25wVkxE?=
 =?utf-8?B?S3hZbkRCVmxwSFRlcUc0S2gzeS9Eb2FRdTJ0THVFd2tEc2Q4cHRwbjhHdyts?=
 =?utf-8?B?R2NEVE5tZEt0ODlHVlRqa25XdWJaWlFLbnA1UDNRbHRUQTRvb1VCZi9mQnRT?=
 =?utf-8?B?a3JPNFpmNDQ2SDM4U28rQjZ5V3J1eGhtckxkeTBlaUdkYnJLTEVvbmhuQzZT?=
 =?utf-8?B?a3hiOVVoQlBXbjdiWFA1MWgyU3F1Rm9GYXFyN0F5dFBXQ2pnNWVoOXdPUzJx?=
 =?utf-8?B?WGdRQW5nVFpwTDhQNlVqM0hETUdwL3RGRGUvU2N4TTZXcWZ0RU1TTUdPUE5a?=
 =?utf-8?B?VjNDOVJXdmNHcFkweWpUamVPYUQ5NkFub1RyRE9XWmdwSW43dm1MbWRCSS9H?=
 =?utf-8?B?M2R0ZVRhL0p1VnRrNmNxRUFJcHNRTDVFUVdQMUF1YmkzSTFDZFlSSlp0bXBY?=
 =?utf-8?B?Q2VyK3ErK0hQRnhpZTh6MU1nRU9HQXdsakFNQzkxMXVocUpXczZZSjR0anln?=
 =?utf-8?B?Q1MvaDczVTVMamFJM2lsWERTUUgrVmpaRFNvajROSnFxK0tPblZ1WVBReHht?=
 =?utf-8?B?WUhUMGFXenZXRnZUdGJkM3dYcENMcWxEcGxEc25DYW5TUXZPeEJlTndiYnNM?=
 =?utf-8?B?c1dIS3IzS041Vmp6TFBXbmo0Qk01UDNxNTlqTXVmMCtETzgrbzJCMVZOY2Iw?=
 =?utf-8?B?U3orUnF1UWtMNTQzeEYvTGVhQ3IvSjlPSzJGZFppWEdJTE9kZGxseXBrSjRT?=
 =?utf-8?B?cVRyOXc0V1liMnlZRDYvQXNPUkUxWHhzb2Z0MVdKdnlGN0FjcUNVNlNjUVh1?=
 =?utf-8?B?bjhEdzJsNkpYVjg5NVJrMzI3ZWswbmY5NkZIWUZKWTRNQXI3bDVNTEtENWo3?=
 =?utf-8?B?S0dIcW84dFJqSzdEZHBWNDNSVUFzWURmRTNHRDJGOWhkQmhnaDkwN0FHeml5?=
 =?utf-8?B?R0RaaXVWZ0RURUhMb0ltazhLd0dUVXZPQzRGZERuRmUvT3duMWYrWURMd0hM?=
 =?utf-8?B?VFJxR2ZPcDFObzk2dldVNVdYQVdVZGFmWHdrMDk0TGFZLzVzM01JK1BnMlhy?=
 =?utf-8?B?Nk9vRGN3NGVrY3UyVTZGVzA0NEszQ3ZyaVU4N2NocFFJRFFwdk43ZVpaOHNC?=
 =?utf-8?B?OU5rZlhSdXF5bDJTVlQ4SjBTOGZjTEJTSEhOZGJDV3lBbXFKYnJKUXRlN2U4?=
 =?utf-8?B?NnkxbWk2eW96WXo4cTFqYmxCV05ZUUVqdWFlTkgyMFNzdE1TbHBnZUdhTnE3?=
 =?utf-8?B?SE5BbjlhYW5DSWpERnd3WjdZQTBXQ2VyN0wvTS8wcFE3bzJwemhQMXJES1U4?=
 =?utf-8?B?T2E3NTYwWmNaV2dDL014bm9Kd0hjOXYrZ2NYWFlyN2s0QmxVcXovSmZqMzBv?=
 =?utf-8?B?WFZMSExlYmJ3SW1kcVhveHlHL1lWb0VVT0tqU0ltbUppVHNlaHJMYmVrTEZJ?=
 =?utf-8?Q?G6ytK1BHpheuvEUfGYd+KiOqlDeC1fktNkCzj3f?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 49f8928e-b784-4402-a87f-08d90bba2a48
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2021 09:27:25.2227
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dF2du3pnBQqtZoizTRzIwGP4r6cgnsXs+P6fcVc8IW3bCqHqW9LiOL50BceYuL/pSP2aeiPA/YzELgtRuocvlQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4843
X-OriginatorOrg: citrix.com

On Mon, Apr 12, 2021 at 04:09:18PM +0200, Jan Beulich wrote:
> Exclude functions involved in its use from !HVM builds, thus making it
> possible to exclude the hook as well.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

