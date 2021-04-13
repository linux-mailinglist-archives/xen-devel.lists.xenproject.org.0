Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ECF735E0CF
	for <lists+xen-devel@lfdr.de>; Tue, 13 Apr 2021 16:03:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.109798.209627 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWJd8-0005ha-Dj; Tue, 13 Apr 2021 14:03:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 109798.209627; Tue, 13 Apr 2021 14:03:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWJd8-0005gt-8z; Tue, 13 Apr 2021 14:03:02 +0000
Received: by outflank-mailman (input) for mailman id 109798;
 Tue, 13 Apr 2021 14:03:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=51M0=JK=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lWJd7-0005gB-BP
 for xen-devel@lists.xenproject.org; Tue, 13 Apr 2021 14:03:01 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d74273ce-9fab-49c4-b216-cdc065d6f58d;
 Tue, 13 Apr 2021 14:03:00 +0000 (UTC)
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
X-Inumbo-ID: d74273ce-9fab-49c4-b216-cdc065d6f58d
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1618322580;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=JackXKtu3s4tq3Ai8UONDkNKZ36QopXBh8RsfgQrQMM=;
  b=bvkEMSWIpf+eqAWHvyk7yRy+AfkHksIf8ycrfqGLYoMSg71QlOjvgycx
   MRgq1hluWdnUly+Pj17QowuwiEqdy99x/UU8dgTauO3Xt1vrYR/B16I12
   qAmO+oGIZ5YjtVcesd7DU+rH+cijJK8PjMupxi/kpJedZXoLn0sHJxDMe
   o=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: LD/cCgzU20nEzbpxCDgNVbICS5WNqeiSyyqTo6PDtO4Z9Bwbk9Z3s5R1EU0QsipCkVHlLndAv1
 5XbpOlpILuTnalg0XQ7a+cgvjX0+OvjQ2YA2E0WdrojmwBMzby3vmHSAE9JG8LQSIvT/jBUdp7
 lxhhDl6DmoIPkEhrb/brB/3bsvlOPCz3zH1pyoPVHx58AZyFm/HkU21yre+2ouxEdpewNlJnCC
 Mh9M+7lcodjEk8p9sZgJ1odEwSEtNCbQqOfpjr9OtD/rnqb/5o0iGbC6U48X6ucK78O8Ax0A59
 +8M=
X-SBRS: 5.2
X-MesageID: 42956030
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:T0IZcKhMHAzHEeHXjV0CZE9l83BQX19w3DAbvn1ZSRFFG/Gwv/
 uF2NwGyB75jysQUnk8mdaGfJKNW2/Y6IQd2+YsFJ+Ydk3DtHGzJI9vqbHjzTrpBjHk+odmuZ
 tIW5NVTOf9BV0St6vHySGlDtctx8SG+qi0heHYi0xgVx1udrsI1WZEIyywe3cGIDVuL5w/CZ
 aa+457vDKmY3sadYCWAXMCUujFqbTw5e7bSDQBAAMq7xTLsCOw5NfBYmWl9zo9cxcK+7ct9m
 DZjxf0j5/Mj9iXwgLRvlWjiah+t8DmzrJ4da6xo+gTbg7hkwO5ILlmMofyxwwdhMGKxBIUnM
 LXoxEmVv4Dm0/5Wm2uuxPi103B/V8Vmgbf4GSVi3fivsD1LQhSY6Eq5fM7A2nkwnEts91m3K
 VA03jxjessMTr6kDng/N+Nbhl2lyOP0AsfuNQOhH9SW5Z2Us43kaUj+ipuYfI9NRO/woUmHO
 5yNdrb9fZbfHiLBkqpwFVH8ZiCWG8+EQyBRVVHksuJ0yJOlHQ89EcAwtcD901wuK4Vet1h3a
 DpI65onLZBQos/ar98Pv4IRY+SBnbWSRzBHWqOKT3cZe46EkOIj6SyzKQ+5emsdpBN5oA1go
 79XFRRsnN3U17yCOWVtac7sizlcSGYZ3DA28te7592tvnXX7zwKxCOT1gojo+Jv+gfOMvGQP
 y+UagmQsPLHC/LI8Jkzgf+U55dJT01S8sOoOs2XFqIv4blMYvvmuvHcOvCBbbkHDo+M1mPQE
 crbXzWHoFt/0qrUnj3jFz6QHX2YHHy+pp2Dez78oEouc0wH7wJljJQpUWy58mNJzEHmLcxZl
 FCLLTulb7+gWG3+G3P/lh4IxY1NDcQ3JzQF1dx4SMaOUL9drgO//+Ff3pJ4XeBLhhjC+TbDR
 BYvFYy3a6sNZSfyWQDBrucQyynpkpWgEjPY4YXm6WF68ugUIg/FIwaVKt4EhiOMQd0lwZsoG
 JqcxQFWUfbKzPrhcye/d8pLdCaU+M5rBagIMZSp36an16bv9sTSnwSWCPrbdSamj80Rz1fhk
 R49ogWhLboo0fpFUIPxMADdHFcYmWeB7xLSCCIfp9dlLzQdAZsdmuSnjCBhxYvem3lylUKig
 XaXF6pUMCOJmAYlmFT067s/l8xTGmbck5qQl1RsIF2Fw39yz1O+N7OQpD2/3qaa1MEzO1YDS
 rMZiEKJBhyg/qt0gSOpTqEHXI655knM+DHFo4/e7XL1n7FEvzPqYg2W9tvuLp1PtHnteEGFd
 +FcwiONTXiFqcH3ReWqntNAlgDlFAU1dfTnDvr42iz0CRhXb78IFF6S6oaJN/ZxW7+XPqM2I
 h4i9VwnebYCBSEVve2jYXsKxhEIVfvhETzaccCg5Vdp7gzu7t+BIOza0qB6Fh3mDEFaP7pn0
 YfSplh6L/POoVTb9UfEhgpi2YBpZCqFg8XqQT4De81QEE1g1LaN92P5aDUqbBHODz3mCLAfX
 2W8yhQ5J7+LlO+/I9fL6I7OmJNbkcgrFxk4eOZboXVYT/aPd1rzR6fMnWndqVaR7XAMbIMrg
 xi69XNu+OMbSL31ETxujR8S5g+vlqPcIeXAAiWH/RP/MH/EVOQgrGy6Mr2tQzJc1KAGg0lrL
 wAU1cRYMRFgiQji4Ny8hHacN2JnmsV131E4T9mkVbx3JOB+2mzJzAeDTHk
X-IronPort-AV: E=Sophos;i="5.82,219,1613451600"; 
   d="scan'208";a="42956030"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ndQWx12gb9xkL2GKqeL3NpeARs48k7hLbpNcwk5sEAnOrAH/6CNEiqgHWJ2JKBwrocnNULp4An71EFLVvdDE2xFfUejnZfjfT5qFbZXySOZ3ib+nWehsDf8dVnE4Dk8oHoBKF8gel+IyXcdhfus9rvpnV9Q41JySXvKU9+BJ4B+Ij8lch92rcsmRwaQVaklCLdiKUfV0GJzE2q7Thx8fT+ZvZhNYGKwPEv7TTAMBLoPuhyRpFWAo1D+M4q8MZGDPb0kh2c5CR4ThcDRdWYjrnKGMzZgrSvckBc6398bwhsnh17RffNCRo5host+px5DDiiwVpPQVehTi8vYiq409NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hKIl+cZikbO/4WJIAGz+bxYAoaTNWAIK2jf+mYY0UCM=;
 b=OWJQpY6jCTciNieYCrLfl7LWvYD+ngeTTrArie6Jhj1UY5e9i0pskFgwDE4ZFJ9UCdvXYTzTYNWPBexneu78R6WGo6jUqktex5TZnRrSEwcSEluwMNqJuzDU6cNv79zu63IJW6eM56NpXJDZaVJKSm64WdUkn5peZNwYn91fHpYgc2LuQPOz/BBcn43rxYUBVYo6Sm/qkijnXsYVV6bCiGnjASC2XCTIPlrov2RGsdH1vGVetxGBRN8tXkCx6AZVK/ko+sko6eoJRmkWulnFVQuidhCKcSB3r9z0NnYhr8/BfXJ9xn7+IbWtdAz56whI/hxZ+b7bMNe2d3vOLFogvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hKIl+cZikbO/4WJIAGz+bxYAoaTNWAIK2jf+mYY0UCM=;
 b=iJfSfWWvXa8cTWHaS2XtydeYO1kTKtb5TZZNJPvMtZYU76hxq+38pBa3YBcJ5F5oa7+Ez8IkspvJA1b+vSGa7vCqQEWqEpgeQ+rDRAt4pELOYqjjrrs7YL33jzBpv5OJrg4YtRDfqcnwE3iQ5fMAnokF5jNjaVwwIq5CLEMGbcc=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Roger Pau Monne
	<roger.pau@citrix.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu
	<wl@xen.org>
Subject: [PATCH v2 11/21] libs/guest: allow fetching a specific MSR entry from a cpu policy
Date: Tue, 13 Apr 2021 16:01:29 +0200
Message-ID: <20210413140140.73690-12-roger.pau@citrix.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210413140140.73690-1-roger.pau@citrix.com>
References: <20210413140140.73690-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0097.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:33::13) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 11df82a2-ed1d-4bc8-161a-08d8fe84d707
X-MS-TrafficTypeDiagnostic: DS7PR03MB5542:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DS7PR03MB554256B3A5233FD9DE801E7D8F4F9@DS7PR03MB5542.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QfpM/52ErScc9XWldGLD/ep+j1i1s8B6dJCe6IWKUmFBuMBT9OC15imF/TTXe8rQGOXNtfyRdJGzIK8atK4MKateV5BieaSsODa2T/0nqXQklFDwFW6cslTGsJArA7lYvj0v9jDrbiJ7hFa4aE5yGKAGRHxcLcVfKxiBjmOXXp2S8xS3SggbGgHi7KnUdtrOrBgvt/JZavkuDhm725VuAxubvpogyGK57WvuRooBDj6lPmOS4OzJ3mOyifDsUavzqhHkggE9A8HlgSpz2bAIqLZJZf6K61SiPEBj87WJXXri3IijLEs82Nve33+gBiqXtp92PE7mt7DSMOKzUocEcoqzGCH1i8QK4sJnE9mfAe/3bZ4cdbk63KC8TOwyN1jEnekD9vGLiQKrubXRyOl47ydpZrsWnipVIs+VHiXIlgqyvUBy6fBe9D1HFAp7gsBEoVzh5/TwzHn1DU8nCJ9yzgwEXxbhoUBkez5B6fLNxFvwLZiSxcQvL7q2iJDyU1EzwaDxKsnvK2DRr7sdC4dC9KJr0S9E4p9iiA1ckz0X2I3j5U/A4RqperxUVp3FSShv6Nl7XlAV5h3wBPNuYVPF/w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(366004)(39850400004)(346002)(376002)(2906002)(6916009)(6486002)(36756003)(66946007)(54906003)(1076003)(6666004)(5660300002)(66476007)(316002)(66556008)(8936002)(478600001)(186003)(2616005)(16526019)(86362001)(6496006)(26005)(38100700002)(8676002)(956004)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?SXRhNjRjWDhCOWpFMHNXd1BZYS90S3JGWUFsQ0VibHBBMEtTR2kyenhWQi9R?=
 =?utf-8?B?MnV5NkhoSEh5a29JNW5RdTYxZk83ZGxpaDJnbnN1WFRaeG5tRytnckpBQTNx?=
 =?utf-8?B?Y0V2R0l0N3JadTBzWmlac3VnR2pvZk10R3BZMVdqUGgzQnpDbmJEMUVLTDdJ?=
 =?utf-8?B?NWRpbWpObUNzeW9DNG4rZUpQUkVKN3B0SkdUdUd1UnpvaDdvZTZuU0RBN0d6?=
 =?utf-8?B?NFAwTDQvdnpSQnR0UWM3Tm1lNkxpS3QxTEJrT2wzN2JqSjVUVGlBLzlORndB?=
 =?utf-8?B?amZlNVpLdG1QNE5nMStVMTFYYmZIa1I0S3E5TDlhRGRRKzdCbGk3WVVxbG51?=
 =?utf-8?B?ZDdObmRMak1mUytDbm9VOEhsYzhBbDdDYi9keWVpdnBzWS83NlJnSlRhQi95?=
 =?utf-8?B?d1dIdU96b2JXZlp0U0J3RWVsUy9qN1JCQmZBTFZ1cTJUZTE1a0dMOC9xMTht?=
 =?utf-8?B?eEdMUWpVeVljcG9nRjQyVzlsbkw2VkNVRUp0Q3RyR0d6ZkViT1VUc3JCUko1?=
 =?utf-8?B?aXZNZ3Q3bHkyNHBYbHE4MVJsMlUxcEhNQjlrUFZkbWlIWGM2VzVJQkFDSWFi?=
 =?utf-8?B?V3N0ODQzUEhnRjRJdFo0alAxdUdmaE1vMWZBYVZlMDRJRTdYNHNNTWZpK3FX?=
 =?utf-8?B?QVlZZ2NpQzVWcm82ekRNR3gvSk1lT3h3aDNlcXNxOThybHJGVjBMT0ZOZGdm?=
 =?utf-8?B?b1BvVkN2Y3dsaG4wVVY2N2FoK28rUDlYSS9ma21vcGZ3aC82K2xCMXp4clk4?=
 =?utf-8?B?b1NucXJsd1hqT1RzNVBERkNPQndqb0NLUjgxTHBuV2I5VjJsZkdERjQwa01s?=
 =?utf-8?B?b0Z3dEZzTUhCVUM2SlVta2hLd2NGN2ZidUdFOXdsZXdUSnpmUjJ1bnZ1cktM?=
 =?utf-8?B?R1k1QVpjaTByMG5JLzFZazJSWFNUdzVXZURMZGpxbGxDbTkyZTVsOHJ3cUNx?=
 =?utf-8?B?RTZtZ3NaTXNXbVVhUnpyRWlFd2NsNVBLQkRYNHpmeGdhODd3RmllL0VDUSt4?=
 =?utf-8?B?dEQxRG9nbjdES2J2dVF1RXdybHZFMG80THJDeWVDMUhkVjJDcWdycm1uZHBw?=
 =?utf-8?B?Q2dsV0hyQityd1dBK3pvaUVtTVhqU2VIRm5IL01kam9LajBldE5tWWF2Qldq?=
 =?utf-8?B?L2J4R0dTNVMyVmxzQWpnRU41dmNJWG9CVnZlVlZxNStDSlY3OE5jSlZnV3Vx?=
 =?utf-8?B?c2FMOTNWNVRVd0tGZS9ldUJYbGhDTG1GNHQzbE5Eb210Z24wTi9mNlgwaTBp?=
 =?utf-8?B?eVVJS2EyOHZaT2E0Si8xRVc4TWE5VHk2a0xacWtydG0vR09qTHpFT1VTT0hp?=
 =?utf-8?B?b0ZpcG9ISmNSaXdhcWY2RXAzbDlDcU9La0FGak1RWU5RQnJ2RDlzSmpsNVRQ?=
 =?utf-8?B?Z1pLTit0SENJWXMvN2N5Z1ViVUNYeXcwYTI2Sjl3dlpnU2lmc2RVaGJyb0E0?=
 =?utf-8?B?cFJFQkpteFFlRmFIZUZ2UlZ2L0l4RGlRQ3RJTFRiZ0VscWJJS1JLUTg3Yisv?=
 =?utf-8?B?SFMxUUw2eXNMUGNPU2RnUkF4NDBINVppZHRjb3J5dGlRWVZtdHQ5ZU9iUjdS?=
 =?utf-8?B?aXZvZnlURHNrTTI4SGwxeDE3Z05CM3ZiS0ZwU3RHL2hiRFZIS0xwNTVmUWpi?=
 =?utf-8?B?cVQweitqQXVCRHNhU04vVjhNQlg3cUUyQU9ELzhYMm4vWnVjOWZhNkxaQUhW?=
 =?utf-8?B?cXYwelQ3M3pDelk1dFY1blVETmQrYThPM0RkR3VKZEtHQU1mZGR5Z0lZUzh2?=
 =?utf-8?Q?40r+TJXI9ScOmF6d/PXWr+Tu6pHgBYG/tgNUNkY?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 11df82a2-ed1d-4bc8-161a-08d8fe84d707
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2021 14:02:57.1685
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GikvOeyyGXHpjAnq1J/cbYN1eHXKBeFMbZBMxwCnnXEdfQhc1+eEH8y89ekphtv8v5SQ0OG968DIbSG+OnluxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5542
X-OriginatorOrg: citrix.com

Introduce an interface that returns a specific MSR entry from a cpu
policy in xen_msr_entry_t format. Provide a helper to perform a binary
search against an array of MSR entries.

This is useful to callers can peek data from the opaque
xc_cpu_policy_t type.

No caller of the interface introduced on this patch.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v1:
 - Introduce a helper to perform a binary search of the MSR entries
   array.
---
 tools/include/xenctrl.h         |  2 ++
 tools/libs/guest/xg_cpuid_x86.c | 42 +++++++++++++++++++++++++++++++++
 2 files changed, 44 insertions(+)

diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
index cbca7209e34..605c632cf30 100644
--- a/tools/include/xenctrl.h
+++ b/tools/include/xenctrl.h
@@ -2611,6 +2611,8 @@ int xc_cpu_policy_serialise(xc_interface *xch, const xc_cpu_policy_t policy,
 int xc_cpu_policy_get_cpuid(xc_interface *xch, const xc_cpu_policy_t policy,
                             uint32_t leaf, uint32_t subleaf,
                             xen_cpuid_leaf_t *out);
+int xc_cpu_policy_get_msr(xc_interface *xch, const xc_cpu_policy_t policy,
+                          uint32_t msr, xen_msr_entry_t *out);
 
 int xc_get_cpu_levelling_caps(xc_interface *xch, uint32_t *caps);
 int xc_get_cpu_featureset(xc_interface *xch, uint32_t index,
diff --git a/tools/libs/guest/xg_cpuid_x86.c b/tools/libs/guest/xg_cpuid_x86.c
index d146c5bbc99..a4307d50ddb 100644
--- a/tools/libs/guest/xg_cpuid_x86.c
+++ b/tools/libs/guest/xg_cpuid_x86.c
@@ -845,3 +845,45 @@ int xc_cpu_policy_get_cpuid(xc_interface *xch, const xc_cpu_policy_t policy,
     *out = *tmp;
     return 0;
 }
+
+static int compare_entries(const void *l, const void *r)
+{
+    const xen_msr_entry_t *lhs = l;
+    const xen_msr_entry_t *rhs = r;
+
+    if ( lhs->idx == rhs->idx )
+        return 0;
+    return lhs->idx < rhs->idx ? -1 : 1;
+}
+
+static xen_msr_entry_t *find_entry(xen_msr_entry_t *entries,
+                                   unsigned int nr_entries, unsigned int index)
+{
+    const xen_msr_entry_t key = { index };
+
+    return bsearch(&key, entries, nr_entries, sizeof(*entries), compare_entries);
+}
+
+int xc_cpu_policy_get_msr(xc_interface *xch, const xc_cpu_policy_t policy,
+                          uint32_t msr, xen_msr_entry_t *out)
+{
+    unsigned int nr_entries = ARRAY_SIZE(policy->entries);
+    xen_msr_entry_t *tmp;
+    int rc;
+
+    rc = xc_cpu_policy_serialise(xch, policy, NULL, 0,
+                                 policy->entries, &nr_entries);
+    if ( rc )
+        return rc;
+
+    tmp = find_entry(policy->entries, nr_entries, msr);
+    if ( !tmp )
+    {
+        /* Unable to find a matching MSR. */
+        errno = ENOENT;
+        return -1;
+    }
+
+    *out = *tmp;
+    return 0;
+}
-- 
2.30.1


