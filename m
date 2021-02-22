Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C3CD32152F
	for <lists+xen-devel@lfdr.de>; Mon, 22 Feb 2021 12:35:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.87991.165319 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lE9Uz-0000dG-Su; Mon, 22 Feb 2021 11:35:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 87991.165319; Mon, 22 Feb 2021 11:35:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lE9Uz-0000cr-PX; Mon, 22 Feb 2021 11:35:33 +0000
Received: by outflank-mailman (input) for mailman id 87991;
 Mon, 22 Feb 2021 11:35:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w45/=HY=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lE9Uy-0000cm-3g
 for xen-devel@lists.xenproject.org; Mon, 22 Feb 2021 11:35:32 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 360fc7fc-307c-49d6-b5ae-1eca8937401c;
 Mon, 22 Feb 2021 11:35:30 +0000 (UTC)
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
X-Inumbo-ID: 360fc7fc-307c-49d6-b5ae-1eca8937401c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1613993730;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=jWSnlA+PQt1lgyX9O3AGqFCKiGlVGdo+mKIDMnFHSlo=;
  b=Yme587BmMwsClYNeb6kFa56SBQkT8gy8k6uIiMqHVukmMIrHonBBpeiX
   YEcbX5g4V+g9yN9nTRD1LBcxzz6XpfspnQNAlfkt08fXhppWmQUzUg+xI
   FxA6qrIcMHrHAegorCDs1tJwgjN30/8ccoHG1fFR3BhF3C4bwjv2q87KG
   0=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: ShrAMV53vK/XWFH9buubr0ojDKOgVtUeP5g7MDQsP4urFBzUqOQXT4UoiXX9I/53luwInBVZx/
 Q1BdBEWc+mT2YSSNi62g/11ZlssC4zqlwB+DCvIKVd/iQByUpBBoa+BsBtHcfYMQNg0NfbyPXo
 mWmQj4QY/3ba8vk+s5mkj1bML4CWHThODMKCyR2vppIuN10nitT2tNhK3Ogr4+/n2548dWTUQW
 eDwnBzYnafLzscDPCusByH/BVW5dZCp9kbR+rSnTFRUY+PpQb8FZTwLbYTbslu58yj4nCH4ykF
 XFA=
X-SBRS: 5.2
X-MesageID: 37746328
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,197,1610427600"; 
   d="scan'208";a="37746328"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cIP0BWXwi6AHjWyRGPMSWgE5KwlLWwzCprB+os+cXMnQWQpvH3RHtjsbleG2eX8+PiBrAIL4uNWFYvNgxeYDGfwI3lLp+ZeYJKck5ZffXfPNVx6oBrhISrnnqYzdzNM0sX/h3g2nEjjDXbXR1F2KGRDUBol+SU4FSnWVfS9swvZDJNkfN6NJSPt6Tb9dUasPLwk849ldFXeJhaPCvL2jYuelfzDQ/Dft5s2U6kMx1x0KGNEK4yPnHJltU8N7xrtS8FE9QwqD9uUx4OjPZCXRv0LerTZ5u0sEXhblZrENvKz6v/9KU0XBebJZantSUf0FrxJWKE2ZhpkEXQ9NotjTXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jWSnlA+PQt1lgyX9O3AGqFCKiGlVGdo+mKIDMnFHSlo=;
 b=npS7tCfXG33kP/HgPPLYcX5iVkWy7zL53WlD4CrO7BGpxMwJz2GxR4S/7h3Xxol071hzlO7hvy67m++ikfcNnGdJ/4I7ajFk/1gTx7NQDuhFIgYrgTuyM2Vh/FnfXLHiR+fYWF5s/yR3Rmw8bfp80XGJKejQua3u5mzdGQvvvMv/GeF4dgkkEOUq45/lnlWBD8Oy4PaR2y61FFI/JOpp3pr3NzWYB7ds9+WTPn7t8GkgBX5n7kqosHW4ok++zV5kENzEWiAQP3e3izTJdalW8o1WcwHQt1GUr13QYefXoJwxV8Dc2DTJlMwmKK5z7J2+PVVFi8ih81OpCamubMAb2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jWSnlA+PQt1lgyX9O3AGqFCKiGlVGdo+mKIDMnFHSlo=;
 b=oGNWtXjHPmEiOYjGmttGOpuDa9LQ7FLlRY7pAQgK0Ef+3jBIAUZFdrh6vuQ7jiiGnfST+4tJiSg4oIji0dc1/ZPD3MUcH41wdudt36ItP5e4XA4U5WRUHhHh+vboIrL0518jDKOfuFEYxZahNU40nakjVkfYYWpCyqz/+CjJDR4=
Date: Mon, 22 Feb 2021 12:35:21 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, Ian Jackson
	<iwj@xenproject.org>
Subject: Re: [PATCH][4.15] x86: mirror compat argument translation area for
 32-bit PV
Message-ID: <YDOW+ftkNsG2RH3C@Air-de-Roger>
References: <bdedf018-b6c4-d0da-fb4b-8cf2d048c3b1@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <bdedf018-b6c4-d0da-fb4b-8cf2d048c3b1@suse.com>
X-ClientProxiedBy: AM6P193CA0084.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:209:88::25) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6d6eccdd-3bb9-4a7c-e8b1-08d8d725f294
X-MS-TrafficTypeDiagnostic: DM6PR03MB4603:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB460379236A9F8C20F4D32C2E8F819@DM6PR03MB4603.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Dytq3yml/7nrmVWwf6ns6RMq7UPKUjRisN/2jybxEC8jx9z6DvUuyquVaE0DLi4+KItijRHHk3niZaz0I/AxtkXmfNkC2gSJ9H6zYoY9Z9lRgHpp4PYZagqFZHHxS8i7h5BJ6UcNWMp7HLjwy/OpEvKL+/srMb5bW9fUL8pLkrPDde8ymgLjFrmSJUPL0+RReAPIWa3+H0Q0fPSiEZYPkq9Xvp4C931pP2VCYbVTSFxWP7pbnNNdLO+HThI+Ukcvi8RHYUZouARtJ3y/KR6SKgpS+CBhPfXsJd0yjhj+0KobQu7iMm/qgvjMawITW9jcEhD7eC/jUXUjejxuAOW4Tf2Wsxqs2qtRiEqqgzmpcLAs5fIgt5a/SxJQLDJ1slC50K3BuwGKhRgcIThUukBgQhxNHAM9rU6aGUauczOfRpepjU3O+8Mz9AjppsBPmb8t0xqUxlE2qcKNSNl+U8EjDw93W5fWllyQK6d0LEc9y86kJlSGlaUiLNoKdsWDXXnIwSTVwlMnqDc4O/3v8W5nLOILhSItqHKX2xQPP92BZyaSNCP7Mm1FJ2LaWYt/QLv9
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(136003)(376002)(346002)(366004)(39860400002)(396003)(316002)(9686003)(26005)(956004)(8936002)(54906003)(6666004)(86362001)(478600001)(33716001)(6916009)(6486002)(4326008)(8676002)(5660300002)(83380400001)(4744005)(66946007)(66476007)(66556008)(16526019)(186003)(85182001)(6496006)(2906002)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?dVR3VXBPUnhHSXVINEIvT3FORnVxdFB2Um9pWTAwUU9xeVRtRnBJbEI4aWY1?=
 =?utf-8?B?NUd2b05EbDRLRXg3OVlBWk44RDZvUERTTk1tWW5GcDlOaGx4K3RLTW1BYnA5?=
 =?utf-8?B?MTd1cHdEeThnRyswZkc4aW9mUFdhcmlIMUhRS2h0eWp5V2hacU5xSUxEZGNQ?=
 =?utf-8?B?VXhPVC9CTjg3TUxHOFRZZjM3T1RQbUZwcXFnWis2ZDZjZWFmUzk4d2REeG5n?=
 =?utf-8?B?ZXV6TGpTenNYN3BhbTFaUnE4akFNYndpWDhZYmJ3SlNsYi8ydUZuTFhSMTUz?=
 =?utf-8?B?OVp2T2JSUC9JUGVUQW1EZ0hucDJjQXhmSDBhYzNuTm4xS2U0bXFJUU5wYlI2?=
 =?utf-8?B?UktPTk1rWDdPVmlKaXRLdHh5OWpsZ2ZBS1B1ZkFhaDZiQ2JoanJiYktNeFgy?=
 =?utf-8?B?M1J1YkFmUnhTMVhkOWMrZVY5ZjhIWURJN1BZcTUzYWpLb3JrOTFJcnVpdjBu?=
 =?utf-8?B?bEJyU1JETjJUcUJhT0o3TWVYR3JyTUE2QWR6bkVYL3dZc3ZaUmhEMjNieDVj?=
 =?utf-8?B?WkkvQlZ1WGVIdkg3cmw5RGVHbERxLzVZb2ZlWEJmdUJuUTR3Y2l6cjVWQTRm?=
 =?utf-8?B?VzBoNnFJcW15WCt3Qks2dnhkbkNackRGVjloK2d2YmhKZkNLa2hDVmlKV3dq?=
 =?utf-8?B?MlZDRkptdWo2SE5jM2hwd0JCMTFRMlRBa3FjTjRVOFdOaG4zdm42SW0zMjlJ?=
 =?utf-8?B?c0Z4KzV1UTcyMWxpU01KTUVxWmxvUXZYSGNWOTd2bVZjRUJoZGJUNXdCMjc0?=
 =?utf-8?B?aVc3U3V4MmpKM3Z2SU9OTEFodUtiYkJzR2F0c3NpWXV3WFFrek9ubEhyQytK?=
 =?utf-8?B?d1ZUU2tFZEg0Q1NlYmZmMGVMc2V0NDlSRlBQUVlld2pYbm4vWlltTytuUXZ1?=
 =?utf-8?B?V1grQmUyTEl5Ui8wVjlRZ05Rajl5SGxjc0pRck81dXViZ3lJMFRIdDlKRmJ6?=
 =?utf-8?B?akpHcU16aHRmUytxN2wwd2VRNDIraUh6STcvREtLL1Z4Qnd4RG9PVVpUZTls?=
 =?utf-8?B?TEZRZUpRNmduOTZydHcvRS9rWkVGUi9XbGw4SGZ0QjNDUldpZ2R1NzJKQVFl?=
 =?utf-8?B?bTJCRVEyeTdPWlBWRWV1a0VBTzBYZkFqQ1VhVmE2STB1ZHhqZWh6dDFkME1K?=
 =?utf-8?B?YzF0U0ExVUZSRWhYbzRQNEQzb3cybTE4Q1ZmNG1QVVNzNkFyOXdFVWRUZzcx?=
 =?utf-8?B?d0lxajRpWkVzUWZOYjkyV2NNU3JJTHpSSTh0SUpxSkExM2ljdTZSTVhzcGwy?=
 =?utf-8?B?SVczZG9HU1ZrRWV0dW8rSm1xVlV3ZW52MVNCV1dSQUZKN2tjbDRVVXpaenJ0?=
 =?utf-8?B?clYzT2VtVkdraHgydS9JbHM3V2t1cTEva0RZZ2gvakhHaG4rYlVnS3NqS3NT?=
 =?utf-8?B?UFRBTFVZNTJvWHVVOGczQ0tvRmdENkJGa1g4NEp3YndGa1lFMFpQTWx5Nk9V?=
 =?utf-8?B?TEg4RHZwT1BaWEhYS3IzeFRtOTJhdzVIMlFRbklRUGUvNVhvc3ZCZDFXa1Ex?=
 =?utf-8?B?Z0E0UTNOZk5STTNscWVXMVZrcHNaVUhMaFp4UG9OMUhyK05iUmZWR2wxQ01E?=
 =?utf-8?B?WFdjN2FaQ001RHhscHQ4djJhc0dIV3VpekFjbFoxaCsrc0pzQTRVQmsreWZO?=
 =?utf-8?B?bU9NMWtwOUpFM1RJZldhTFNYTWlPUlJFMzRJeEl5UFc1VWtpV2pXNnBPZ3c3?=
 =?utf-8?B?dFQ4a1BPT1NjT0NlVHF4anlHZGRFOVlrUGVkcDFXS29ZdHBDK0gyZ0RWVFh5?=
 =?utf-8?Q?AH9malFE7wDeqadiJt1OixUyFA9oP1TF/y3zbs5?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d6eccdd-3bb9-4a7c-e8b1-08d8d725f294
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2021 11:35:25.9628
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IRacPrOaMrYji/0k3LNl2wHH/Jp6bRXiBf7FM+8svNJSDKAJDYFctbYE+6Jp0oODVDY5TLTih/AJLjHXxOfPyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4603
X-OriginatorOrg: citrix.com

On Mon, Feb 22, 2021 at 11:27:07AM +0100, Jan Beulich wrote:
> Now that we guard the entire Xen VA space against speculative abuse
> through hypervisor accesses to guest memory, the argument translation
> area's VA also needs to live outside this range, at least for 32-bit PV
> guests. To avoid extra is_hvm_*() conditionals, use the alternative VA
> uniformly.

Since you are double mapping the per-domain virtual area, won't it
make more sense to map it just once outside of the Xen virtual space
area? (so it's always using PML4_ADDR(511))

Is there anything concerning in the per-domain area that should be
protected against speculative accesses?

Thanks, Roger.

