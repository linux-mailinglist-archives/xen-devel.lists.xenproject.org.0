Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65F1A723DC0
	for <lists+xen-devel@lfdr.de>; Tue,  6 Jun 2023 11:35:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.544036.849512 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6T6E-0005TA-1q; Tue, 06 Jun 2023 09:35:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 544036.849512; Tue, 06 Jun 2023 09:35:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6T6D-0005Qd-VI; Tue, 06 Jun 2023 09:35:33 +0000
Received: by outflank-mailman (input) for mailman id 544036;
 Tue, 06 Jun 2023 09:35:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Tz0j=B2=citrix.com=prvs=514dea429=roger.pau@srs-se1.protection.inumbo.net>)
 id 1q6T6B-0005QX-St
 for xen-devel@lists.xenproject.org; Tue, 06 Jun 2023 09:35:31 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7818c3de-044d-11ee-b232-6b7b168915f2;
 Tue, 06 Jun 2023 11:35:29 +0200 (CEST)
Received: from mail-co1nam11lp2174.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.174])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 06 Jun 2023 05:35:25 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by DS7PR03MB5573.namprd03.prod.outlook.com (2603:10b6:5:2d1::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.32; Tue, 6 Jun
 2023 09:35:24 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::192:6bdf:b105:64dd]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::192:6bdf:b105:64dd%3]) with mapi id 15.20.6455.028; Tue, 6 Jun 2023
 09:35:24 +0000
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
X-Inumbo-ID: 7818c3de-044d-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1686044128;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=l41kf6PzgxIYGKJkCBeSwWbzL+Vl3zeOfe2x3fUnmLY=;
  b=eAdK1ZYXQdghrH35TfA5W+0vQWY31KOKwhhLq0YNmRvKUlVLpCNxJuc/
   Ai0WSB9oq+IIbd+9aXfw5bbFmM6FT77OYlWkIZ++/jodTcDv0C9HydB4d
   XZOJ4+aGTy2uMVkp8w61N7WHUp9aQE+nPL+pWZ9DLOkFKMaC2cCalGwgJ
   U=;
X-IronPort-RemoteIP: 104.47.56.174
X-IronPort-MID: 112156254
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:mHut6qJ8SIGdPopGFE+R95QlxSXFcZb7ZxGr2PjKsXjdYENShTRVz
 zdKDWuCbquONmqnet8iOoy0oRgHv8XWmtEySAZlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHvykU7Ss1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpKrfrbwP9TlK6q4mhA4ARgPakjUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c5oIkpP5
 8ESFgonVQC7gt2r2ZeqTLFj05FLwMnDZOvzu1lG5BSAVLMNZsmGRK/Ho9hFwD03m8ZCW+7EY
 NYUYiZuaxKGZABTPlAQC9Q1m+LAanvXKmUE7g7K4/dppTGMkGSd05C0WDbRUsaNSshP2F6Ru
 0rN/njjAwFcP9uaodaA2iv13LaSw3mmBOr+EpWA+NVD31ij+VAvKxMWclq0nPaJp2GHDoc3x
 0s8v3BGQbIJ3E6hQ8T5Xha4iGWZpRNaUN1Ve8Uq5QfIxqfK7gKxAmkfUiUHeNEgrNUxRzEhy
 hmOhdyBLSNrmK2YTzSa7Lj8kN+pES0cLGtHbihdSwIAuoDnuNtq0U6JSct/GqmoiNGzASv33
 z2BsCk5gfMUkNIP0KK4u1vAhlpAu6T0c+L83S2PNkrN0++zTNTNi1CAgbQD0ct9EQ==
IronPort-HdrOrdr: A9a23:UT9ARqE5lPvwCnzBpLqEMceALOsnbusQ8zAXPiFKJSC9F/byqy
 nAppsmPGDP5gr5NEtApTmrAsm9qArnhP1ICNAqTNWftWrdyQ6Vxf9ZnO/fKmbbakrDH4dmvM
 9dms5FebvN5DNB4PoSjjPTLz7VquP3iZxA/d2ut0uExmpRGtpdB40TMHfgLqXOLzM2eKYEKA
 ==
X-Talos-CUID: =?us-ascii?q?9a23=3Aeh5MpWu35qBZVisBIy+mu5RV6Is6UVbc3kraHXW?=
 =?us-ascii?q?SMnZRTYKIUHqB/vtrxp8=3D?=
X-Talos-MUID: 9a23:9sqzTAhj3do8PcvCFK7hecMpDMlDyvurOH8xrbYIu+6FOhF/CxqytWHi
X-IronPort-AV: E=Sophos;i="6.00,219,1681185600"; 
   d="scan'208";a="112156254"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gy8e+Lnm0TFnD1t4jvcj4elntn0XNClVkyBQNd3nIy6AXAM9VKzMFfpuL2Fi9V37qOgv+ATQ8De2208oe/iNksAuDdAwimbtxCKeCmnj/vJSNX3vPxbIIlbhKaV5mqnLXweVyhSiSDHGo3f+KUSwpxOz2tGk/Cd522z6JVIe29xp983Vx7W42JJrfXPgX/e7SwuVNfRgI/KTvZqpmc7rGLN5oVy5vJsypywoMZYVB+ZUuDQobz2PlnTCeEiE0FiFcAudzM9oEMyjJTlObpWgwH+0RQ2i5Kszl5xktwdzEXxqzawcQt31xUs2Rrna+6npNmUhTAlBt2E7aM1vzzqaTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=74QDny3FJUbcux5HKD1saecs2YtDmkfbXZauTFG4qyo=;
 b=a63LMQhVYWt8lfrdwo4dDSIQilZxX6VV3HyfOESBpS6AvZYcqv5ZyKBtvCitSccaX15hWXYo/C2IQITV16dl7GopgO8FD2M2xOsRQugtbe8QKJxhs+zl/gmqr/yvcpOkhTiBM58e9u5TU/x5i53u3eqaYyJPeyIKbS4Rb4mHSW1kKDGLStETHD1RWLS7zIIz4U7ZXlM/XBcvFv0mlWcMo+0WmyCjCUA19Esx70Qtw7szqbQpM3rXGLm4IL/R8yxUkBINW8MsUNHY0IBzDFQJPtnegSRPmLzJfpOEjveNo/Dx/QJUQsf04Cs5qh/bv+M5ZL/X5SymJdvOd6ub4IWJ3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=74QDny3FJUbcux5HKD1saecs2YtDmkfbXZauTFG4qyo=;
 b=wMKwTKBV0/EW6IExd27rcP+lOKclgzlNUMtp8vu8rNs9q/m/pA0Jv+BLO43pOekB5evjBJhiK1vbpwREUbPYk4TfeLlZCaavTJKuk04eL2nt8ruDN2diMLzC7xXHu+jprea5K2CL7EsrijGRLEcb1MnZqnlCQLaOXEKe9/SNu1I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 6 Jun 2023 11:35:17 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 1/2] x86/vPIT: re-order functions
Message-ID: <ZH791eXWSCI2gNPJ@Air-de-Roger>
References: <fd113adc-6d66-5a4f-78ee-766c197ced93@suse.com>
 <b6cbf871-53a6-15ee-99d5-0ad2ab9c8b80@suse.com>
 <ZHhiLgI0oL7jvKNc@Air-de-Roger>
 <cf17abea-0ca2-5794-aa29-3d9c91355d4f@suse.com>
 <ZHiGCblQD42qfoY8@Air-de-Roger>
 <cc87aac7-87aa-2efa-662e-f8d3628ddaab@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cc87aac7-87aa-2efa-662e-f8d3628ddaab@suse.com>
X-ClientProxiedBy: LO2P265CA0176.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a::20) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|DS7PR03MB5573:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ba0debc-fe73-4310-ff5d-08db66715a77
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ky328J+c+pICtEuEveV6+YLx0LRCaRIIRQ+OvAz6vnmLvVYYL3z18qWeq4lYaVrUKskns3exSKDHn8Wh+sX9NkmIqxS4jUMudGsFc6ee9UX4V1ouVr0j4ZiVoO9RcO6Yq5ZllsVvwwwA1K6OTxBQjakzPeQ7n66ooYTZ+DpSGYe0MT6KV5qdld/zwYZI53sAJfsiwDVZ4scKRTlq1RzUczoYkpY9sneoCgkIrV5sW8GT7PYLzsviyUNbSchKY9Vd4+3tzPmGuvfKbmFgbYFPOh+Pnosp0iKr+/oNyOYh7BSSHs/rBBcxY5KHE10NnSlRIBbVIdCF6SXmK/DrwA4WbVqC57AsFSyqtZbhQbKe6af1B534annHBI2u0WvxWvzT/8691tAhe6ORgdKtHdu3ILTIhiutokzo7X7+GDr6ZXC2YqETAga6th10oGFcb9iqKSRWXx6aBkQnwO+nUcJ7t+570xtCLXxuUrjY4AiVmrA+Z+JDBSXyhW9qe6NKLs2wurrFr/smsZGVRWHbHPrxQEXEh1TZQvEiM1KlLbD3ek15MTpcWFPbl/MpvQyfFc4KU5tRU1erffb5IKebqzBi33MCYJTTT1Laq5oOUdL2SdKNwdFBxqOGjj9XFeKKBRGS
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(7916004)(346002)(39860400002)(366004)(136003)(396003)(376002)(451199021)(83380400001)(478600001)(82960400001)(54906003)(8676002)(8936002)(41300700001)(316002)(66556008)(66946007)(66476007)(6916009)(5660300002)(38100700002)(4326008)(86362001)(6666004)(6486002)(2906002)(85182001)(26005)(6506007)(6512007)(9686003)(53546011)(33716001)(186003)(169823001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UXJrVkdyVVV2V1VPNmdMNlFiSUtBWkZlOWdLZU82M3Q1YmtsNkptKzFsU2VL?=
 =?utf-8?B?alE5V3lDa3R0bFI2WlpFeVBrWi90M3FFU3BtMEpibElRMVUzZEswbXZlQUcx?=
 =?utf-8?B?TDU4bTJldzRodFRwbzd1SkcyT0xFVmc2RG1wZE5pZUJSNVY0RGdOOS9FZjNL?=
 =?utf-8?B?TFVlQWdZVUhDVHd4MWpzMlorOWtHVG8zS1BVRmlBcUFBQWN6YmgxUk54Qy9P?=
 =?utf-8?B?azNvbTdZVmxTZ1pRdVpYbStodG5mek5xMTh6ZWp4UFVBdlFrZWJLVlBpR2VX?=
 =?utf-8?B?T0ZRSlN6QjVKMjFwNFFLV25qSGhqM2JLTldjMld2RE1oSDhBcVljZUxiMTBi?=
 =?utf-8?B?Vk45UUFzaEhMU3hGWnBOTmFnQ0E4M3pDWmlGQkdoWVFsQzRUWHVIRjVNRlhE?=
 =?utf-8?B?VVhyOXhrbERmSC9sZEx6QVJHdS95SGxDdEh1aGZVQ3hqcDg3eDhnNTNZaThH?=
 =?utf-8?B?bUVlTWdNdTBCOGU1VkExL2ZKaDBVSmUvdWVYTHpqOFZyVHpXa1hGS2dTTFVZ?=
 =?utf-8?B?NTRjR0Z6M1F1UWRlZ0tjYlRXVTNYUWNXeTVjQ05penc3VXEyNFEwQk8waXA4?=
 =?utf-8?B?cmpNZWlMYmdaUnBIdVVmbC9ESjNPcTlJcTQ4ZmNmRnJUUmNUK3k2WTluR3lN?=
 =?utf-8?B?VTFkNkxMTHMza2JkK3hZamNoNVdLZnVHNkdUa1ZORllSbDFiWVRFai9Nb0dY?=
 =?utf-8?B?ZEE0M21hOUhHM1p3eEtrT3Y2by9vb2dWV0tFQUVkZnVRcGduUG9WK1NXZU1J?=
 =?utf-8?B?a0FOWHhLT3VTUkFZMisvYTlRWnY4WmN2S1dGRTEyTUpyM2dtY1M3eGh0d2NE?=
 =?utf-8?B?dmVvN0FHczkySGZzbTVkck1aQzU0OWNsT2dXbmVEcW5KUXJsZkZtQ0ZxelBp?=
 =?utf-8?B?VWhZRWpBYkV3TjBSa1B2bHRvdHF1RmNpMUhqTHQxbEZXNmNQL1NiTUxDT1BM?=
 =?utf-8?B?VWRxOFAwcjI2UmNWOW1zeWRqdnVIbytHQTJTOTJkK1lVcTdiZlMzZTJlNisx?=
 =?utf-8?B?Zzhjb3JaaDBKVEhGc3d1WXBYV3BicG1GM3dWS05IZ2hMYzZuaEVtNHV2QW1H?=
 =?utf-8?B?b3lFVy9BWVE1Tzd2YnN4Sk1CcVpqNmd3VStLNFczZjVxeFMzWnBXeU1tV0Jj?=
 =?utf-8?B?S0Zvd1lhTVNoU2R3dlc0ek9PZzI3azVFKzNGVDhLM3FtMjRraUozK3gzZitI?=
 =?utf-8?B?UGdBd2h0eFBvdDRjblQyeThUTXBRYXVDNjhsWmxwNkpCdHdic1Z3MjZ4Z1Rh?=
 =?utf-8?B?N2JZMHpOV1R6eDlFd3pGVWk4bzRlTkFteTVVSUVsSEhXbjlLbzE0UFhRMU90?=
 =?utf-8?B?OXRUSjFHSlAwOEsvMkhCd3VDTGZLYVBIaHdXajBVWk9JV1NBaUUxdlhCOTZt?=
 =?utf-8?B?VG4yQlBXNlBMTHdFb1lRZU9ZM1g5cWpjMlROb0hoS3BzNDdSNDNpYlRkTk0z?=
 =?utf-8?B?TFl4UGNrWVZsbTZVUzRFOVI3SXB4Z0puQzZsZzdnVjZhSmgraEpxUGNONys0?=
 =?utf-8?B?QWRwNHFqNVhNZU5QcUZjaUt5Nm5LblNIY24vMWM0REI1N0t0SE0vbFVORG56?=
 =?utf-8?B?MVdsKytYdW5xdlpvdjRvSnBrVHcvR2RhQ3lBTVZ5T0VXcGhzMmNBRURrT0Nw?=
 =?utf-8?B?RTEvNmpvY2N6cnlpQmVsNDZQeXV2RTBuZkJnNEtjVXZQYjRpZWdnWVZYdTlE?=
 =?utf-8?B?QkhacG5oYy9vZTh5bHZBeklqb2ZLeE9XTGRaeXJWUDJFaGRKM2M0b1lKM1Yv?=
 =?utf-8?B?ekt6K0NwK1lkc2N1ak9Mc2JlMEswMCtWdE5RVUdGWTcza0hhMkx2NkE4UnRl?=
 =?utf-8?B?eEVPcXlWTlhpRy8vaXVVWExTQ09oVGkyM2h3RUtoOCttWm1BTmlaQXlkbDZZ?=
 =?utf-8?B?dDlPbUc3ZTdrcnZlRVZyY1JSNkpGaHlzVlArYnZ5Uk1lRjYwVkFsaUVLTHZG?=
 =?utf-8?B?d2h5NnhsNit1QzRwT1BVUzF0RzNNTjFTZyt3UEVzVmFQbzg3TDcrYXlISklp?=
 =?utf-8?B?SGkvRWZVYU8vYmNBOFRKUjJLSk1tdkpEdHZkSDVJNzdFTFB4b0M0RWFiKzVt?=
 =?utf-8?B?dFZtd2xKWjVKaW56Nk9ObnVxQks4eUNFSnZmNk1FQXBGWXVmcmVnUXRvS29B?=
 =?utf-8?B?dW83dG4vNklZYWM2NGdtaVNDZHR0aTFlalZZek50OWx4MklYZTFURHNLS3NR?=
 =?utf-8?B?b2c9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	+v9cowsK60Xyi5JzaoMh5y+lQbEEfEXpvdDgtMo0B8lMQt8NN+aXWOM8WS/oAa/EpeASX1v3PR0rwUC6oZ9195tEjiBHYvo1ELymd1LlkOQ5Q/8OWZzwcZsyPgORepMgG8ssmUUr0xv7+VFLF5JqlOVUJH51Zbk65QQK1bUqHg8HHe0HU0gnUCK65Kw3uyJIEGKoqtCg97IHCafoo5JX9hC1vtMMeFT2lIj8bQIuIvJseCOEfz979UWyoSzou4nRb6aqoQwcbHJ2qDC8hh/TjROLgsf3i5K6vFs2HI3bQKblRk6UTm1pDDvRtN0mR9trHQpv4OX1gb7WQuOVUKpmAa8OXxjr8b9XI1WBTWBB9ZEVRbkNsjaCNYN9Jm3JYxfRdNvyJ1PNhTVD2D+4A+jK5llg8wnveyR6ePz0vJU3cHt7rGvKJlNW0bC5NiH5Zlo95BDPbLdL6oMaVrZn+8cLZ0mulGhHu0ih/TQu3DdHtOX+Sh8kM78uYzeFT0/oVneqR0TYZG6BYSIHP4Ooy0+2ZJ92CB4JVDOBoc6tmSq9mngXGe2WiIlNSGFMC5hgf9E0jigqbs5ojYw27HNX8RQ4t3z2jT1DU5I1AGaNK63Kzj4UzAMWNVYmqptakTMasUeZdUyU8HzdKzfcMqjr4CdX607JL/JHo7Xd4r1sL2tWVzmqx4FVm54wBvJRChivT3OST0UIbDq7x13siltBFEvtMHJGdgGyVE71KXiceUKmzXuUjGLzP41NuYMPDEQ4iMgCoAdagvfZbKbeRmigZFpvLocEGFs+cqF8GVdIGETKLLMeOOBPYKNjjo79I9OVeBkA
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ba0debc-fe73-4310-ff5d-08db66715a77
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2023 09:35:24.1018
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mgZ4QGFx9g9uUpvWHa4sFo+uit5BVHNoJciO34HvtS00eePnUuXsc1mQu1I1VceUYVD1Xiyvpw17g3ReJFCARQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5573

On Thu, Jun 01, 2023 at 04:06:53PM +0200, Jan Beulich wrote:
> On 01.06.2023 13:50, Roger Pau Monné wrote:
> > On Thu, Jun 01, 2023 at 11:56:12AM +0200, Jan Beulich wrote:
> >> On 01.06.2023 11:17, Roger Pau Monné wrote:
> >>> On Tue, May 30, 2023 at 05:30:02PM +0200, Jan Beulich wrote:
> >>>> To avoid the need for a forward declaration of pit_load_count() in a
> >>>> subsequent change, move it earlier in the file (along with its helper
> >>>> callback).
> >>>>
> >>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> >>>
> >>> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
> >>
> >> Thanks.
> >>
> >>> Just a couple of nits, which you might also noticed but decided to not
> >>> fix given this is just code movement.
> >>
> >> Indeed, I meant this to be pure code movement. Nevertheless I'd be happy
> >> to take care of style issues, if that's deemed okay in a "pure code
> >> movement" patch. However, ...
> > 
> > It's just small style issues, so it would be OK for me.
> 
> So I've done the obvious ones. There's a further signed/unsigned issue
> which isn't quite as clear whether to take care of "on the fly": The
> function's 2nd and 3rd parameters both ought to be unsigned, yet
> throughout the full file the same issue exists many more times. So I
> guess I'll leave those untouched for now.

No strong opinion regarding those, I'm fine if you want to adjust also
to unsigned.

Thanks, Roger.

