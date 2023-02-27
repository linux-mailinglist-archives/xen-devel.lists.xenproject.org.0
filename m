Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 207DF6A4069
	for <lists+xen-devel@lfdr.de>; Mon, 27 Feb 2023 12:15:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.502380.774154 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWbTj-0006Rk-NA; Mon, 27 Feb 2023 11:15:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 502380.774154; Mon, 27 Feb 2023 11:15:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWbTj-0006PL-Jj; Mon, 27 Feb 2023 11:15:35 +0000
Received: by outflank-mailman (input) for mailman id 502380;
 Mon, 27 Feb 2023 11:15:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mutd=6X=citrix.com=prvs=4152eaadc=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pWbTi-0006PB-1F
 for xen-devel@lists.xenproject.org; Mon, 27 Feb 2023 11:15:34 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0b61ca33-b690-11ed-88bb-e56d68cac8db;
 Mon, 27 Feb 2023 12:15:32 +0100 (CET)
Received: from mail-dm6nam11lp2169.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 27 Feb 2023 06:15:22 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by PH7PR03MB7107.namprd03.prod.outlook.com (2603:10b6:510:2b3::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.21; Mon, 27 Feb
 2023 11:15:20 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6134.027; Mon, 27 Feb 2023
 11:15:20 +0000
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
X-Inumbo-ID: 0b61ca33-b690-11ed-88bb-e56d68cac8db
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1677496532;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=DpYrF7KSDbPhTXNaRG0ucQqP6OoQ/tRzexX94YTas9I=;
  b=O1Eh+DLrysv6BukcG+L7O5OfYtnlpoRb43FWw7pdYU45W2dDEvyOF5Iy
   KKOYh46JEE0eGMLGWcG1IvRnnKNUOR8Maqxy/lAGnkaz603U1gWRed0qJ
   yKrnFeQmTFmADSb7pNIrKqpAhUqcyNDHkoCCkA7YashYJsGOj//o8hqy5
   Q=;
X-IronPort-RemoteIP: 104.47.57.169
X-IronPort-MID: 98571148
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:lzju4amsmd8Ns2sbG7bxEbbo5gxoJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIWX2iBMvyKYzP0Kop1PoW/9kMO65DXxtVjSwBkqStkRCMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6U6icfHgqH2eIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE4p7auaVA8w5ARkPqgR5gCGzhH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 f8HJD5TMRq7vL+R44vkTMJmhOMlPNa+aevzulk4pd3YJdAPZMmaBonvu5pf1jp2gd1SF/HDY
 cZfcSBocBnLfxxIPBEQFY46m+CrwHL4dlW0qnrM/fZxvzeVkVM3iea8WDbWUoXiqcF9t0CUv
 G/ZuU/+BQkXLoe3wjuZ6HO8wOTImEsXXapDRODnr6c20DV/wERLLxwIBGCfsMCk1G+ldcNlI
 E8x3wgH+P1aGEuDC4OVsweDiHyOswMYWtFQO/Yn8wzLwa3Riy6GAkAUQzgHb8Yp3Oc0WDps0
 FaKltHoADVHsbuJRHbb/bCRxRuxNDYUKykeZCYCZQoD/9Tn5oo0i3rnRMt5AqexidHyBjjYz
 DWDrSx4jLIW5eYb2qP+8V3ZjjaEopnSUhVz9gjRRnii7A5yeMiifYPA1LTAxfNJLYLcQlzfu
 nEBwpGa9LpXU8DLkzGRSuIQGr3v/+yCLDDXnV9oGd8m6iip/HmgO4tX5VmSOXtUDyrNQhexC
 Ge7hO+bzMM70KeCBUOvX7+MNg==
IronPort-HdrOrdr: A9a23:Fd2v46379c5xjoafgdmmKAqjBIwkLtp133Aq2lEZdPU1SK2lfq
 WV954mPHDP+VUssR0b9OxoQZPwJ080lqQa3WByB9uftWDd0QOVxOsL1/qa/9SKIULDH4BmtZ
 uJf8BFeb/N5VUTt7ec3OGze+xQpeVu/8iT9IPj80s=
X-IronPort-AV: E=Sophos;i="5.97,331,1669093200"; 
   d="scan'208";a="98571148"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KNS7E4YU48t1apDzRCvXyhK+qmAx+c55+qfKBQqqux9PR8WpYuor9G5c8bNSdqNA5iIcbo7T3Ds1weWPGRlfojJDRv8Zkq9x3J1pVBJXihfERT8a+trNY6EN0iOvD9A1AsbPJkhglJ1vHJAU+rAa0m9jGBKBZIMUDQ9WaRXMpXOeJWsFwFfDrfkzWJ9bcsgFwQsO9YRsUeCL8NUZ906Tv5NpE3G7gZWVPFCYAU/Xm36Z6BwrEoRS8ZumExGsFxjW0iQOwPiLapv8lzPEFUGmABN/f38phIGGKG9sBhC+ezp5sPOad+mUJK+qz/WdQP9GIoYBGwlcR5vmRJKlfEJ1jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DpYrF7KSDbPhTXNaRG0ucQqP6OoQ/tRzexX94YTas9I=;
 b=eSpQalusTYnEiJTdjndoz8+ZRCBR89/oRrCbNXJwWdCWS85jE5u33i1N+eANWseMwKzKx0U3xeNiDQyjU46zYOmOKB2TttFSQWJby28D8goz4m9ZjmRDRjWAWFq4I6DIOoJqEwIGdShomua7F6ptU4cXMVqaf3iPbPym3OEfjam3KBqIF7FnRInQ+stpMkeey3D5UiG0CLESb9Y0lnKEhTldKfpk/q/15rWYCE4/8VTCUPiADkOJ5Xg6J1DCIFJX+bQLPX/8tr2DQ8eFZY+HNlEoqtKJfK/L778qcBO7gzwuPTEuieRtuWPIgJ4cwyotkRWPQ+OotXAmyI1jFl0aBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DpYrF7KSDbPhTXNaRG0ucQqP6OoQ/tRzexX94YTas9I=;
 b=d1zJftwUNqSn/Dc/3iNv5cTbsD8ee/2FTJbaWdrUWa/6kv6koOxm11QDLiEnzhHzSfdUdtCF12TnTlXc/3IXMy32Ql8dWJhj+kpdS2GjZdL17aR0HDfe/6H8HcRjsLF7nK0Cb69N/1WiQeGV2tWZ3ypTwAA02nMja2G8aU6dmFU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <2fec6c39-f73c-719b-7bc9-02e1ec3f195b@citrix.com>
Date: Mon, 27 Feb 2023 11:15:14 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v3 00/14] x86/hvm: {svm,vmx} {c,h} cleanup
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Jun Nakajima <jun.nakajima@intel.com>,
 Kevin Tian <kevin.tian@intel.com>, Xenia Ragiadakou <burzalodowa@gmail.com>,
 xen-devel@lists.xenproject.org
References: <20230224185010.3692754-1-burzalodowa@gmail.com>
 <e51c2ed6-4dc2-bf77-5d89-7023b3201fd0@citrix.com>
 <8745c599-bf9f-1eec-739f-3d42920dc546@gmail.com>
 <989903f7-4ea0-a1d8-923f-efb84c70ba21@citrix.com>
 <aa326f9a-94ca-75b9-6d4a-ab6fdf992c29@suse.com>
In-Reply-To: <aa326f9a-94ca-75b9-6d4a-ab6fdf992c29@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0186.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:311::13) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|PH7PR03MB7107:EE_
X-MS-Office365-Filtering-Correlation-Id: 4116d862-5bfc-486e-85da-08db18b3e9b7
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5UWHxYUbvRkuNqFKmUxGB30SQm3S0jjIzfs2ab9+aqLn/Ep1Pm8oFGf6h9E9jslCtRP0br3O1kKJq9VTDzjsQvuaSkYDIF16lLUdl7xrO5APMtlLO9FvUgJyNnBHsROEqIeFS53hSFiNEr4V86dRy5PAHBPf4+XzuhWDXIn2NKcL/wRagqgJnsGm3jCDwJHdAQV4BPl725DgOFRjbhBEUvn9YTdyeVKHCssEnrb30gZQAtn1+EYOOML9SWTGKKYGlLcjZURe0T1EI5ircVpnlDiwz/N9AOgkgr3R+NWb+4M0JkLrwIv2TlMhQmWxL2hm4X8i5YXQpZl8OBuKpX+NQz30o5Qb/kcNuolo1vMpwXOQBm17yDuWEanWWEPYtE8mGgJnRWIjnhcE9KacHzzzlKh1/ywu03wRAee+Fw7z0bFeiP4N73Aea1U2btGU58thekGtcCWRdLmK5Sn+rNxdwVcfb9DtqzLKyd//OJTGyE94XtsrJhr5A++hH5tt9oJG2uVWzhGqLsJqyNkBQU9eVc0WXer4SFc9PhIRKDJalsn6fjVbUu18Vxdox3lYyNtORPsrtFLwmlkmNEUZWMoZoVgRDS45XjzwNCzsN3QHom4+/Yt5cW+6RVmTcDUqaIl+DmdEwD1QBrj4v83Yg+T3lDL3MpZuvCg2tYjKQ9WXhh8rujnGk/NIKxBKEYl+WoJRbOKn47Ebm2H5Ooq1dVAwevyxL91Cw8dW21Y7S7rHCm4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(376002)(366004)(136003)(346002)(39860400002)(451199018)(8936002)(8676002)(6916009)(41300700001)(31686004)(5660300002)(66946007)(4326008)(66556008)(66476007)(38100700002)(2906002)(82960400001)(316002)(36756003)(54906003)(478600001)(6486002)(26005)(186003)(2616005)(86362001)(31696002)(6506007)(6512007)(6666004)(53546011)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bVNWbytFQUxUNmlid3lINXRyQ1VHRWNBd2lXM20yb1BDbDVrOEVrdkNnZ0RP?=
 =?utf-8?B?SE1lN01FUDJNOVN0N2FDb29UTXd1RmxIcTlGQXQyTTVmYnU5dnZxSUtselhl?=
 =?utf-8?B?QTlGTGpuZTZvd011STFhL1YxRk1UaFc2M1VnUWxaUlc3WlNwWDFSNFBCbUxU?=
 =?utf-8?B?SjVheWxqaXhQL2MzUWVxUWx2WXJJN1BTeURiNUN4b1Axd3NCaVVkVzBnMjlM?=
 =?utf-8?B?eUZ3R0NmUG9UbFF2UU5xeUhFTGJIOSsyVGFveGsreWFqNW5uTERuZml2VHVz?=
 =?utf-8?B?K25LeUNIMDQ1QWFjRUhTa1NmcERDekd3QktXdEYwbHR6OTNtdGxibW81TnpH?=
 =?utf-8?B?S1dhVTAyS01md0ZlOU0zWm5idVFBVkNzdmg0clhDQWpqM1l4Zlc4NnhLZzlR?=
 =?utf-8?B?WEc5WDdJYkdMSUJnZjdVa3loZUovNHFOdWkyRHhDcExKTklxdlhyNExKek00?=
 =?utf-8?B?S29NUENqaU1ZOURZb0dpS0Jac1MrWDVpVEhiZDBaS1o5U0xtSWt1T2lVUXgr?=
 =?utf-8?B?R1VPUmU0RTBTQmhqMTR1WGR3TW1DQXlFWmIvMmFKb25oZmV5NGJUQlAwcWMy?=
 =?utf-8?B?MTVtV2hzdUd6UFpCUWZkVEVnZzdWSXIvVkVMMnQ5WU5XdGZZcGFPdlgwMk9L?=
 =?utf-8?B?MlgzM1g0M2t2WGdRMitNbHZtdGFRUVN3UzZjYXJQWW4vTnUzYU4vSS82TlVU?=
 =?utf-8?B?WGh0bjhhRUZnUVkxRDQ0MWlwUEFOdlBWTUY1c3ZaZnVVOUJreFFBa0JuREZX?=
 =?utf-8?B?YWs1ZjY1eGZScUFIMHhWVmt4d0g4d0IrMzdqSjVDUitTcWY3NGRtS1VGL3JE?=
 =?utf-8?B?RnJUVWZ2UnZFcmwvamo1eGRPQVl0aFlWUFVBZDhURHRPUXA5NEY1SGROVSsx?=
 =?utf-8?B?VU1oaUEwUTVHMURFMlFtV0g4OTlhbU84SnJSamxKanQ0ZzliZ2czSnlWTERF?=
 =?utf-8?B?LzU0ZmFsYnh4TEFCc25sNnhNbzE1ZnRjNXpnRlBVTit3dW04R1ZqWkUxZmRE?=
 =?utf-8?B?ZFpPUTBNdG5VTzVYK1BBUVpVN1NQL2tITlVuMWFBWmVaOW1Ba21BTWFpU054?=
 =?utf-8?B?YlFjYTAzemFXdjgvUU9uRW5oSUFsdjBKdTQ0aHFvYXdLTnpBZjVZTUdTTzkr?=
 =?utf-8?B?dXhRYjhHOVZ5ZG5NZHNLYndyR2FYeEJ1NE1pcVh4SmVLd0Q3K1BwZXdEWWNz?=
 =?utf-8?B?V295em54RGpHUjE0TFplYkVLQkFSZTBhREs4ZDNPZjZPNDhuM2tXUVhCdUtC?=
 =?utf-8?B?UlM5OVBvTEFZRkJuWUxiR09Jd0FYUnp0MDdXZEp3MVZSNjBneVk1MklKTGZq?=
 =?utf-8?B?NzVyejNRSjRHVVIwanJFUG55NnNIRmt4VXNjOFI2QldaUzl1akQvcTdXNFQ5?=
 =?utf-8?B?NHZwY2VTb00rZGdRNHhOMWdWbWhJL1FuSDlUQzhUY3JybGp6cnpZaEN5YXB4?=
 =?utf-8?B?YU03eld0MG9sMytLQjI1djBXOHZXWmN4Y2hscVd1N0RmdXZsajFWNlZwMUY0?=
 =?utf-8?B?SkxjdURTNWlrdzFlRG84dDl0UDYxSG5oWGdUZkQwZUVNa2c0SVVrRXdOWll6?=
 =?utf-8?B?eVA0M2t3OERUNCtlVzdOb1ZqRjd3TGIrUlhYbW5VZ1pLSWlzK09RSEpqeXJJ?=
 =?utf-8?B?SlFnZ3ZQeGc2TjZYTDNuSUc3eExUV1piTEdmekI4UDFjM2x1VExwOG9TTk8z?=
 =?utf-8?B?eHFuNVo2QVVORzY0YWpoZnNSYWZZdXJ2cTcvN1hLcWFVVmRaQ2o2a2dXeFZp?=
 =?utf-8?B?OEhBR1RxYjF4WS9YMjlFVE1JWVA0MWw3T2NlR0dFd0pMdWNhWVRGd3JoNHRB?=
 =?utf-8?B?QjdEaUNTUjZtUE9oOWREajdSUSs2Umc2Q0pCL1pDZy9seDIyYnN1ZWJwTFpt?=
 =?utf-8?B?dmNySW5USW9NWjAwUCtDQjkvZFFMNmRXQ1NSLzdRVVJERWNNa0pXdVlxemJw?=
 =?utf-8?B?RXdTOXBvSTdDR1dKWU92UEdSd01ST2JEZVRaQzBKZXVCZ0FHRHpFNnhreFRn?=
 =?utf-8?B?OVZyMjFxZExnTFFVRnZyZXM3K2VxQVZwSUR6Y3BDUjF1a1ZmbDlHaUQweFFR?=
 =?utf-8?B?dkNEMnNtTkdacFJ4ZEF1UFl3UnE1NTJvai80R3puVXdPcWxLR1VyMkRNL0Za?=
 =?utf-8?B?SmpLNzB0NjdLUUJDLzl5c2ZXTHpPSHpqL01pZlBxR01Wdm9GREZtOGZ6RzMx?=
 =?utf-8?B?anc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	sLH7Km/6BZYgLnJdW5qWkVRPAitbIMQbNhZ8YCZJnj5G5mnoBIa/cffRnlFl4LTijZ4uA2OeJKFECCHgn60lW/7aPhUAvgLf7DhP8htFrLccSVaVWW+EFHFNY4kChYNcdM6tX1ANW3ZQFI8BMxx7OzvZWuYPZYzo9GEPQFIQ/MnZE2CJggbBTcExoeXWsTV1vEWg1kgvWkkrgaA5W5VS9IcLjTzSpWeFZsy7sx7NSZoiuV4HdUCxmVr8FU2llPO7N4MybwUVs9VYWTOwjhXN2vIs6p1ZB7i2i/P+S9b50nb4qxkusTOFn8jCH42RsVSCUJkEvvw+8E6VM4A/rLP7Qy2fsbh+Qf7nzL6oRqrlKXzLF7bsrhCrA89+W41Q0qDbWdd7elm15UDui9KPah401X2NjFBFIYTz4WeYPYOuDw1FCuIOpYXWzLaThLzHxvfUOqVkjKA2Nak8Zf027WQrxlP6J1ircQ3soFXjX9mwJeE2w/xl8T6ldLjNaFGKqCCckXw4M3ZM4Rm+4bnAMpKuX/pe3dRDbNwkaLuEE3R6Vn71JNVPF+PZ8d9gb48dQmR2rM/H4/DLdpmEK/+w9eNFuj4gzJn7EKdm/723ntYCjmPBfa5GDfiEa3VFaxRljg0QB/B2JckEoY+FpGGO6ewSoCleeylM99t67haAB1wdmcWIA6z9pSOFl4X1BGvC9xSOymtYWsDMEydnaq0UWFeSlIxVLCkOfkDxO+ICxFKmhIz1mscj48y90/U6ppBXYEFYtru6vRe/dFZzMB9h0iCHY0CvTo/gkltbn+CDcvORlXit8KB/BznY66g5qH4scKfgYts8qceS4ELk9o/AG1GnXIKgUdWtN3amlT5F+QcjfAhWN+dVjAWtkfzyN8MFYVSw
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4116d862-5bfc-486e-85da-08db18b3e9b7
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2023 11:15:20.5044
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gIzU2hv8Apfb4hoB8J4uOKAU4QOoiOzeg+GRb9P3LSEZizfo2d2zCGWUTjakdi5UuYgc/WXrpbgDOOc28u8tmBK5KOS7Nyr6MUJBWFCz3Q0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR03MB7107

On 27/02/2023 10:46 am, Jan Beulich wrote:
> On 24.02.2023 22:33, Andrew Cooper wrote:
>> But I think we want to change tact slightly at this point, so I'm not
>> going to do any further tweaking on commit.
>>
>> Next, I think we want to rename asm/hvm/svm/svm.h to asm/hvm/svm.h,
>> updating the non-SVM include paths as we go.  Probably best to
>> chain-include the other svm/hvm/svm/*.h headers temporarily, so we've
>> only got one tree-wide cleanup of the external include paths.
>>
>> Quick tangent - I will be making all of that cpu_has_svm_*
>> infrastructure disappear by moving it into the normal CPUID handling,
>> but I've not had sufficient time to finish that yet.
>>
>> Next, hvm/svm/nestedsvm.h can merge straight into hvm/svm.h, and
>> disappear (after my decoupling patch has gone in).
> Why would you want to fold hvm/svm/nestedsvm.h into hvm/svm/svm.h?
> The latter doesn't use anything from the former, does it?

It's about what else uses them.

hvm_vcpu needs both svm_vcpu and nestedsvm, so both headers are always
included in tandem.

nestedsvm is literally just one struct now, and no subsystem ought to
have multiple headers when one will do.

The resulting "unified" svm.h will have very little in it, but
everything in it (including nestedsvm) should be there.

~Andrew

