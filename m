Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E723365ADB
	for <lists+xen-devel@lfdr.de>; Tue, 20 Apr 2021 16:09:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.113751.216796 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYr4C-00010B-6D; Tue, 20 Apr 2021 14:09:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 113751.216796; Tue, 20 Apr 2021 14:09:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYr4C-0000zc-2I; Tue, 20 Apr 2021 14:09:28 +0000
Received: by outflank-mailman (input) for mailman id 113751;
 Tue, 20 Apr 2021 14:09:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Yi73=JR=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lYr4A-0000xF-57
 for xen-devel@lists.xenproject.org; Tue, 20 Apr 2021 14:09:26 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3cab99db-c0af-4678-860c-b9fc2fbe1bc7;
 Tue, 20 Apr 2021 14:09:23 +0000 (UTC)
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
X-Inumbo-ID: 3cab99db-c0af-4678-860c-b9fc2fbe1bc7
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1618927763;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=0s7aVVBVS2fLG2pkS1fRgQ/80/jj5QyxHMvZXbRPV0E=;
  b=BufJS5iP07+tn/7klwMJPVDpAAKMLV7P7ydmYAavOc3/VwK6s5UMidvg
   Bi+AobmPjShrzOkeI2CeahzNRAYE7Dy6dudyyXkt1IGW0nAOT+/MPMyEr
   XwoNbwQbpmTFjTj8cnMQrrU7ShLY5uXbTvQTPyCiadX+82zrVm6t1JWth
   M=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: tilQJMXij9K0GXUMIJGD/a+1WX3Zh0iW5BWtQccAQqBlZIT9zEwRMOl+s5HtAyJBgy16+jrgit
 nUIg0lur4NopJ3XnmvJMVHRnbymKwfVWu/DtCvcR7uSSLKoXkLxZ/BHFIJJHusI6cZTy2c0/JU
 A9PE572qIQEuQUDKCmqnVNlAul9N9laQlL/SSLK2FdjNE3wUDJqXxTLs54iZXJ7wu3mMdL8agH
 AljpeovIO9GJt1eZ7J1a+K6uwq6m8XhwiUO6OMS6kbBH3Mq9JZjsH3mOWg8GC4Y1gM2xgIh+aF
 9Jg=
X-SBRS: 5.2
X-MesageID: 42368653
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:IDnhf6tmfrwEyfF3v84ku8yQ7skC84Yji2hD6mlwRA09T+WxrO
 rrtOgH1BPylTYaUGwhn9fFA6WbXXbA7/dOjrU5FYyJGC3ronGhIo0n14vtxDX8Bzbzn9Qw6Y
 5JSII7MtH5CDFB4PrSyBWkEtom3dmM+L2pg+Cb9Ht2UQR2cchbjjtRICzzKDwTeCBtA50lGJ
 2Aovddrz27dngNKui9DH8JX+/Mzue76K7OSxgAGhIh9U2ynSqlgYSKbiSw8zU/d3d0wbkk+X
 XYiACR3Muemtyy1xO07R600714g93ko+EzZvCkqs9QETn0jxbtWYIJYcz4gBkQgMWCrGkni8
 PNpRBIBbUC11r0cnuuqRXgnynMuQxekkPK8lOTjXv9rcGRfltTYKAg9OEpACfx0EYusMpx16
 hGxQuixuBqJCjNgTjn4JzwXwxq/3DE0EYKq/IZjHBUTOIlGdhshLEYlXkldasoLWbR7YAqF/
 RWF8fM5PpaWkPyVQGmgkBfhPOrRXg9BRGAXwwrvdGUySFfmDRDw1If39F3pAZNyLsND71/o8
 jUOKVhk79DCucQcKJGHe8EBe+6EHbETx7gOH+bSG6XW50vCjbokdra8b817OaldNgj150pgq
 nMV1teqCobZ1/uIdfm5uwKzjn9BEGGGRj9wMBX4JZ0/pfmQqDwDCGFQFcy1+O9vvQkBNHBUf
 rbAuMWP9bTaU/VXapZ1Qz3XJdfbVMEVtcOh9o9U1WS5u3RLInHsfHabebzKLLhHS1MYBK8Pl
 IzGBzIYOlQ5EGiXXH1xDLLXWn2R0D59ZVsVIjWltJjjbQlB8lpiEw4mF657saEJXlpqaotZn
 ZzJ7vhj+eerWmy9mDY0nVxNnNmfwJoyYSld0kPiR4BMkvyf7pGkc6YY3pu0HyOIQI6aM/KDg
 hFpRBS9bisJ5KdgQAuYujXfF6yvj82njanXp0ckqqM6YPOYZUjFKsrX6R3CEHsDBx6mQFjrU
 9Zcw8aTkrjFjfj4J/Vz6A8NaX6TZ1RkQ2rKclbpTb0rkOHv/wiQXMdQnqTS8KNuB0vQDBVn1
 V11KcajNO76HGSAFp6pN59HExHaWyRDr4DKAiefo1blormfxxKQX6QiSaXjAwyfWTW51wf71
 aRXhG8SLXuOB5wq3pY2qHl/BdPemKRc1lZR1p6vYd+fF628Upb4KuuXO6ewmGRYlwNzqUhKz
 nDeyIVOR4r7cuwzgSplDGLEmgGyp0iMvfGNqkqd6je1xqWWcu1vJBDO8UR0IduNdjovONObP
 mWfBWNKijkT8wuwA6Yqx8eSV9JgUhhtcmt/hLr7GK1hiFiRdXTJUlrXLEdLZW36XP+S/OBzZ
 V+ipYUsIKLQxHMQ+/D7ZuSSThJbi73iyqRacoDrJhPp6I8tLdpBfDgIHP1/UAC+C97Fdv+kU
 MVfb9y77/AMLJ+ZsB6QVMtwnMZ0PC0aHYxugP4AuUCbUggon/SMdSO+afJo9MUczq8jTq1HV
 Ge9iFHls21Jxer5Po/C6gqJ35RZ1V5wHN+/Pmaf4m4MnThS8hzuH67OGS6arlTVeysHqgRtA
 9z55Wtk/WMfyT1nCDWsj0TGNMCz0+XBeezChmLA+hG7piTPkmNmLKj5IqLtwjMIAHLIngwtM
 libkwfbsNKlzkkgskW60GJO9PKi3NgtUBf7zFhnkPqwa687g7gbBh7DTE=
X-IronPort-AV: E=Sophos;i="5.82,237,1613451600"; 
   d="scan'208";a="42368653"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mDJsM29OGW7dknyQq0JtZV4q2jreQlTDwCeaXQHXYHZgqS8kcKuY/aGbbw6JKHMQz/HQrOQXQ3G4esXIOkx2xBkfr3EsNLkVR68vgr+kX1CYr1IhwHzYIECnNAJ/fGaQeAUTp3QrLrppZRWz3urY4VTEyAFIzEIAP7wZn2pIlZsCO1rBc/NG3yxqAJLDk0rXtd+mugKBNBhe7c2M1a4y13EJ1W2eWP2D8tcGDLX1S5KXCjIMUJDmM5N4ruCix1VjBrx4YscvuNbz2PglnPSXU+/LDCzVPMcmsa8Gq3kZ6KD5vs3ToOJWx6R1pVqC53KUC0bSp0sSEV4wa8K/9EVxPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WuvrOYUoKMt59jYrBDWLY98/dORJ+acGdZP4gZpz1qE=;
 b=fBKYCarmsg4M+0OgSsjFiYFvJdoXkSI76c0DrXi73YtiE/vg4q7gQ/Emqb2XZL8uKYLWEHJypbstTOBMMQpU2Ij/MwTE9pq5jGnrMTRVnBcTRb3L+0G9JobrmLRQ/4+91uWf01nZRHEGJ3BKtA2iPeRizl+iwQrOAYVfTh8xzz8nYPIyewcGKFXnZtilx0zYRZRRsuv92RL6j2VZ2LU+NnN6zloHiGoUULFcP+tubpxsm4elbR6fe+67/GI8hAdi57XPApmBcWjvtvR1qYVh9mjxohEDCJ//qE32ULP1uVHtfCgm/m/6+6e2Bh0SQNtXNjjItXsNoBgiMlwxBSvtvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WuvrOYUoKMt59jYrBDWLY98/dORJ+acGdZP4gZpz1qE=;
 b=J+al99CL923f2pPoNBVDPwF7HSTB7tjbJL2kubhE1FvUVQlOeBa2zBJpyK9CHy735xybmuOCfwlnfRS28oL0EUlOdQEOBDTiFQc8PIZlAxbrVrnUvQT0nUrg78j7h3nWNePuvVvBdPS8xj3xqFUeA+MmlFDei50drMZs1ZrncGY=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH v4 05/12] x86/hvm: allowing registering EOI callbacks for GSIs
Date: Tue, 20 Apr 2021 16:07:16 +0200
Message-ID: <20210420140723.65321-6-roger.pau@citrix.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210420140723.65321-1-roger.pau@citrix.com>
References: <20210420140723.65321-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0069.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:31::33) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fc0491ed-6857-410d-b4a3-08d90405e3fc
X-MS-TrafficTypeDiagnostic: DM4PR03MB6000:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM4PR03MB6000BF097ED7B606838694C88F489@DM4PR03MB6000.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: o822bY2QnQOlyMm4PJh6V4+Fn5jOb6uioDxSxc7GOeDsVN07idmFXntCSmFnVqgq9jYSuJX2HuPS1KO5CwcuW8wXyUaN78b5N45v9P6UbB3Lz3mSR/W5d1jzxwCEouVVN7UfJlDUVE4WYe25QdzsWc9XLl0GlHodACI2wANhdlaJ2HibgGK1LVVzGRH0kiECf4WneQltuiiLO0+2lgZY7EgWNFGhC7Jm58T+SSA5QVbJvW0ekDpmWH8S2lrEQmnHNzNrqEDI6SeCNUnYJhjq0B+QNk6M4Hg2yIRkfWlH7aIN8B7hayscxTqp/FxSBuqSPuvvKr7fsRM/utp+ANHZGgUaTxwrmmIlpJJLKE1HKdQlhOWnMsr3PkCpI+pOQGtfAmo68BsUwjhTHz6QexeTWq+j9wEnPukL3KwLDJ5i5srGeOxJh2sw8yXkt0wpvuaSjH1GerhOZf7LkWNRDtIhzlhxjGU2PA5a30s+2W+XnRmR74N37BHnvWgT1vyVtcFC8IZ5XmDtLpVoizTuMa2jTpgPuufUWONEd5kwgjCEliv31UDut2Yeiew2Et7n0JKW9ClVkf9xzz0KtBIkmTtYkqW5bjhKRtCh/E/lxtzIiFU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(376002)(39850400004)(136003)(366004)(6916009)(83380400001)(4326008)(38100700002)(16526019)(36756003)(316002)(956004)(6486002)(2616005)(6496006)(478600001)(8676002)(26005)(30864003)(186003)(5660300002)(8936002)(54906003)(2906002)(6666004)(66476007)(1076003)(66556008)(86362001)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?dTA1VlZRYVM3bUhUWU04eEFrREpOeDV4d1YrYXV2S1JzcVE4cnNZcld4RWJH?=
 =?utf-8?B?ajh4K0dIMmxYSVNZVzhUQ3YzRDlvVkJQUnFKbjN3K1I4UHdJa2VHNUQ5b2F4?=
 =?utf-8?B?ZzlpREFtOTh4M2lXU0xabmpGMndlSUV6TEVhN21mWlhBTEFnWmNadWRuK0VG?=
 =?utf-8?B?WHMyUHZFUXRCVjVFbFIzK0FqTHpqaXp6QysrNHc0ekhBOXZScTZGekxQTElE?=
 =?utf-8?B?YkhjMjV2elJSSHJmYWp1Rm96ZHhaM1lxM0F0Zmk3QXp2Rmx3Nk9NZzZVTFF1?=
 =?utf-8?B?NWFqK3dFMm9Ubk1xN2M1a01WaUZRL1ZBbjQwVk5Gc0liYWVUQTloakJMOUR4?=
 =?utf-8?B?ZWFvWi8yanI1Z0g3R0ltcUwyL0s4UGpQSGVUMVVDbkxqVmh6ejR4aGtZR0di?=
 =?utf-8?B?cTZUWnRZR3dRMkVUcG42YSsxcDg1WTIwaXRLSFBvelZXbGhkSXFYRVJ6ZGVv?=
 =?utf-8?B?b0dOVjZxZDlrMXVteFNCblFXOXRjNUpQVUNWazRwMnRsV0U5ZjRnd0JxWkJk?=
 =?utf-8?B?MFZoODZJUGtMN0N3RlVwdS9mVXZJcWdFck40WmpINVkrbnhzWDN5M0k1U2VZ?=
 =?utf-8?B?Q29Cb285eDY0R2JnaGVwVXNKZDh5RFByMm1jaVJFakhGL2hFRE5EZjhWNkNH?=
 =?utf-8?B?SkZncTRFcUxxK01LaS9nOUZwa0ljT2NwL1M5SXZwTXJ6VllzcExQczQvRkFq?=
 =?utf-8?B?VCtROHpjclRIZHo4Z2JyTmFOMXFVU1dRR20rdkRBV01aWU9nS2VXK21PcVF2?=
 =?utf-8?B?cFMrakxEWTdKbTdRTXJITmQwUzRVWlhXcUt1Q1VsK2RNV1c3RFRIekxyUFph?=
 =?utf-8?B?Mzk4RDd1TzB5WlZxclloZXMvalNOeG1Zakw2eG8xdnN6d1cvRDJneU1yUnFO?=
 =?utf-8?B?dzUwNGRZS2J4VnFZbHk0MjZjSDBkWGFsRGZVTGU2M0E3dWNWdDRrN0NHYnlN?=
 =?utf-8?B?VCtkOHdPaFBHcVZCVm94aEtoajlqdlZZNEZSeUIvQkl1elE4dDNnN0RldTZI?=
 =?utf-8?B?bnJqeVpSNjZaQ05hR2JndlZzUHJkRVRzUUkvd3lSblBOam80cEh3OTRLUHBi?=
 =?utf-8?B?TWs3U1FtMlV5MHNVOUJmK1RaL1luODJHbEdYK25ITTZ0am1uaWVDMURLY1Qz?=
 =?utf-8?B?TXUwQzdHVmlqTEkvYnZLb3NoYW1VRzE3NzVYTmttNlVsN042MTBtQVN0cld6?=
 =?utf-8?B?VDFUTlVkNWEzdHJvcTJPN2QzNXRqZ2pWZ2dwdVlFSDM5cXJoUTNxQ1N6dWE2?=
 =?utf-8?B?TjdDYXRjenlMSmZMS3RRUFQrNXhHUzBiaC85ZFB2VFNVVGdhTWlOMlVmdTJL?=
 =?utf-8?B?eTB4WVF5U2hhekpReXNtMytmbzdPVHhwcmhiYlJKM3ZNL2JkK3BOdmNZM3JH?=
 =?utf-8?B?VFliY3JoVmxLVDZoV2xuSEVGVmhXMUVsNWJIdTJDVS8wS1BHemY2Nis1Nnk2?=
 =?utf-8?B?SU95aGY4VUlQQW9UcTZwTmtNUGxqMllLWnJMYitrNlJEQTF1eFdDSUd0RGNH?=
 =?utf-8?B?L0dnNWxPRTdqSG12L3diQmxoOVdIUlJtalJQbEppektVb2JJcEF6ZDVjV20w?=
 =?utf-8?B?c0FxSm1wd09VOXlyQzVVWm1oYTBKYUV5dkU1eE8zSVRkUVhkSTlLa0lla3h3?=
 =?utf-8?B?dTcxRS9seG0wT2ZjM2Q2MlZ3NVNETFY2bTRSZy9qb0xnTFRGUmtmYjBmUTV6?=
 =?utf-8?B?cStIbGNtcXZ6SWdYUFVVYkNLUGFDQmxSckV3R3RKVzR4cThUa0RMZGxpUzRJ?=
 =?utf-8?Q?xH33IUcwDCwyXZUxvKjtc7piJJNDwNPrHsX5oqT?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fc0491ed-6857-410d-b4a3-08d90405e3fc
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2021 14:09:19.6948
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xU8tmMK840JauyIdZNkeTtL9ap38E7qx6/dnIzptd0ZuDNFnz+27PJ2GvYfpTU0UWTgFs1iXLgVBIQSg0ipl+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB6000
X-OriginatorOrg: citrix.com

Such callbacks will be executed once a EOI is performed by the guest,
regardless of whether the interrupts are injected from the vIO-APIC or
the vPIC, as ISA IRQs are translated to GSIs and then the
corresponding callback is executed at EOI.

The vIO-APIC infrastructure for handling EOIs is build on top of the
existing vlapic EOI callback functionality, while the vPIC one is
handled when writing to the vPIC EOI register.

Note that such callbacks need to be registered and de-registered, and
that a single GSI can have multiple callbacks associated. That's
because GSIs can be level triggered and shared, as that's the case
with legacy PCI interrupts shared between several devices.

Strictly speaking this is a non-functional change, since there are no
users of this new interface introduced by this change.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v3:
 - Make callback take a domain parameter.
 - Return whether the unregistered callback was found.
 - Add a comment regarding the result of hvm_gsi_has_callbacks being
   stable.

Changes since v2:
 - Latch hvm_domain_irq in some functions.
 - Make domain parameter of hvm_gsi_has_callbacks const.
 - Add comment about dropping the lock around the
   hvm_gsi_execute_callbacks call.
 - Drop change to ioapic_load.

Changes since v1:
 - New in this version.
---
 xen/arch/x86/hvm/hvm.c        | 15 ++++++-
 xen/arch/x86/hvm/irq.c        | 75 +++++++++++++++++++++++++++++++++++
 xen/arch/x86/hvm/vioapic.c    | 29 +++++++++++---
 xen/arch/x86/hvm/vpic.c       |  4 ++
 xen/include/asm-x86/hvm/irq.h | 21 ++++++++++
 5 files changed, 137 insertions(+), 7 deletions(-)

diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index ae37bc434ae..2c4dd1b86f2 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -608,7 +608,7 @@ static int hvm_print_line(
 
 int hvm_domain_initialise(struct domain *d)
 {
-    unsigned int nr_gsis;
+    unsigned int nr_gsis, i;
     int rc;
 
     if ( !hvm_enabled )
@@ -656,6 +656,14 @@ int hvm_domain_initialise(struct domain *d)
     BUILD_BUG_ON(NR_HVM_DOMU_IRQS < NR_ISAIRQS);
     ASSERT(hvm_domain_irq(d)->nr_gsis >= NR_ISAIRQS);
 
+    /* Initialize the EOI callback list. */
+    hvm_domain_irq(d)->gsi_callbacks = xmalloc_array(struct list_head, nr_gsis);
+    if ( !hvm_domain_irq(d)->gsi_callbacks )
+        goto fail1;
+    rwlock_init(&hvm_domain_irq(d)->gsi_callbacks_lock);
+    for ( i = 0; i < nr_gsis; i++ )
+        INIT_LIST_HEAD(&hvm_domain_irq(d)->gsi_callbacks[i]);
+
     /* need link to containing domain */
     d->arch.hvm.pl_time->domain = d;
 
@@ -715,6 +723,8 @@ int hvm_domain_initialise(struct domain *d)
  fail1:
     if ( is_hardware_domain(d) )
         xfree(d->arch.hvm.io_bitmap);
+    if ( hvm_domain_irq(d) )
+        XFREE(hvm_domain_irq(d)->gsi_callbacks);
     XFREE(d->arch.hvm.params);
     XFREE(d->arch.hvm.irq);
  fail0:
@@ -777,6 +787,9 @@ void hvm_domain_destroy(struct domain *d)
     vioapic_deinit(d);
 
     XFREE(d->arch.hvm.pl_time);
+
+    if ( hvm_domain_irq(d) )
+        XFREE(hvm_domain_irq(d)->gsi_callbacks);
     XFREE(d->arch.hvm.irq);
 
     list_for_each_safe ( ioport_list, tmp, &d->arch.hvm.g2m_ioport_list )
diff --git a/xen/arch/x86/hvm/irq.c b/xen/arch/x86/hvm/irq.c
index 38ac5fb6c7c..4825a387bdc 100644
--- a/xen/arch/x86/hvm/irq.c
+++ b/xen/arch/x86/hvm/irq.c
@@ -595,6 +595,81 @@ int hvm_local_events_need_delivery(struct vcpu *v)
     return !hvm_interrupt_blocked(v, intack);
 }
 
+int hvm_gsi_register_callback(struct domain *d, unsigned int gsi,
+                              struct hvm_gsi_eoi_callback *cb)
+{
+    struct hvm_irq *hvm_irq = hvm_domain_irq(d);
+
+    if ( gsi >= hvm_irq->nr_gsis )
+    {
+        ASSERT_UNREACHABLE();
+        return -EINVAL;
+    }
+
+    write_lock(&hvm_irq->gsi_callbacks_lock);
+    list_add(&cb->list, &hvm_irq->gsi_callbacks[gsi]);
+    write_unlock(&hvm_irq->gsi_callbacks_lock);
+
+    return 0;
+}
+
+int hvm_gsi_unregister_callback(struct domain *d, unsigned int gsi,
+                                struct hvm_gsi_eoi_callback *cb)
+{
+    struct hvm_irq *hvm_irq = hvm_domain_irq(d);
+    const struct list_head *tmp;
+    bool found = false;
+
+    if ( gsi >= hvm_irq->nr_gsis )
+    {
+        ASSERT_UNREACHABLE();
+        return -EINVAL;
+    }
+
+    write_lock(&hvm_irq->gsi_callbacks_lock);
+    list_for_each ( tmp, &hvm_irq->gsi_callbacks[gsi] )
+        if ( tmp == &cb->list )
+        {
+            list_del(&cb->list);
+            found = true;
+            break;
+        }
+    write_unlock(&hvm_irq->gsi_callbacks_lock);
+
+    return found ? 0 : -ENOENT;
+}
+
+void hvm_gsi_execute_callbacks(struct domain *d, unsigned int gsi)
+{
+    struct hvm_irq *hvm_irq = hvm_domain_irq(d);
+    struct hvm_gsi_eoi_callback *cb;
+
+    read_lock(&hvm_irq->gsi_callbacks_lock);
+    list_for_each_entry ( cb, &hvm_irq->gsi_callbacks[gsi], list )
+        cb->callback(d, gsi, cb->data);
+    read_unlock(&hvm_irq->gsi_callbacks_lock);
+}
+
+bool hvm_gsi_has_callbacks(const struct domain *d, unsigned int gsi)
+{
+    struct hvm_irq *hvm_irq = hvm_domain_irq(d);
+    bool has_callbacks;
+
+    /*
+     * Note that by the point the function returns the result could be stale,
+     * however the result is only used to decide whether a callback should be
+     * added when injecting a vio-apic vector to the vlapic and all users of
+     * the callbacks interface should always register the callback before
+     * triggering an interrupt.
+     */
+
+    read_lock(&hvm_irq->gsi_callbacks_lock);
+    has_callbacks = !list_empty(&hvm_irq->gsi_callbacks[gsi]);
+    read_unlock(&hvm_irq->gsi_callbacks_lock);
+
+    return has_callbacks;
+}
+
 static void irq_dump(struct domain *d)
 {
     struct hvm_irq *hvm_irq = hvm_domain_irq(d);
diff --git a/xen/arch/x86/hvm/vioapic.c b/xen/arch/x86/hvm/vioapic.c
index 1c2763fc2bf..0824ede91ab 100644
--- a/xen/arch/x86/hvm/vioapic.c
+++ b/xen/arch/x86/hvm/vioapic.c
@@ -285,6 +285,7 @@ static void vioapic_write_redirent(
             ASSERT(prev_level);
             ASSERT(!top_word);
             hvm_dpci_eoi(d, gsi);
+            hvm_gsi_execute_callbacks(d, gsi);
     }
 
     if ( is_hardware_domain(d) && unmasked )
@@ -410,6 +411,7 @@ static void eoi_callback(struct vcpu *v, unsigned int vector, void *data)
         for ( pin = 0; pin < vioapic->nr_pins; pin++ )
         {
             union vioapic_redir_entry *ent = &vioapic->redirtbl[pin];
+            unsigned int gsi = vioapic->base_gsi + pin;
 
             if ( ent->fields.vector != vector )
                 continue;
@@ -419,13 +421,25 @@ static void eoi_callback(struct vcpu *v, unsigned int vector, void *data)
             if ( is_iommu_enabled(d) )
             {
                 spin_unlock(&d->arch.hvm.irq_lock);
-                hvm_dpci_eoi(d, vioapic->base_gsi + pin);
+                hvm_dpci_eoi(d, gsi);
                 spin_lock(&d->arch.hvm.irq_lock);
             }
 
+            /*
+             * Callbacks don't expect to be executed with any lock held, so
+             * drop the lock that protects the vIO-APIC fields from changing.
+             *
+             * Note that the redirection entry itself cannot go away, so upon
+             * retaking the lock we only need to avoid making assumptions on
+             * redirection entry field values (ie: recheck the IRR field).
+             */
+            spin_unlock(&d->arch.hvm.irq_lock);
+            hvm_gsi_execute_callbacks(d, gsi);
+            spin_lock(&d->arch.hvm.irq_lock);
+
             if ( (ent->fields.trig_mode == VIOAPIC_LEVEL_TRIG) &&
                  !ent->fields.mask && !ent->fields.remote_irr &&
-                 hvm_irq->gsi_assert_count[vioapic->base_gsi + pin] )
+                 hvm_irq->gsi_assert_count[gsi] )
             {
                 ent->fields.remote_irr = 1;
                 vioapic_deliver(vioapic, pin);
@@ -441,7 +455,8 @@ static void ioapic_inj_irq(
     struct vlapic *target,
     uint8_t vector,
     uint8_t trig_mode,
-    uint8_t delivery_mode)
+    uint8_t delivery_mode,
+    bool callback)
 {
     HVM_DBG_LOG(DBG_LEVEL_IOAPIC, "irq %d trig %d deliv %d",
                 vector, trig_mode, delivery_mode);
@@ -450,7 +465,7 @@ static void ioapic_inj_irq(
            (delivery_mode == dest_LowestPrio));
 
     vlapic_set_irq_callback(target, vector, trig_mode,
-                            trig_mode ? eoi_callback : NULL, NULL);
+                            callback ? eoi_callback : NULL, NULL);
 }
 
 static void vioapic_deliver(struct hvm_vioapic *vioapic, unsigned int pin)
@@ -464,6 +479,7 @@ static void vioapic_deliver(struct hvm_vioapic *vioapic, unsigned int pin)
     struct vlapic *target;
     struct vcpu *v;
     unsigned int irq = vioapic->base_gsi + pin;
+    bool callback = trig_mode || hvm_gsi_has_callbacks(d, irq);
 
     ASSERT(spin_is_locked(&d->arch.hvm.irq_lock));
 
@@ -490,7 +506,8 @@ static void vioapic_deliver(struct hvm_vioapic *vioapic, unsigned int pin)
             target = vlapic_lowest_prio(d, NULL, 0, dest, dest_mode);
         if ( target != NULL )
         {
-            ioapic_inj_irq(vioapic, target, vector, trig_mode, delivery_mode);
+            ioapic_inj_irq(vioapic, target, vector, trig_mode, delivery_mode,
+                           callback);
         }
         else
         {
@@ -505,7 +522,7 @@ static void vioapic_deliver(struct hvm_vioapic *vioapic, unsigned int pin)
         for_each_vcpu ( d, v )
             if ( vlapic_match_dest(vcpu_vlapic(v), NULL, 0, dest, dest_mode) )
                 ioapic_inj_irq(vioapic, vcpu_vlapic(v), vector, trig_mode,
-                               delivery_mode);
+                               delivery_mode, callback);
         break;
 
     case dest_NMI:
diff --git a/xen/arch/x86/hvm/vpic.c b/xen/arch/x86/hvm/vpic.c
index f465b7f9979..ef668f3668a 100644
--- a/xen/arch/x86/hvm/vpic.c
+++ b/xen/arch/x86/hvm/vpic.c
@@ -235,6 +235,8 @@ static void vpic_ioport_write(
                 unsigned int pin = __scanbit(pending, 8);
 
                 ASSERT(pin < 8);
+                hvm_gsi_execute_callbacks(current->domain,
+                        hvm_isa_irq_to_gsi((addr >> 7) ? (pin | 8) : pin));
                 hvm_dpci_eoi(current->domain,
                              hvm_isa_irq_to_gsi((addr >> 7) ? (pin | 8) : pin));
                 __clear_bit(pin, &pending);
@@ -285,6 +287,8 @@ static void vpic_ioport_write(
                 /* Release lock and EOI the physical interrupt (if any). */
                 vpic_update_int_output(vpic);
                 vpic_unlock(vpic);
+                hvm_gsi_execute_callbacks(current->domain,
+                        hvm_isa_irq_to_gsi((addr >> 7) ? (pin | 8) : pin));
                 hvm_dpci_eoi(current->domain,
                              hvm_isa_irq_to_gsi((addr >> 7) ? (pin | 8) : pin));
                 return; /* bail immediately */
diff --git a/xen/include/asm-x86/hvm/irq.h b/xen/include/asm-x86/hvm/irq.h
index c4369ceb7aa..37b8d2ba8fb 100644
--- a/xen/include/asm-x86/hvm/irq.h
+++ b/xen/include/asm-x86/hvm/irq.h
@@ -21,6 +21,7 @@
 #ifndef __ASM_X86_HVM_IRQ_H__
 #define __ASM_X86_HVM_IRQ_H__
 
+#include <xen/rwlock.h>
 #include <xen/timer.h>
 
 #include <asm/hvm/hvm.h>
@@ -79,6 +80,10 @@ struct hvm_irq {
 
     struct hvm_irq_dpci *dpci;
 
+    /* List of callbacks for GSI EOI events. Protected by irq_lock. */
+    struct list_head  *gsi_callbacks;
+    rwlock_t gsi_callbacks_lock;
+
     /*
      * Number of wires asserting each GSI.
      *
@@ -137,6 +142,14 @@ struct hvm_gmsi_info {
     bool posted; /* directly deliver to guest via VT-d PI? */
 };
 
+typedef void hvm_gsi_eoi_callback_t(struct domain *d, unsigned int gsi,
+                                    void *data);
+struct hvm_gsi_eoi_callback {
+    hvm_gsi_eoi_callback_t *callback;
+    void *data;
+    struct list_head list;
+};
+
 struct hvm_girq_dpci_mapping {
     struct list_head list;
     uint8_t bus;
@@ -224,4 +237,12 @@ void hvm_set_callback_via(struct domain *d, uint64_t via);
 struct pirq;
 bool hvm_domain_use_pirq(const struct domain *, const struct pirq *);
 
+int hvm_gsi_register_callback(struct domain *d, unsigned int gsi,
+                              struct hvm_gsi_eoi_callback *cb);
+int hvm_gsi_unregister_callback(struct domain *d, unsigned int gsi,
+                                 struct hvm_gsi_eoi_callback *cb);
+/* NB: Callbacks are not allowed to modify the registered callback list. */
+void hvm_gsi_execute_callbacks(struct domain *d, unsigned int gsi);
+bool hvm_gsi_has_callbacks(const struct domain *d, unsigned int gsi);
+
 #endif /* __ASM_X86_HVM_IRQ_H__ */
-- 
2.30.1


