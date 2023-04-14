Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A71326E2113
	for <lists+xen-devel@lfdr.de>; Fri, 14 Apr 2023 12:38:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.521098.809406 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pnGoS-0007or-HD; Fri, 14 Apr 2023 10:37:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 521098.809406; Fri, 14 Apr 2023 10:37:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pnGoS-0007lr-Dl; Fri, 14 Apr 2023 10:37:52 +0000
Received: by outflank-mailman (input) for mailman id 521098;
 Fri, 14 Apr 2023 10:37:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rR8y=AF=citrix.com=prvs=4614ad092=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pnGoQ-0007ll-EI
 for xen-devel@lists.xenproject.org; Fri, 14 Apr 2023 10:37:50 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 655b5324-dab0-11ed-b21e-6b7b168915f2;
 Fri, 14 Apr 2023 12:37:48 +0200 (CEST)
Received: from mail-mw2nam12lp2045.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.45])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 14 Apr 2023 06:37:40 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SJ0PR03MB5951.namprd03.prod.outlook.com (2603:10b6:a03:2de::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Fri, 14 Apr
 2023 10:37:36 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030%3]) with mapi id 15.20.6277.043; Fri, 14 Apr 2023
 10:37:36 +0000
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
X-Inumbo-ID: 655b5324-dab0-11ed-b21e-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1681468668;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=rfFV0GyBle3d5FzWYjOjeStUQK3dx7Ex94LOto3jdzo=;
  b=cRKHI4VABc1xhVwVrY8qmjeSeuO5CnvCApHXdzgqQ6NHHiKFAIMq+T5f
   x4kcgSb/iK+ZMaD4tbk42MO+Ay1DgthfoCriGhP7VsiMOlFHqViX8i7LO
   bTNRGpDdcJPSB4Gvwb+zf9r+Tl0DaiQSjX+E0aiclp78FFWct+gAuIkKf
   M=;
X-IronPort-RemoteIP: 104.47.66.45
X-IronPort-MID: 104290161
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:12cF5q/pMriKJ8njN5GGDrUDon+TJUtcMsCJ2f8bNWPcYEJGY0x3y
 WoeXWzQPKuDNmLxc9h0bYS18h8CsMLVmNZgHARt+X08E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOG6UKicYXoZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ire7kI+1BjOkGlA5AdmOakX5Aa2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDkle3
 vEGGAkdPyyPxN+/7Iq2G9U31u48eZyD0IM34hmMzBn/JNN/G9XmfP+P4tVVmjAtmspJAPDSI
 dIDbiZiZwjBZBsJPUoLDJU5n6GjgXyXnz9w8QrJ4/ZopTaNilAsuFTuGIO9ltiibMNZhEuH4
 EnB+Hz0GEoyP92D0zuVtHmrg4cjmAuiAN5IReXhqKcCbFu72lAZJyZGZ2OBjei0tVe4astwM
 mIS9X97xUQ13AnxJjXnZDWorXjBshMCVt54F+wh9BrL2qfS+xyeBGUPUnhGctNOnO0cSCEu1
 1SJt8j0HjEpu7qQIVqC8p+EoDX0PjIaRVLufgcBRAoBptz8+oc6i0uVSs45SPLoyNroBTv33
 jaG6jAkgKkehtIK0KP9+k3bhzWrpd7CSQtdChjrY19JJzhRPOaND7FEI3CChRqcBO51lmW8g
 UU=
IronPort-HdrOrdr: A9a23:68ja/66MJJO4o4hwlAPXwAzXdLJyesId70hD6qkQc3Fom62j5q
 WTdZEgvyMc5wx/ZJhNo7690cq7MBHhHPxOgbX5VI3KNGXbUQOTR72KhrGSoAEIdReeygZcv5
 0QCZSXCrfLfCVHZRCR2njFLz4iquP3j5xBnY3lvhNQpZkBUdAZ0+9+YDzrdXFedU19KrcSMo
 GT3cZDryrIQwVtUizqbkN1OdQqvrfw5evbXSI=
X-Talos-CUID: 9a23:eSbo6GzTXMHmMePCl1BNBgUEMc07QkTNnUvcYHKxJV5kGYHOGXWPrfY=
X-Talos-MUID: 9a23:126ZuQgU7A7pQSKn15wyW8MpKPtizJ/+Ong3vYQLhNCCBDVfIhmbg2Hi
X-IronPort-AV: E=Sophos;i="5.99,195,1677560400"; 
   d="scan'208";a="104290161"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XeTCHPQPWglVOSTG1NGoJFacphuNobGIdeRIWr06wayTLvMYb4pW5IRW6muojxbexMbP44iREXO4HQ+Q/WSPTqBKsQ32vG1tzHyXW7HK1lukNZMpks86bQanVP59sYqCmguwIbR23T+YXgt7ZWTgVjJ60NVZdnSkLeByyLyfyLfBBL9YesLgsPBisj9So4tUCYxpYkZU6e6WEPLgEXisyYvsnYAA2xS55lS72hAgxL3F5QDrmNDQtb862HsSVLmCqu8ixSfghF/75e0GV3Oqe/Xki9NQpy8rIgAKlHI1PXy3M1GN9LSRHbp3cOG2+p4go4nTSLoxlKjcWCLysiUO4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GYyf/Bzhwwa+5YfSF6UGO9nYAQLVjLy3kf5xyX+9pYo=;
 b=ElCcTLaqo1gEJ9ibokBSHV5F+IPuwlwSQzOc5J+YIBjrQo3ppf4Un7Dv9/xlu2CQj54SjjrWwNliQKz6M4lZ8Wv2OtlvrkdBBNjmn7lSkRJgNbi8b2Bmr3zNLSiz8WQV9h5csbk2/qXy6w4SdosyNODRtROybgh0Z/vmOk6dSMWb6kYSd1/ho7ootjDDMgGDKE44QUf7MQ3PfVTt7ViyllUvnnzPsIHVaAC2Yv/jAotiXWaIz0jE6S9X4k6POVcYw33xAwVmgpArS6eNDUU4kZm0ohBnSTOLB0H0Gd7WVsy8tOpXD2+WGquDyRXzBLkdSniiGMqsk7eHtaNeDu+31w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GYyf/Bzhwwa+5YfSF6UGO9nYAQLVjLy3kf5xyX+9pYo=;
 b=dHlrberag5bPoE/FAFLx3rvJK5SBM8Blg1a5bJMSIlqmUlXRaStsZhiSRlGP1aIBn3zxqDtN8sfuGEEWQ1mmjfzc4rMJ+Ze6ugvciF1yy3CZe5BuJX4Bi58SeQCVOAf5ZBWWqQG8H35doR0l4fSe3Gi1tntE25mk9J6N3S/E4Sc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <c0fff5af-6a11-34f9-9e0e-01c2ba586591@citrix.com>
Date: Fri, 14 Apr 2023 11:37:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2] x86/hvm: Disallow CR0.PG 1->0 transitions when CS.L=1
Content-Language: en-GB
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Jan Beulich <JBeulich@suse.com>, Wei Liu <wl@xen.org>
References: <20230412183519.2996902-1-andrew.cooper3@citrix.com>
 <20230413150009.3145462-1-andrew.cooper3@citrix.com>
 <ZDkrmbn84X26X0qt@Air-de-Roger>
In-Reply-To: <ZDkrmbn84X26X0qt@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0540.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:319::6) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|SJ0PR03MB5951:EE_
X-MS-Office365-Filtering-Correlation-Id: f3834d00-6fd6-4f91-94ac-08db3cd442da
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	PenDB/QVUUE4qbnb+wRr/lqiv9y/Oyn6C+nz97hQuAnj38uejq22xVLw5z9OJVB/8riNQ8+rKcJZINUFMX04IZ9bAH4AhlpjU3yUHVugCOMs/bUwdVQlQ0YTTVM21V8tj/SyJqrsiTS/5gBN1lf5clu6eDWSVCd75HmnEWE5t87DF8h7aDb2wzi04f2ENlnuarmwdxh4Xr/k0nYlRkCF3fF/94jaTvKhjuNYrDRIZC9fSKV89qVO1lCMA73W/SmuqZSRWgSJrF7h+AU8d/qropZ04C0PEcaxQNzzWKgrxXljANtRKySxPNv6ppFFlF4fBSIB2RjeOAPEUJTG6TzPhoJYz5yOGqc2MCQw+xeiNARIYsHjI9+KrCazc86Nc0uhP3h8mO5hI2e0uuQlVCwyejWoBlKj0MCFm4CJnZN0HlXECMi/cQaJKxXE7N2XRfCs+Am42ag65snaWFTBAvZdnNpToZ0hiMpM55X4Dt6BEsNJgWijA9rxrckP+kgHP0wIDUMAdxombqAT986ZU/o1FPUHX8dCbUdtQ3+knGXXyScwjidbP7RtNItJ9VQ5rLEZhXfz2PBXJar5HohlPyyJCwe/pNqc/nEatMRlMaZ0jLZ4uCAtIMF4BcVO8f7XkReWv+cSsKpr/tLSjjaKGVkOHw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(346002)(39860400002)(136003)(366004)(376002)(451199021)(6666004)(37006003)(6486002)(66476007)(66556008)(66946007)(36756003)(4326008)(2906002)(86362001)(38100700002)(41300700001)(82960400001)(5660300002)(8936002)(8676002)(6862004)(316002)(478600001)(31696002)(54906003)(6636002)(53546011)(6512007)(6506007)(26005)(31686004)(2616005)(186003)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TGY4ZlF6MURGa0hXWFBEckIrb2I2S2RQMWxEbjkyV0d5SUpWNWhaM1NBelQ4?=
 =?utf-8?B?ZVhsU25sS1p4a3dmbHVYNmxIamt1VkZyNkdLbC96cmpISitsY1kzcEpQU3U3?=
 =?utf-8?B?a3JoMGVZUGdEeWsrV1Z5SnVncTgzaVkzVEJ4UU15TzY5ZWdRQ3ZnbWczcDAw?=
 =?utf-8?B?aTlkaXpLTnNlQ2Q3dFJqNzZBY0pwZmQ5cTB6dVlmTU5oWmNxeHdXMTBPWExO?=
 =?utf-8?B?c1M0R0Npa0xzbGM2YmZ3VmpJWmU3Z3FNRVRWczd2QkNxSTZjcEpuTzZRZ2pL?=
 =?utf-8?B?Qjk4OWdVUEpTNEI5Um1TRFE3SDAzRFBpai9NQTRodW0xNlBFb3FMT2V6alVZ?=
 =?utf-8?B?eFNkbWcxcWtUU1RDZkdKWE0xdndMVkZqSUxqOGdpKzBFdERkclRyUFJxUXB2?=
 =?utf-8?B?NE9NaE5VSEQ0dzBCVXR3UFd0ZzlwdkkwclU2NHp3dFk0U0ZIY0JQT0M5S3Jk?=
 =?utf-8?B?QmdpRXJxd2hOOVJRbWVVaUdZN1pjazJJVEdDRlQwenhvUzQ2QnBEYkR4N3h1?=
 =?utf-8?B?NUZ4OGVFOUQrcDBBTHFaL3Viay9JQ2tDN3VSZUdEc1VCdzk5bVZXbmlsM2RW?=
 =?utf-8?B?VXc2ZERVcEp4RTErYkNLY0lpWEJPaUlXcStBS1g4Nm9xdGd1SHoyWDBuNmtQ?=
 =?utf-8?B?S29Tb0dzSEZyb3pjNU9mbU9NVkV5YW53bWdJMCtKM1E5cS9XR1ZxOWU2cFRK?=
 =?utf-8?B?bG9Ib1hPcDZ1Mmd3bjcwcjQ3TzR6OGF0TW01K0hxcml1UDJ6WWc3YllMUlZq?=
 =?utf-8?B?eTFwSnNPQlIwMy9USzN5MmRJSUtOSUtiOW5CUXN6Q0pQVzJOaXVTYk91NXd6?=
 =?utf-8?B?Z0gvSXVtU0lBdnhhdnduNFVhdUVlbkRad0JmZVdXR21vOURTS2FyMU5TU1h4?=
 =?utf-8?B?RWg2RmNyTjVEZHRsbDBWOHVZdWwvaFJZRFRpU1FKT1NGVzNHWE9EQ1I5NEdQ?=
 =?utf-8?B?cWtYbklBVWZnc3A5bldyZnpMOWhnNXNXbUJyWkxBOUNGMXU3U01hZkNUdkNO?=
 =?utf-8?B?YmV6aS9Oa25Qa3Q3QnlZcG5EYUZUcnBJNThnTHU2QjEvSGo0S0J3YTJVa2Zl?=
 =?utf-8?B?U0Rrc3N6cmhQNWZ5aWpyejNUdU1SVE5xSUVzbzhYaEJwc0FrL291OTVKYVFz?=
 =?utf-8?B?MStibStRdjdLdmdhdmM1azA4OXd0azljT2FCSEVRL1FuNXhyZ2ZWVkhHbS9j?=
 =?utf-8?B?czBZTnE0eWVuNUtBeVJYa3hiaE03ZTZQdWRad09iYUtUcHp0VnZ3K2hlTlRJ?=
 =?utf-8?B?QnIyTUJ1bU56Q0NVRzJXNmRyaWZzelk4WFpqcU1lcEtWdjhQU0JVSk8xTklV?=
 =?utf-8?B?UTBoZGZaL3JhZGlnTkxBREpRS3JSOVVISWIxRmFhaWRMWU1JYkVSZUNZamox?=
 =?utf-8?B?bHd1RVhCWDYvK0ZjeHFsbHNRMFFOMENvUGVPNDJ2WTVmeFhZUjZCRmNIRkNa?=
 =?utf-8?B?SFJlbEFzckhrOU9iRzRpTUFEb29MbzFVSzJIVVlIMi9FYXpKdHVmbXMxOHdU?=
 =?utf-8?B?aHFtd1ZTY3p0NmowY0lRMmlZKzBUK1pZVThpcVViVGtDU3cybmFpM1YwQk5q?=
 =?utf-8?B?akEwRE5wNllxMGxra3h6cXFmeGdwZ3lEZzR4ZEZHNnJ2bm1vWXVWdGIyVFRX?=
 =?utf-8?B?cE1icGdqbjJ4eDFORXkvRTdHcTVsVCtLWnNrSTc5d0NZbDhTck9kSnZsclFj?=
 =?utf-8?B?MVhBdWxwWmVVSnE4bkIwbnc2blhINWlTdDdwZ1JNaldGbElPeWF2MlRjSStM?=
 =?utf-8?B?ZzRIdTBXdVRKdTRQbzUzY045TzVNY2pLcFNIUGFmQ1hvamZQV0piZDNwWTgx?=
 =?utf-8?B?QUFocFRCRWUvTG51d2xiMHNzdE8xQ3BSZmVVMDVOcHE1NGtTTzY0a1l2OXht?=
 =?utf-8?B?KzAvdVM2YThxcTh2ajRHbjJrQ0h1SHBqYURFNmNub3ZaNEMzMStGMGpDWnlt?=
 =?utf-8?B?cXlIcXlWRHVUTjVyNEd6ZUt1WG5pRTNaZVpucUJ5U0hyb1QxdHlMMEpUdzJZ?=
 =?utf-8?B?NkxDZ3laR2RXZ1ltL3JvUjBCYjJYV2RlalEyLzIzMXk3N0VhU01NSHllVmd3?=
 =?utf-8?B?a3ZCN2pZMy82YXJubE1nMXF1eXZHenVranBQVll1SkNaaXFIdXE0ZWNDWEZK?=
 =?utf-8?B?am1vb2hJS1VkWE1FSkFBbVEyMmZkR2RSZm4ra2ZJd2hYSUluZllZaHpXdlR4?=
 =?utf-8?B?WFE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	CLV82Y3MtsIqNeTg16jKlJxPQuP1oAJDfRWmYMNxXwdFeDV6PAdhx655xeC1zyTrQvZhJ2y8/3/zGS1cw4LSqvDTYxLwri5AbiFzWYUpYn0ZqzuvxqJY5TCX0lq+q31P8IhgrSELqbSgzbSkYqAP+1WAI1jt9pbqEhOSUy2wVgHNsD+FcM9hSPGZmhPHBdoY6CAkglecPHx0nkILnk9xdTw2mV/R7N5KVhYzQ0itAg00V4f770YehSiZhuTqmYb8TXUB8TxLsIlgUFGt+VLQjNV6Wixi04cN4uh1mpI3f0r91ebF8TVF4oEHOF/yqlnlQrnxSV64hwuv7qqILE0TpS+rN958N/ANm3cGRHcVQDNenC20urcptttCdSYRIrFh8oSqiS8zrGkYcWDmslAveDLVQ/31bnzedCELaQ19uPyCd4WGsMPGZhoMBbgGNJe26Q0EmgMNSfRaZ6AQOvHW6tDQj5XNXTZeLOYxyrIURgYUgUa7KIaHqlC7PbWsJ0c6eItq/H/YDgHYnZcmxzxlcEp8SpxqHheDaGERtfVaRyq+Wgjnnj4cVkf9x+K2a6rMGQgKPj6lfgT2NygAtoK5QI9mBxtM457LFB3nK9GxPJ1BFdVAhBjWu+JdXA48StGTCQL1kI8Z4RXHY6/7m4KV1GKpZx8OjR2IY6uKz89XqBqakUjY4oNnJoqwOErUe3IMy3ZyKGlc5dri0DKYU+qYfI6kvWLjmIauGkjFKsaQU2VJKqDTw7KH1z8B/wHuTbA/ipzTVf3liDcL7Ivob6SQpIo9FVZiyKaZBGmahOGui3xoJNOCIMAv+YawC/+LqHG65FPWJ8jc6Q18eulJU41+Fw==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3834d00-6fd6-4f91-94ac-08db3cd442da
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2023 10:37:36.0278
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 67yGCgatj3tdcP4PdSEGI417aBtyLs3V4NFaTQQC2J+4eGG4CpFmDEQ3LAoPozSZZjKEGkaHHi9G6pk9rOyGmOfqw/Xv/LihMqS8dAwNeng=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5951

On 14/04/2023 11:31 am, Roger Pau Monné wrote:
> On Thu, Apr 13, 2023 at 04:00:09PM +0100, Andrew Cooper wrote:
>> The Long Mode consistency checks exist to "ensure that the processor does not
>> enter an undefined mode or state that results in unpredictable behavior".  APM
>> Vol2 Table 14-5 "Long-Mode Consistency Checks" lists them, but there is no row
>> preventing the OS from trying to exit Long mode while in 64bit mode.  This
>> could leave the CPU in Protected Mode with an %rip above the 4G boundary.
>>
>> Experimentally, AMD CPUs really do permit this state transition.  An OS which
>> tries it hits an instant SHUTDOWN, even in cases where the truncation I expect
>> to be going on behind the scenes ought to result in sane continued execution.
>>
>> Furthermore, right from the very outset, the APM Vol2 14.7 "Leaving Long Mode"
>> section instructs peoples to switch to a compatibility mode segment first
>> before clearing CR0.PG, which does clear out the upper bits in %rip.  This is
>> further backed up by Vol2 Figure 1-6 "Operating Modes of the AMD64
>> Architecture".
>>
>> Either way, this appears to have been a genuine oversight in the AMD64 spec.
>>
>> Intel, on the other hand, rejects this state transition with #GP.
>>
>> Between revision 71 (Nov 2019) and 72 (May 2020) of SDM Vol3, a footnote to
>> 4.1.2 "Paging-Mode Enable" was altered from:
>>
>>   If CR4.PCIDE= 1, an attempt to clear CR0.PG causes a general-protection
>>   exception (#GP); software should clear CR4.PCIDE before attempting to
>>   disable paging.
>>
>> to
>>
>>   If the logical processor is in 64-bit mode or if CR4.PCIDE= 1, an attempt to
>>   clear CR0.PG causes a general-protection exception (#GP). Software should
>>   transition to compatibility mode and clear CR4.PCIDE before attempting to
>>   disable paging.
>>
>> which acknowledges this corner case, but there doesn't appear to be any other
>> discussion even in the relevant Long Mode sections.
>>
>> So it appears that Intel spotted and addressed the corner case in IA-32e mode,
>> but were 15 years late to document it.
>>
>> Xen was written to the AMD spec, and misses the check.  Follow the Intel
>> behaviour, because it is more sensible and avoids hitting a VMEntry failure.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: Jan Beulich <JBeulich@suse.com>
>> CC: Roger Pau Monné <roger.pau@citrix.com>
>> CC: Wei Liu <wl@xen.org>
>>
>> v2:
>>  * Restrict to when Long Mode is enabled.
> Maybe the subject also needs to be slightly edited to mention CS.L=1
> and Long Mode enabled?  Or just mention long mode instead of the code
> segment status?
>
> Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.  I think "Disallow CR0.PG 1->0 transitions in 64bit mode" is the
most concise way of tweaking the subject.

~Andrew

