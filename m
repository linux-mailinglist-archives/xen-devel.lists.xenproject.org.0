Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D1A22FB8AB
	for <lists+xen-devel@lfdr.de>; Tue, 19 Jan 2021 15:32:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.70411.126355 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1s35-0007Vc-QZ; Tue, 19 Jan 2021 14:31:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 70411.126355; Tue, 19 Jan 2021 14:31:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1s35-0007VD-N4; Tue, 19 Jan 2021 14:31:59 +0000
Received: by outflank-mailman (input) for mailman id 70411;
 Tue, 19 Jan 2021 14:31:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jC7I=GW=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1l1s34-0007V8-1M
 for xen-devel@lists.xenproject.org; Tue, 19 Jan 2021 14:31:58 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e5772aff-5462-42b0-81cc-501348debca2;
 Tue, 19 Jan 2021 14:31:55 +0000 (UTC)
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
X-Inumbo-ID: e5772aff-5462-42b0-81cc-501348debca2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1611066715;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=Hhyo6x4fnJXr+Gh2FJgzzi8MaT9nyGaVP8V1HYcB+3k=;
  b=G8dNth+xGtekV/DoZMalyuupX1initmhRPpr6pWeFnm+a+ZBFs7zmSAe
   2rIgYqwu7Bb5Pb0Nev/Rs61hgwRY6kbjJV62DyZgJn9pqihsb1iH5XsmO
   zGp0uzdFVlvVbtHHBELXvkO2eb2CRTD6+SnCfDEDLcAAqaDJNbFvoygc8
   c=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 4ROJ7VamRM5uW6wRNUf5ValHf/8m8buxBSHSmCAM7OmR6XhQY1EEH6MzcfRTsh48hQBPZONMHa
 D+vX3t42Y5Ra5MPhH2uxXjUzS89pXgO/KVZC0bsgrVR+oS+4Vb7ffhJ2FrSLM5N+jEWdr+8izf
 oFqsSGTxDdV0nIPxAtHzgpy0vdZ45MGnH6SFw0jAYy2SFI+xf5YPJeytkiD9vNtNCq7xJu8/ts
 IVEY/1tknHmYoDM5mpQ6+mbkXEgXWmfYscbx8JtUnZ7O8EtuRmgggagWZF5lkiYmpzBbFGij3T
 1F4=
X-SBRS: 5.2
X-MesageID: 35592015
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,359,1602561600"; 
   d="scan'208";a="35592015"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZDLF1t81+zwl9KA9OymW3M1xpE/7hbISzpFHjJ8DU8Cn7HgMWaKc0HzRD2t7Li5rhHktelAbzhNcaXZcK+3/EQr8HO5iys6oa8K8Eju1Fb2VfIOa2NMQPk3ZMD2zQdhfPchT+R+IeirTP1Q4Vi7fvNThrGoDKf90vqDoIasX3MzWIrm3sToBDID4PDlL3QBJ3LEOP7nS5dUnkLznls31rxeHRT2bmD0g7720i+nQTZkg6g88mi280UlZk9LhHFsrVNWRK+nfq0EExx31xn2y5Uuetit5GgiM3CByn5efK0GFC3CnZhrKgtkB/ZiMlGtc0ZaMzwWBoeySNQkDzsMinQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/JvwiXbKQHQvTVKqxQBl06zaFqnPlpmK3w8Yzp7XE4c=;
 b=hUtFMUDH/O4qfDnwD9Zel4DHRxGvF1Y3x+bzN2PZ6bZPU+nMsT5S2RlyPxUpAnPeyTyTdx4F4O//3Wcyza59WoEoqUPp1li8kNUjtvZY+mpr5oSVJD+7iUohMIUnyHQEFo8Ao5zUT7yAlSqCejwheu8XcFu+b9xL/xOSRcSUB6hWcSyrIpV0l1jtTZauyJRicvmoZlxCweetdEPWI4/0HEwjCSTAK9D+d9ytNWVj3YyyW+4WimdZl+qwjM9F2oSZublP35+F7sOQ0WwCpmQMAfnCZdePA1HkwK7xOHYBrUw+XXpyyp7V90Qur3QhXXQdDphy5HRe+amFrVtGfXltDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/JvwiXbKQHQvTVKqxQBl06zaFqnPlpmK3w8Yzp7XE4c=;
 b=gPegfsB/r09vRs3i8y6zZI6E/MSlLBvMcp3V9B3mfmCkoZFqwkHdQnzU0qWyWRksrLobtUUEJRqDRU6k1EDMchH03MYHlusyGXIp2wvzlOd1ll7yCo7T/kD5QbYf9W+ji0G2wu3KFPoN7d+CXHK+632GGqpdTDXzxl1m9gpO7r0=
Date: Tue, 19 Jan 2021 15:31:46 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2] x86/CPUID: unconditionally set
 XEN_HVM_CPUID_IOMMU_MAPPINGS
Message-ID: <20210119143146.ktr4fh66x6cmwqbv@Air-de-Roger>
References: <20210119130759.98296-1-roger.pau@citrix.com>
 <064729d2-1fe2-3169-4f4f-7c04a73e3984@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <064729d2-1fe2-3169-4f4f-7c04a73e3984@suse.com>
X-ClientProxiedBy: AM5PR0601CA0063.eurprd06.prod.outlook.com
 (2603:10a6:206::28) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 960a6ebe-3624-4dc0-c89d-08d8bc86f6a6
X-MS-TrafficTypeDiagnostic: DM6PR03MB4539:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB4539C21E6389D3A78B43AD3B8FA30@DM6PR03MB4539.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AxH9Vw0tOVtb0DpWMGoFT/USB7ffbWFkeFup1/Nkn6BMDdVn4SP6PqdoTFbSV+xhuY2w+QfKWv/SvAiybcn/JW5j8QOMSYYH+fJV+QgouV2aP7AKTxJ/SYBJMTekxsZgnnUXMCOQpXI5q8b8ELQpdZsIfhjVuVURJgrmrftxIPpIyWsepshmFEsL89l7T5hCHjsqbzeH5DCyg/00nNAgZNWOm0d7CrBLpQ/CF/8bDMMs4GpAvVtBdq8udusuqrh6tiRyE3mhZsqvppi3/ubLYhh0K46XFeBC7pSQRO4gfDlDYCEqGNJfOSoBpoIp8x5EL8ocMgz739E/EkT5QvGMm959jxlR2iBqGsj5mFMwm3OmEWbv5LHFGgbpd+M22Xbl8c7XoKpKsD71Y/l1o6RV9Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(39860400002)(366004)(346002)(136003)(376002)(396003)(8936002)(6486002)(6496006)(33716001)(66556008)(1076003)(6916009)(4744005)(478600001)(8676002)(316002)(54906003)(9686003)(5660300002)(66946007)(26005)(4326008)(956004)(66476007)(53546011)(85182001)(186003)(16526019)(6666004)(86362001)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?NlBTTUprTUdGMHE3b3NnQ3ZaVEVJeWpIdGFOQytXNzAyVHprUE1LdGZoTHhH?=
 =?utf-8?B?NnJ1cUlrVDBGZ2Y4NU03dktqdS9WaHU2KzFzK1RXc1BDRzhCcDBLSjFITU5D?=
 =?utf-8?B?a1RIQm5GVEZJVURJNmkrMmZiKzlZUnp2eVdKc3dIVXlBa1ZUTmFoRHFwd0R2?=
 =?utf-8?B?Uit1VjNUWTRUdHMyQk5EaXVPb0NDMGtqMjFyaE85MHIycSt4TWJEbzNmekZ1?=
 =?utf-8?B?ODlKeFVxOXBsdDU5UXhUNC9TQi8zTjJPNW40eTc4M0ZCNWtFcjMxUk4wbytU?=
 =?utf-8?B?dzFwajhNK1AxS0pFQW95ZUdmQmxJN1VGWmpuQ2xVUkZ0cVhZV0tudFZHaHhP?=
 =?utf-8?B?Zms0N2wxb09kN1RmMENTRjg3QzA0cGhkYlkvclc2Rm9JRDZ6NlloTXQzL0pi?=
 =?utf-8?B?L1J3cTlUZEhRR1h0K2dGTitCTFhac2FqMGFlZXpTckdIM0NpaEZZS2E3SjlM?=
 =?utf-8?B?RC9TNmkrYjVia0s3RzJIZXBKY0dKbk5ISHdNSG1tN2NEVVJaaTIreEFjQTZ5?=
 =?utf-8?B?am1oVUxSeGF5dGZNQko2c0FJeFpub09aZTBuSTdvUEcxbGlTczlva3VLWnlm?=
 =?utf-8?B?ekdKSUhHaEMvMXNLWUxPS3lOcUdHOHNsajhVTXFRNmNmdzVCOGRiRENpMFNy?=
 =?utf-8?B?bFRXMW56T1VYcWdQcXozbkJ1eDNVelAybFVDYmF0eE9PbHhRNStCVVBQZ1RL?=
 =?utf-8?B?ZERrWTVhQzllZmdlY3F5WXRTZkpwU3NFYWZ2ak5kN1NiTWVqN1NLeFZFcXVY?=
 =?utf-8?B?Q0lDVkdUbGNTR0tESGpTSkJYYUYrSi9SemhiSGQxbmJLb1dscXlYby9jYmNL?=
 =?utf-8?B?b1hhKzBmcGpzNkx1VDdJL2xtR05FTVpLZElmUjBqcWVoYUdQSUd2b25QMTl4?=
 =?utf-8?B?emd4czdxdXpaWm1HZE12VGF2RnBXeklzdisyQ2Y0cHVmdGJUalJkYU9iT1Ay?=
 =?utf-8?B?TUVoa2UzYTN0a3hFcC9yeWoxallxM0R1TS80ZUtEajYwbURld1VLWUYyTlg5?=
 =?utf-8?B?MkY2alNuNUVFTFBmN1JJN3JCUjlNNTA3N2YrYldOTWQ5ZmtST1FVdG5lMHY4?=
 =?utf-8?B?dEMrMWtxSS9lZENMTVZvWStza2dnaThkcXRyMUw1ZlEyQXY2Z3dXdCtlYkZ4?=
 =?utf-8?B?dUFZdG9acFl0SlpEWGxRT1JxR2pIV2xhRWw3R0hNcEpKZGFnU2phSWRvVER5?=
 =?utf-8?B?MnJxdC9FZ0NPV0g5RzhIUlVtWWpFbFRlRm1pUVhGY3BHcTJpcHVEMXRKVE1T?=
 =?utf-8?B?dGcxNjRVa2gxeWt3YmQzMjNQZHpPZGVuUEp2amFXL1NRVExXUWFNcUxEanlO?=
 =?utf-8?Q?vTH5hk0yz32SloGP4JjgRoIoweFtQWDXW9?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 960a6ebe-3624-4dc0-c89d-08d8bc86f6a6
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2021 14:31:52.3894
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HYGOoFC6Pg8wZaum8kv+k7v8Gfu9kJi8eLV75NHk5k4zX7yiQtX5SyYjCUm4Pu1o+V+pi2PP4V3E9IX2KC8rCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4539
X-OriginatorOrg: citrix.com

On Tue, Jan 19, 2021 at 03:26:22PM +0100, Jan Beulich wrote:
> On 19.01.2021 14:07, Roger Pau Monne wrote:
> > This is a revert of f5cfa0985673 plus a rework of the comment that
> > accompanies the setting of the flag so we don't forget why it needs to
> > be unconditionally set: it's indicating whether the version of Xen has
> > the original issue fixed and IOMMU entries are created for
> > grant/foreign maps.
> > 
> > If the flag is only exposed when the IOMMU is enabled the guest could
> > resort to use bounce buffers when running backends as it would assume
> > the underlying Xen version still has the bug present and thus
> > grant/foreign maps cannot be used with devices.
> > 
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Acked-by: Jan Beulich <jbeulich@suse.com>
> 
> This time for real, I suppose.

Won't believe it until it hits the repo ;).

Thanks, Roger.

