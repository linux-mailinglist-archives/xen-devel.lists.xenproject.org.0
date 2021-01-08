Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE2902EF4F6
	for <lists+xen-devel@lfdr.de>; Fri,  8 Jan 2021 16:38:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.63650.112980 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxtqa-0005oP-Jz; Fri, 08 Jan 2021 15:38:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 63650.112980; Fri, 08 Jan 2021 15:38:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxtqa-0005o2-GN; Fri, 08 Jan 2021 15:38:40 +0000
Received: by outflank-mailman (input) for mailman id 63650;
 Fri, 08 Jan 2021 15:38:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mh2R=GL=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kxtqY-0005nn-VP
 for xen-devel@lists.xenproject.org; Fri, 08 Jan 2021 15:38:38 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f5943130-fa7d-4714-9c3a-37d01459ca4b;
 Fri, 08 Jan 2021 15:38:37 +0000 (UTC)
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
X-Inumbo-ID: f5943130-fa7d-4714-9c3a-37d01459ca4b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1610120317;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=5YEX6s5rI2F6DIQzKmPkrm9MhsBW98z9G5KbGvBH9SY=;
  b=RGd4zgGOamHbsi6XEhns3BRixJRZd64NoEZc9BsDzUPMYBOfbmNGobCl
   YgM3n/7a3Z0soKOESugOwi+t9mH4060W4KUMUsE6Yg99nOHaPffw+aK/3
   MM/QCna3EiZBXaYd/VaFUC8akEFWML8Pz8cstdBFMJYC3N4oucirSbSby
   8=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: MaV1h2Ot5W3i2Nu0a/XqNz3O+zEkBL4DPSVhD3d6Oqrle3BeB+qZMq2rM3UAtf8WoBtCT6jqtU
 B8S7WSqKrQR1Bfg82s44SuSJc6mj/YBiNFjL95rFeCwW0Ay96c0mh4leJiDemzzvqRqPec1w3+
 DkbOFYU25gqo/cvRRA50Q0Byc0CIUPm1mYKLdFmfRprrzvt6pyBeBoUq1nYKmUHVnqbRGX8oWt
 NcYK10h3A4FH9AXa3BzsooFt5Omt2GV6hA1CZTqzRpPGCI/LIasDIejdd1jULbPTtwmkHcaWAj
 fGQ=
X-SBRS: 5.2
X-MesageID: 34710227
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,331,1602561600"; 
   d="scan'208";a="34710227"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UnD725JCmin/gzupC5niDFAvBwEcNn43N2XISnOEd8rOkBHTgblw4uENZWkoE2hCJIX6WIxsT/jBASzh0o1QEt8azWhWkQcRJIzPfibWgHHcfE1JNjpYKNdE4+/iZrrgOzTJqPbHfJWsIvXzQOLxUfR3hES3sr6+T2M3aFL71NAfA6BsVH00eXHupdD0AUUNeVbKwWkZGwGMKoTKWXy27pNLpTh8KYqtiewPiJvDOVZ4dSS7tg9CAdQNGVH/1xBhCayFSvzJf6bypqP5aNSMVYCMSmuIVtC7/ecb5LZjM6QSu/3dTps7lMma62tC9SiWBkqpRGmtxlwuhZfh3ujfoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oL8nIqqTbXjIE7TbilB8EyZ9oVa08ewr2MVRgYVq81s=;
 b=GmkXurMLXAHSwzViCcsbpsiVqUrk/l+dxmUcXgJm0o+/UPlWzZ/sEEfOxvBR0iiWPkKPgU6VN2LP9nESVKdtYabKhvAiK0KJc+iG+8IWXbuIE9N0G9LEQVUBUqqRSe/xSgBOU/ZYiMrz4u8yRYtab3rieOtGSoXMrP5zAv+sDjmiQryxulDH9XgV1Tjl6PBMxrsAIt5irqL8aNODGY1IbxALkcJ9QO5zS5+yRpAlxKWK8WI7MMUikoSqxMW1hnfejATF46/NS/+DUgYsQ7+pml31/WI1xvgFFtxc1vuarU0dpe1nKSmFEqOoztk4jclbLm6gkk5UWZXOagbQYBFt9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oL8nIqqTbXjIE7TbilB8EyZ9oVa08ewr2MVRgYVq81s=;
 b=b2pmGntU3tA+nF6OjZU4LcbUuB1ocddBPSsO04AT0vtyo830hU25y85gapNzpCnTS9QBYeUDl7ITVgb0v/etrQbKgsVuN5lh9go4SC0YSb5YdO2ASxwHf5p/rl7GD+Ig7RC0uRKejiQryejYwVTrI8pfnzC5gkbSugmTpsHaMZo=
Date: Fri, 8 Jan 2021 16:38:27 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, George Dunlap
	<George.Dunlap@eu.citrix.com>
Subject: Re: [PATCH v2 6/9] x86/p2m: avoid unnecessary calls of
 write_p2m_entry_pre() hook
Message-ID: <20210108153827.yk7mdog57m3jnis3@Air-de-Roger>
References: <4b63025f-164c-2e93-3d54-7a7f145ad046@suse.com>
 <3386a823-5560-9cf3-5711-219d5bd0e54e@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3386a823-5560-9cf3-5711-219d5bd0e54e@suse.com>
X-ClientProxiedBy: PR0P264CA0251.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100::23)
 To DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 64bcba6d-b659-48a0-bef6-08d8b3eb74b7
X-MS-TrafficTypeDiagnostic: DM6PR03MB5324:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB532489CA4DC82F011D769C4A8FAE0@DM6PR03MB5324.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jreFknrWpB5QvLHQ9wHtQQgCjSki9J7XRMW83dVAHWhxO/zCZL3eRwyBeHR90/AtgTbOSebk+3u+scHQS7ECe6131aZJLbmySxdhuPh0u2FGROVPeelz3g0C7cLSa/jF6clMbk7bq6ppXqt3YgQZNk6zlPKwkSgb9+AJk38HlGFkDJLtwwHqre+x9BO0cFuo+9bzrVqJdszqgiy1DuGTHQX740w54ku40YlK1E4E8oLQQAOJS+YWy4pTtsmdgDlndvOVFs5NqOOg5vtoIyp0W2WI1NVvgR1wHh2oavPA9MFdwe0/KUtezoFx3Kqprm86726A44wHuvCR4YHyAoAuCxZCpEu5dY+aFvDuZzFy8HIy3R9d0thNyyc0n5qRAH43QFcRFiwE8zZ4dbt0WTQq9emL6Sf3zz/Bt1wvMNvaF7KJ3Ypx46OT86w7F4FAKcfT
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(376002)(346002)(39860400002)(396003)(366004)(136003)(956004)(8936002)(107886003)(66946007)(33716001)(9686003)(4744005)(16526019)(66556008)(2906002)(54906003)(66476007)(85182001)(6486002)(6916009)(83380400001)(316002)(5660300002)(478600001)(8676002)(86362001)(6666004)(4326008)(6496006)(186003)(26005)(1076003)(70780200001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?T21Hc2xhVkJ2T2dnNkxPSTNWT1BUUEEvYlZvSTg5TXNFR0lvNHFGK0lQT2Fw?=
 =?utf-8?B?aDNDK2xIQUdkU2RnMjJ5WTNRdEwvWnhHd01seHByM0poWVU4cjNRN1M3NGhU?=
 =?utf-8?B?RG5zQkZJQ0NXRGE1ZktTbTZ6L0pGbDBIamdHWFRFZG9PQzIyalorTldiSXpp?=
 =?utf-8?B?dzJUNFpPWWtoUDRXcVFzMFgyNE9kc0s5a1liTVYwSi9KUEo3MTQ0cU8rUjYz?=
 =?utf-8?B?S1RCeXMyWTlIdlhHUjdIcnhEUGU0ajdPa2Z0TklUcVRJYnJtSHpNdnRsYjVH?=
 =?utf-8?B?RDdtdytKdHd4bTJxUllaVy9RZ1ZBOFV5azdTRGhHZi8wQmxpbFJzZm96VGJX?=
 =?utf-8?B?LzU4QW9CR2gyTTVpOUlMWE5ocUxCdklZaHdYSUliVUdINnhnTnJ4TVViVU81?=
 =?utf-8?B?UENaODAyRFdtQUZ4ODdUMVBiSTBUU1VsRFZXRWhpVmpldks4Z1ZKRTlSZG1J?=
 =?utf-8?B?QzZmcVcyVm9DT0tOUmY5Q3pnc3lNM2JYd0RCekQrZWlGRkVsQ2VhUWJhYXhW?=
 =?utf-8?B?ZTFIY2ZqTzM0dHB0bGVJL041eUFjK0F4U1ZkRU84MHp2YTdLSDBTaCtHMmM4?=
 =?utf-8?B?LzRtK1ZxZ3RmcTViUzFNRFByaXkxMUIwRHQvaHlUc0hkSXIrUWxQajJnOTVM?=
 =?utf-8?B?WWJRSzVBT08ySWo5blVQajVDZm1qOEVrSVVoQUNqL2YvY0ZMODJCRlRhaysx?=
 =?utf-8?B?ZVEvZitBRDFiTFJLaCtUZUEvMFF3SkhVNTFxS0U2cFpKbjBMVTN2N2tqRm94?=
 =?utf-8?B?L3RhTTlXY0RNMnJSa251MEh0UGt4UUVxQ3grUlhEclhwRWlYdWxUQnc2a3Vo?=
 =?utf-8?B?Q2dYWTJleVJBMStMckZxNXI5MDdhckk1d0RNUkQzV3YvSlFyd3ZOcDY0NkZ5?=
 =?utf-8?B?STBoeUZGZjFkeEg4b0RXMG8zZzRwOFo2cDM3bDA4NFRqRVZKTG9uWHNzaFk5?=
 =?utf-8?B?d2RWc1NwOW1RdWk4VUpRNEJSUVhxcyt0aGd3bnAwbEkrUm9LNGhFMCs4cDVX?=
 =?utf-8?B?V1FhZWp0RnZBVDc0TEZFN2FqcUVEUlo3YWZ4bmVRTXp5bEEwVld3Ulp1ekI5?=
 =?utf-8?B?d3RycXdPczFKS2NOU2JRWC9BRlFaa3BsZ1oyMXFJVXF4aUpmS2NFRldLUXFT?=
 =?utf-8?B?OVhSZXZVN2trckJQY3F3eVlJSklWSVd5QVBmYUxOZkM4UkdyL2NQdTFuaUMy?=
 =?utf-8?B?Y04vR0k3bnJ3dkVuZEFJM21wR2hRL0hGY2Nxb1hKcVIxRk12eHdPUlpmemp5?=
 =?utf-8?B?T3Jpa2hWUE5NMjRUMWFSbUJPbE9MeFRSSUIxSjJQdHUyelYrcHNzZVpXMllj?=
 =?utf-8?Q?sAKef9bp5Wskgh6b9WOVYzy7KqWQf9TWoF?=
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2021 15:38:32.4902
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-Network-Message-Id: 64bcba6d-b659-48a0-bef6-08d8b3eb74b7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UaodM/ZLiIh8SW/SbAUR5tiDHG99j7tCX6jQTy6/VL2DlVDN6+QLA5+pCE/uv8Geeg3XFwD5Zik2y7MA1k4M0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5324
X-OriginatorOrg: citrix.com

On Fri, Nov 06, 2020 at 10:37:35AM +0100, Jan Beulich wrote:
> When shattering a large page, we first construct the new page table page
> and only then hook it up. The "pre" hook in this case does nothing, for
> the page starting out all blank. Avoid 512 calls into shadow code in
> this case by passing in INVALID_GFN, indicating the page being updated
> is (not yet) associated with any GFN. (The alternative to this change
> would be to actually pass in a correct GFN, which can't be all the same
> on every loop iteration.)
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

I agree it's silly to pass the gfn when populating the page table
page, as there's no gfn being updated (yet).

Thanks, Roger.

