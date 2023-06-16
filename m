Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CFA07335FA
	for <lists+xen-devel@lfdr.de>; Fri, 16 Jun 2023 18:31:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.550316.859317 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qACL7-0001bR-05; Fri, 16 Jun 2023 16:30:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 550316.859317; Fri, 16 Jun 2023 16:30:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qACL6-0001Y9-SA; Fri, 16 Jun 2023 16:30:20 +0000
Received: by outflank-mailman (input) for mailman id 550316;
 Fri, 16 Jun 2023 16:30:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uwsx=CE=citrix.com=prvs=524b7acb3=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qACL5-0001Y3-85
 for xen-devel@lists.xenproject.org; Fri, 16 Jun 2023 16:30:19 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 10d0b001-0c63-11ee-8611-37d641c3527e;
 Fri, 16 Jun 2023 18:30:13 +0200 (CEST)
Received: from mail-dm6nam11lp2170.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.170])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 Jun 2023 12:30:11 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by SJ0PR03MB5949.namprd03.prod.outlook.com (2603:10b6:a03:2ad::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.29; Fri, 16 Jun
 2023 16:30:08 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::ab2a:a298:bacb:db47]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::ab2a:a298:bacb:db47%2]) with mapi id 15.20.6477.037; Fri, 16 Jun 2023
 16:30:07 +0000
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
X-Inumbo-ID: 10d0b001-0c63-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1686933013;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=F7Ol4U2NttDFEbRiWSNpOsk0GcNQpciuOlqRqqEc61s=;
  b=dZ24t3BoaXz9Zump/LAQHcXLNl+ULjJNTZd4JF5eM1B/SYCtUKfFoKuz
   9qaxhgh+GFjfDJAUpILXLH78BeyVSJOKWcVS79eVf4g6kB28CZLpG17Kf
   6kpU8cHLF9pUvDOcPZhmPhnEahPUvnJCIITMbCr9FLsHftXlB132oE8lD
   s=;
X-IronPort-RemoteIP: 104.47.57.170
X-IronPort-MID: 111838852
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:Y7iHw64fQ8H0zNuVK2A6eQxRtKrGchMFZxGqfqrLsTDasY5as4F+v
 jcbW26DM/jYamajeN5za4yz9UtTup+Ez9djGgRprC5hHi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraCYnsrLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9lU35JwehBtC5gZlPa4S4geE/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5m2
 dZJCxQXSDO/2Ofs7+ygdthUtM48M5y+VG8fkikIITDxK98DGMmGb4CUoNhS0XE3m9xEGuvYa
 4wBcz1zYR/cYhpJfFAKFJY5m+TujX76G9FagAvN+exrvC6Ok0ooj+CF3Nn9I7RmQe1PmUmVv
 CTe9nnRCRAGLt2PjzGC9xpAg8eWxHqrA9JCSefQGvhC2QfP30MBKSEsb1aakP6mpA2OBNRAN
 BlBksYphe1onKCxdfHDWBm/rG+BrwQrcdNaGO0n6ymA0qPRpQ2eAwAsXjNHLdArqsIybTgrz
 UOS2cPkAyR1t7+YQm7b8a2bxRuVPSUWNmYEaTUzZA0J+cT4oIozgxTMSf5uCKewyNbyHFnYw
 TqHsSw/jLU7ltMQ2uOw+lWvqy2ojojESEgy/Aq/dmC46gJ0Yqa1aoru7kLUhd5bN5qQRFSFu
 HkCmuCd4foIAJXLkzaCKM0VFaytz+aINnvbm1EHInU63zGk+nrmcYUO5jh7fR5tKpxdJmevZ
 1LPswRM4pMVJGGtcaJ8f4O2DYIt0LTkEtPmEPvTa7Kif6RMSeNOxwk2DWb44ownuBFEfX0XU
 XtDTfuRMA==
IronPort-HdrOrdr: A9a23:rfx25KCVH4wQrSPlHejasseALOsnbusQ8zAXPh9KJCC9I/bzqy
 nxpp8mPEfP+UMssbQb6Ji90KnpewKgyXcH2/hkAV7CZninhILMFu1fBOTZskzd8kHFh5VgPO
 JbAtpD4b7LfBtHZKTBkXmF+r8bqbHpntHK9IWutgYUcexzUcFdBkVCe3Wm+yVNNUx77PECZe
 ahD7981kSdkAMsH7uG7xc+LpL+Tunw5dbbSC9DKw8s7QGPiT+yybjhDhSU5BcRVDtT3awv6y
 zgnxbi7quuiuq8wBPHzWPfhq4m/efJ+59uFcaIgsgQJi7Njh+yZIN9c7eevDYzydvfjmoCoZ
 3hsh0kN8R252jwenivoRzx/gH83DEl+xbZuDilqEqmjd3yQTo7D8ZbvJleYwv941ctu9ttuZ
 g7u15x+qAnVy8pU0zGlpn1fiAvsnDxjWspkOYVgXAaeYwCaIVJpYhax09RGIdoJlO31Ghyet
 MOMOjsoNJtNX+KZXHQuWdihPa2WG4oIxuASk8e/uSIzjl/hhlCvhgl7f1auk1F2IM2SpFC6e
 iBGL9vjqtyQsgfar84LPsdQPGwFnfGTXv3QTKvyGzcZfM60k/22sDKCfQOlb6XkaUzvccPcU
 H6IQJlXW1bQTOiNSTB5uwIg0XwqKPUZ0Wr9igU3ekPhlTGfsugDcVYIGpeyvdIk89vRPEzE8
 zDTq6+I8WTdVcGSrw5hDEXrfFpWDcjuDp8gKd1Z7vJmLOXFmXn29arOco7DICdWgoZZg==
X-Talos-CUID: 9a23:B6eYIWMUhzcH0e5DdAM212oOPOMZLXiH4ynLH36AO2x2V+jA
X-Talos-MUID: 9a23:8RtT5gaL7DItIOBT7mWwnR5wFftS2amPOUcSv9Y25M+bKnkl
X-IronPort-AV: E=Sophos;i="6.00,247,1681185600"; 
   d="scan'208";a="111838852"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cqaobjiDlLuemh4ymaW7ypZ3HIpQiVj/hGyDCbiYmc6oYa8iXpIsZj4ZYGIMoVxDZp8Ib4KedWvMlkX4J1In0DE1KkFWaf4O91adPkt/yKmkmNITUaCmRJOnt2BQfsIu3TlNJuRXd1PIIUgiQp1RZcpicFsThb6SEe+o+d+MD7/lrn+Yfs0C6Hw6g+tKZEUR+Nhd30BCpAqiyMB6ak16xZxpVGeDza/RET3ZaXG9I/AS7+sazreyEyEpiX2OnTV08Gkt8aWFrhKLMQg5kO2KSSYyk8MiM2hi6omDM7wqCCSbgaWdmiZfw8XeTuZnso459e5bTOC81VSz9xsu+zpC8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A0RUBcKKCpumDwz/osAT0XjKKty3iRAr0yaziCsPFbA=;
 b=AniQp3Q9rTRfpkStvREDzVDGRjU5RirUDvvPnqqWxR/RjTF+t2u0vvciWyPu+nsyKwb9Gfm5U3XEuNPpaXXfJYo3uvxo7fz9JvJvO08FmWwV28YU5lBQyC8pSKxlDbdtDc7zcPKeQYE4zr/8T1lyCwRt2XJqPqJbpeOgemi7dHgrXJunyzcYGynGZX+hXDKJPQPWZHb71iMoPHZU2l5e2aLK55+65JX8sYaSyZvWJYbA3NnpVzepFrHQUWz/Hv569EmNR0YrFZtFx8rX/x01he0dVa5UmdA7aVlkdFMbL6Ec3ivREBXaLy4TLwsg1uiNKiWvMs8/S6ThZZiFmQS4dA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A0RUBcKKCpumDwz/osAT0XjKKty3iRAr0yaziCsPFbA=;
 b=miAzT9jmxeSprsj3vMG+PifMIQ9C+wQw0QNivTfN14DJi5AB1qWkG/ZhnCH54N1y/r5blvvm7vkMl84v3tkVdb20TiGl7HwVu1GhkS51+45tj9IvRQ7xg9I3OSU1NOqCWPiuS46tbWalc0v0u8zBacTASOAj+X8V5Ao85r/hP3U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 16 Jun 2023 18:30:01 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Paul Durrant <paul@xen.org>
Subject: Re: [PATCH v7 01/12] vpci: introduce per-domain lock to protect vpci
 structure
Message-ID: <ZIyOCan//39V3bdy@MacBook-Air-de-Roger.local>
References: <20230613103159.524763-1-volodymyr_babchuk@epam.com>
 <20230613103159.524763-2-volodymyr_babchuk@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230613103159.524763-2-volodymyr_babchuk@epam.com>
X-ClientProxiedBy: LO6P123CA0012.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:338::18) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|SJ0PR03MB5949:EE_
X-MS-Office365-Filtering-Correlation-Id: f221e0f3-5be8-4c8f-21a5-08db6e86f1f7
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	RRcIFlz+j0XiK44iDduBDYuDFBu2EKlW6zIh5w2k8QbahH62JQyuXU69PPkH8Wfypqi3uKb3PTLzVz1184aP/EM6XBv1mfpi2jtjxGTT5aFik96i0l7501w9Dz4Tv+PWfAlef0ZiAnJv9ISIk9jYG18YAMhQ0GdEUMnTCN6aFsNi1AeyA7PHbe9W853Q1F8MMZcXsjo8eQY90TitRTF7FGEBvNe+MwslAw4/ZWit7I50YH49MFXXvn7nOIBMcKM/x4xuz2/GVkxPqkicy9Pv5FNuUDCJKDHXs6I11Gh1hBwXNC9maYiWf1aNy2EtwjQhmEOAoTsKHK7z85mU/IJys/0Ouc17uQeR+wHclIc7hqSjqVTdEXS9VM8j1cx6c2zdPMOTqC4blPCWwp+EaZdZ28dWozMYVjLgD8u6NEIJNMubx4/72p5k6yvhPfEgsSVH0TO1TsP8XqTFbuuNfwxkvudXS0sryKslH3W3a0dgKGI9PsoyJCdQGW0j1ifdyDE5tz9wgotF+J5RNZlxGedjd+MHQQNpYWRG3p/8FDsu22e+YIl8O7MqxJ4Au+i6m9iH/SJ70APrurh55yToOAssB1jU2uTWxCLE6UiDYpJ4SqA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(346002)(376002)(366004)(39860400002)(396003)(451199021)(54906003)(5660300002)(8936002)(41300700001)(6486002)(8676002)(316002)(966005)(6666004)(186003)(66899021)(6506007)(9686003)(7416002)(26005)(30864003)(6512007)(508600001)(4326008)(66556008)(6916009)(66476007)(66946007)(86362001)(82960400001)(38100700002)(83380400001)(85182001)(2906002)(309714004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QVpiREZtbVlMbHFuRGd3bWRFN3ZLcFpIV0l5WTVISDlSNlZxTVFuZHhPV1hF?=
 =?utf-8?B?ODlzbUhsMXU4bjVvVGZuRzRDZVpsb2syaldUWjR0RGtuNi92SHB2R0tnOVJq?=
 =?utf-8?B?bktmWks5NWdqT25lNXliN1VXSm9TMjZyRGkvcy8rSTVtQWl1bXhaZmY2akxM?=
 =?utf-8?B?SDJQRVNjN0VFaFJnYUZFTE5OK3dlMUs3Mmx1Uk9oL2s2MDM2UUliRFByYmho?=
 =?utf-8?B?NWhvTlFIRnRzdkJXTkgweDgxZ3gxY0U4TnhuWDViZHZBZ1lWZUVoOVFNSGRJ?=
 =?utf-8?B?NFZSamkyMkxtUnN5V0sxS3hLVWFDQ051SUh2UmRyQmpKSXhyRUxXRUhPdUJo?=
 =?utf-8?B?emxwbUlOT08vaGdDcTR3SDFuL2hzU0JVV3B2RktvWGt6VUFmaVFmRGkzbWg1?=
 =?utf-8?B?NGFEQ2lLS2xJOTZrSGhZMWFZcXUxRFRxOWR0enZJVko2RldOUHVFOVUxOGVV?=
 =?utf-8?B?a09ITTBDQ3dhQ2M2eWZpNGdLcEY2TnJsTWNGa2IzaWg1b1czd3hWUHZuMVRU?=
 =?utf-8?B?YU44NWJCMlFUelZ2dHI5QjZTdW1VdmtYYVJLOVZvamE4U0JBN0pveUlJZmFM?=
 =?utf-8?B?bW5sQkw1NzVyN090c00vSFVCWHpWMitBMlR6dEp1b3JQNjJnZEdJdnhDdzQy?=
 =?utf-8?B?a29MWmc2Uk1xSDY2c20zdWFiTVo3RDBGdGpYU3Urd2FubjdZVXpxTHo2ZnNC?=
 =?utf-8?B?OFVFeFRZeDVQZUdjVGo3dkxKODdXcmZKVExNaHZSY1ZlbnhWSE5Zb1hwckNt?=
 =?utf-8?B?MHhEYWw5RmVybGJSb3ZqTzFXSkw2OHNnU1d5Zmp6WU5hRjhUaFU1Y2l5TlpK?=
 =?utf-8?B?Q2t3WFduYUlHVys5d0laS29WVnRuUUN1RVVnOEcrcVZnUlFCS3dIQVcwSzR0?=
 =?utf-8?B?eGMxWFF1SkxWS3dWRTRBeHVZOFhYQmgxZ3pkd1IwZXVWdkE1S0d2cjNmWW5O?=
 =?utf-8?B?U0FrZ3JNTytRU0N2dnEyenJzWEFXU1JZR2VPc2VYOERXNnB6bW96SllHb1p5?=
 =?utf-8?B?UjZzSkhVa1NqL0srbmV6c05rNXBLZXc3UnppYVp6ckcxYXJIUzNUMXl4T2g2?=
 =?utf-8?B?V3dIYWVtQkw0a3ZIR0ZidzlKSENwN3N3TmwxUTNxR2FzMWJnK0N3aFdpTmVt?=
 =?utf-8?B?V0lmZ0ZheXlqeVBLbTJJazYzQ2NyRHgxbFhkVFRWc2NXMHQ2VUdOZUJYcUgx?=
 =?utf-8?B?VjNydm54YzhnU1F1bkRpNDdnTmdUOFBicUZ3MmYzbXY3Z3JQVFVYUzNlbTNr?=
 =?utf-8?B?TCtjUXRqaGQzQko1KzRSZ3FyWkRTMHkweGNkeU1DMHBjNWlaYzRvV0dhVTln?=
 =?utf-8?B?SHZsR1BnUzVObnkwNkh6RU1pcWNyUFZCUlE3bWxua08xSEJWd1lQUzZTRDJn?=
 =?utf-8?B?UWNOWW9OUkFYNlNoYTk5dHZNcyt5VFJ5RGNXc2U5enBIS1hRekMzYVVhd1BM?=
 =?utf-8?B?SUE0QnlHSTlBQjIyYlE0MVZaaVZSM1lZVUlETmNUU2J6NWRWV3A5cktoMEVM?=
 =?utf-8?B?NlVLNHlhb20xTFJ6cUpmUnlJQVZDTFc1YzUySHhhYnBWdGpwWnZmVkpKTlRC?=
 =?utf-8?B?aFg1T3BKR0o1aDgwcTB4U01mdnc5QS8ySjRQdWtWUUU2OVozNldpUmJYbnYv?=
 =?utf-8?B?cEJldERBckZ3SlMzTDVmeGkxUHQyalI1V0NEcVB3a2RFa2lWeWk5Zm91YkxV?=
 =?utf-8?B?SGhWS0IrRmpiUDkweXNoQkw4VFNGeHRkS2VmcG10aU9pZGdxeThDWDRyaEE5?=
 =?utf-8?B?cHlCMTZxYTU5RGZMTFU3Skt6Y2lWUkZhaG12bHFmbFhBemhSNFFmQTZtRmpI?=
 =?utf-8?B?NmJ2L1FJWG5sTC9QeUlwWVdYU3lGa0ZSVmNmMDlJY0dlUlhoVkZUR1lsMU9D?=
 =?utf-8?B?NDBhMlo4ck9XNStRMVZBcTFIZjFtVDBidjFjdWhSNFNxZGVXTHZQbW1JK0lU?=
 =?utf-8?B?dWlmZThBY1ZuVC9YcHlMN1p0NTVRK2VXQVlhTHJYNHAyTDBOWWdlZVN1aDQ0?=
 =?utf-8?B?TG5JUTA0QjhQMVpsVWRBQVo4WTdhamllTHhTYkZUdXBhYXlZVTFQVlljZWc5?=
 =?utf-8?B?MEJseEs3Q2dvSWprYzQ1YnVydE5Pd3IranI4YnhIQS91NW0zYjZhUStyVFd5?=
 =?utf-8?B?SWRqUkJzb281ZVpOWnBIZk5kZ1BweVpDa29vWmJLTDNyMlZ3Q3lVQW9ENlVI?=
 =?utf-8?B?dkE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	byn9hYG5JykLfqTD6lmNQG6hmrjnp1rO7f0iZO4OZBcQLBM7rmhNeVDV81EhRZW8bRXQbbN0AtOt7hb6MOk7478iGtSJawyRTkC65aFKTUlI5OX84ejlItxs7EH7YrOak1Sxj+KsMq6KAm3rv3FiRNHoN7JmL2M6uTAwNuCs9axuoBPz02OLqX354BWcXaepBifr0kfKImeYjEH+tCL3mKLO3481DOV0Xr/TRYhDLo9qny3ljeaLgF0z3ZvYzfYeHJHzEVpPnEu4NI1R5kW8pr47kPu5EAGSW+FXYPPP+XxPFAUt7mapunD6f6e1lJzRBGIUXKgjl2ZHT0eZvFqaq7lzFp6iOcyPfg+4BuwecJR1cHIMowZQK5THFUK1SFLKcv9NE7UPe5rkL0VRVHK/3KSBW4u5JJ4YoZPQNN6PSF29qkdujg7ze293MtrLL6tKvkmICQB3OViQL0NZvK/hzpsRrRIicKraRCExoU7CRxwq+WufzruI+IsmDVMvEhf/RWL4vXo4TBEpIImR93tN373pRUxcmZjpwGN9vuksOh5WJbWY8QFGKOSaKxucJnEmvrsSEnnIcEUovXn4FmBIXlpv7v2MJ+LGKG/QY4UuPnQxuklJ9J176JGYFITQzyMyigAVXSpM6uYn7sRMYhbn4n8Xl3yX8nEZ8B/++5+FkYVNlBIcJjmwzkxHD0Sz7WJgcNAlBFp4S43nRXiEsAQEgwaxFwmR4AaUACcY+WvZftAXoThAfYdEAKOuk+dncvHK8Ex8a7puRKbvljyQpnwfappZCi3EI22kTiGagfa2asEYeFOMfLLoNR84cOCrx0QP8LiPyA5RB7x0pKe2sW/Xc04sXkWp0mzqfkQc1PgDQXeV1dQyHgY7Psmhop2Te307
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f221e0f3-5be8-4c8f-21a5-08db6e86f1f7
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2023 16:30:07.1419
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wxl9rS8oI/656EZanpiuxh1ns0fYRelWwlf0F7RhmD/pSxWe5Kl0rWApvZO3tttdueZiiJasWwjoK0LlOnPDEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5949

On Tue, Jun 13, 2023 at 10:32:26AM +0000, Volodymyr Babchuk wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> Introduce a per-domain read/write lock to check whether vpci is present,
> so we are sure there are no accesses to the contents of the vpci struct
> if not. This lock can be used (and in a few cases is used right away)
> so that vpci removal can be performed while holding the lock in write
> mode. Previously such removal could race with vpci_read for example.
> 
> 1. Per-domain's vpci_rwlock is used to protect pdev->vpci structure
> from being removed.
> 
> 2. Writing the command register and ROM BAR register may trigger
> modify_bars to run, which in turn may access multiple pdevs while
> checking for the existing BAR's overlap. The overlapping check, if done
> under the read lock, requires vpci->lock to be acquired on both devices
> being compared, which may produce a deadlock. It is not possible to
> upgrade read lock to write lock in such a case. So, in order to prevent
> the deadlock, check which registers are going to be written and acquire
> the lock in the appropriate mode from the beginning.
> 
> All other code, which doesn't lead to pdev->vpci destruction and does not
> access multiple pdevs at the same time, can still use a combination of the
> read lock and pdev->vpci->lock.
> 
> 3. Optimize if ROM BAR write lock required detection by caching offset
> of the ROM BAR register in vpci->header->rom_reg which depends on
> header's type.
> 
> 4. Reduce locked region in vpci_remove_device as it is now possible
> to set pdev->vpci to NULL early right after the write lock is acquired.
> 
> 5. Reduce locked region in vpci_add_handlers as it is possible to
> initialize many more fields of the struct vpci before assigning it to
> pdev->vpci.
> 
> 6. vpci_{add|remove}_register are required to be called with the write lock
> held, but it is not feasible to add an assert there as it requires
> struct domain to be passed for that. So, add a comment about this requirement
> to these and other functions with the equivalent constraints.
> 
> 7. Drop const qualifier where the new rwlock is used and this is appropriate.
> 
> 8. Do not call process_pending_softirqs with any locks held. For that unlock
> prior the call and re-acquire the locks after. After re-acquiring the
> lock there is no need to check if pdev->vpci exists:
>  - in apply_map because of the context it is called (no race condition
>    possible)
>  - for MSI/MSI-X debug code because it is called at the end of
>    pdev->vpci access and no further access to pdev->vpci is made
> 
> 9. Check for !pdev->vpci in vpci_{read|write} after acquiring the lock
> and if so, allow reading or writing the hardware register directly. This is
> acceptable as we only deal with Dom0 as of now. Once DomU support is
> added the write will need to be ignored and read return all 0's for the
> guests, while Dom0 can still access the registers directly.
> 
> 10. Introduce pcidevs_trylock, so there is a possibility to try locking
> the pcidev's lock.
> 
> 11. Use pcidev's lock around for_each_pdev and pci_get_pdev_by_domain
> while accessing pdevs in vpci code.
> 
> 12. This is based on the discussion at [1].
> 
> [1] https://lore.kernel.org/all/20220204063459.680961-4-andr2000@gmail.com/
> 
> Suggested-by: Roger Pau Monné <roger.pau@citrix.com>
> Suggested-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

Thanks.

I haven't looked in full detail, but I'm afraid there's an ABBA
deadlock with the per-domain vpci lock and the pcidevs lock in
modify_bars() vs  vpci_add_handlers() and vpci_remove_device().

I've made some comments below.

> ---
> This was checked on x86: with and without PVH Dom0.
> ---
>  xen/arch/x86/hvm/vmsi.c       |   7 +++
>  xen/common/domain.c           |   3 +
>  xen/drivers/passthrough/pci.c |   5 ++
>  xen/drivers/vpci/header.c     |  52 +++++++++++++++++
>  xen/drivers/vpci/msi.c        |  25 +++++++-
>  xen/drivers/vpci/msix.c       |  51 +++++++++++++---
>  xen/drivers/vpci/vpci.c       | 107 +++++++++++++++++++++++++---------
>  xen/include/xen/pci.h         |   1 +
>  xen/include/xen/sched.h       |   3 +
>  xen/include/xen/vpci.h        |   6 ++
>  10 files changed, 223 insertions(+), 37 deletions(-)
> 
> diff --git a/xen/arch/x86/hvm/vmsi.c b/xen/arch/x86/hvm/vmsi.c
> index 3cd4923060..f188450b1b 100644
> --- a/xen/arch/x86/hvm/vmsi.c
> +++ b/xen/arch/x86/hvm/vmsi.c
> @@ -895,6 +895,9 @@ int vpci_msix_arch_print(const struct vpci_msix *msix)
>  {
>      unsigned int i;
>  
> +    ASSERT(rw_is_locked(&msix->pdev->domain->vpci_rwlock));
> +    ASSERT(pcidevs_locked());
> +
>      for ( i = 0; i < msix->max_entries; i++ )
>      {
>          const struct vpci_msix_entry *entry = &msix->entries[i];
> @@ -913,7 +916,11 @@ int vpci_msix_arch_print(const struct vpci_msix *msix)
>              struct pci_dev *pdev = msix->pdev;
>  
>              spin_unlock(&msix->pdev->vpci->lock);
> +            pcidevs_unlock();
> +            read_unlock(&pdev->domain->vpci_rwlock);
>              process_pending_softirqs();
> +            read_lock(&pdev->domain->vpci_rwlock);
> +            pcidevs_lock();

Why do you need the pcidevs_lock here?  Isn't it enough to have the
per-domain rwlock taken in read mode in order to prevent devices from
being de-assigned from the domain?

>              /* NB: we assume that pdev cannot go away for an alive domain. */
>              if ( !pdev->vpci || !spin_trylock(&pdev->vpci->lock) )
>                  return -EBUSY;
> diff --git a/xen/common/domain.c b/xen/common/domain.c
> index 6a440590fe..a4640acb62 100644
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -622,6 +622,9 @@ struct domain *domain_create(domid_t domid,
>  
>  #ifdef CONFIG_HAS_PCI
>      INIT_LIST_HEAD(&d->pdev_list);
> +#ifdef CONFIG_HAS_VPCI
> +    rwlock_init(&d->vpci_rwlock);
> +#endif
>  #endif
>  
>      /* All error paths can depend on the above setup. */
> diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
> index 07d1986d33..0afcb59af0 100644
> --- a/xen/drivers/passthrough/pci.c
> +++ b/xen/drivers/passthrough/pci.c
> @@ -57,6 +57,11 @@ void pcidevs_lock(void)
>      spin_lock_recursive(&_pcidevs_lock);
>  }
>  
> +int pcidevs_trylock(void)
> +{
> +    return spin_trylock_recursive(&_pcidevs_lock);
> +}
> +
>  void pcidevs_unlock(void)
>  {
>      spin_unlock_recursive(&_pcidevs_lock);
> diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
> index ec2e978a4e..23b5223adf 100644
> --- a/xen/drivers/vpci/header.c
> +++ b/xen/drivers/vpci/header.c
> @@ -152,12 +152,14 @@ bool vpci_process_pending(struct vcpu *v)
>          if ( rc == -ERESTART )
>              return true;
>  
> +        read_lock(&v->domain->vpci_rwlock);
>          spin_lock(&v->vpci.pdev->vpci->lock);
>          /* Disable memory decoding unconditionally on failure. */
>          modify_decoding(v->vpci.pdev,
>                          rc ? v->vpci.cmd & ~PCI_COMMAND_MEMORY : v->vpci.cmd,
>                          !rc && v->vpci.rom_only);
>          spin_unlock(&v->vpci.pdev->vpci->lock);
> +        read_unlock(&v->domain->vpci_rwlock);

I think you likely want to expand the scope of the domain vpci lock in
order to also protect the data in v->vpci?  So that vPCI device
removal can clear this data if required without racing with
vpci_process_pending().  Otherwise you need to pause the domain when
removing vPCI.

>  
>          rangeset_destroy(v->vpci.mem);
>          v->vpci.mem = NULL;
> @@ -181,8 +183,20 @@ static int __init apply_map(struct domain *d, const struct pci_dev *pdev,
>      struct map_data data = { .d = d, .map = true };
>      int rc;
>  
> +    ASSERT(rw_is_write_locked(&d->vpci_rwlock));
> +
>      while ( (rc = rangeset_consume_ranges(mem, map_range, &data)) == -ERESTART )
> +    {
> +        /*
> +         * It's safe to drop and reacquire the lock in this context
> +         * without risking pdev disappearing because devices cannot be
> +         * removed until the initial domain has been started.
> +         */
> +        write_unlock(&d->vpci_rwlock);
>          process_pending_softirqs();
> +        write_lock(&d->vpci_rwlock);
> +    }
> +
>      rangeset_destroy(mem);
>      if ( !rc )
>          modify_decoding(pdev, cmd, false);
> @@ -213,6 +227,7 @@ static void defer_map(struct domain *d, struct pci_dev *pdev,
>      raise_softirq(SCHEDULE_SOFTIRQ);
>  }
>  
> +/* This must hold domain's vpci_rwlock in write mode. */

Why it must be in write mode?

Is this to avoid ABBA deadlocks as not taking the per-domain lock in
write mode would then force us to take each pdev->vpci->lock in order
to prevent concurrent modifications of remote devices?

>  static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
>  {
>      struct vpci_header *header = &pdev->vpci->header;
> @@ -287,6 +302,7 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
>       * Check for overlaps with other BARs. Note that only BARs that are
>       * currently mapped (enabled) are checked for overlaps.
>       */
> +    pcidevs_lock();

This can be problematic I'm afraid, as it's a guest controlled path
that allows applying unrestricted contention on the pcidevs lock.  I'm
unsure whether multiple guests could be able to trigger the watchdog
if given enough devices/vcpus to be able to perform enough
simultaneous calls to modify_bars().

Maybe you could expand the per-domain vpci lock to also protect
modifications of domain->pdev_list?

IOW: kind of a per-domain pdev_lock.

>      for_each_pdev ( pdev->domain, tmp )
>      {
>          if ( tmp == pdev )
> @@ -326,10 +342,12 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
>                  printk(XENLOG_G_WARNING "Failed to remove [%lx, %lx]: %d\n",
>                         start, end, rc);
>                  rangeset_destroy(mem);
> +                pcidevs_unlock();
>                  return rc;
>              }
>          }
>      }
> +    pcidevs_unlock();
>  
>      ASSERT(dev);
>  
> @@ -482,6 +500,8 @@ static int cf_check init_bars(struct pci_dev *pdev)
>      struct vpci_bar *bars = header->bars;
>      int rc;
>  
> +    ASSERT(rw_is_write_locked(&pdev->domain->vpci_rwlock));
> +
>      switch ( pci_conf_read8(pdev->sbdf, PCI_HEADER_TYPE) & 0x7f )
>      {
>      case PCI_HEADER_TYPE_NORMAL:
> @@ -570,6 +590,8 @@ static int cf_check init_bars(struct pci_dev *pdev)
>          }
>      }
>  
> +    ASSERT(!header->rom_reg);
> +
>      /* Check expansion ROM. */
>      rc = pci_size_mem_bar(pdev->sbdf, rom_reg, &addr, &size, PCI_BAR_ROM);
>      if ( rc > 0 && size )
> @@ -586,12 +608,42 @@ static int cf_check init_bars(struct pci_dev *pdev)
>                                 4, rom);
>          if ( rc )
>              rom->type = VPCI_BAR_EMPTY;
> +
> +        header->rom_reg = rom_reg;
>      }
>  
>      return (cmd & PCI_COMMAND_MEMORY) ? modify_bars(pdev, cmd, false) : 0;
>  }
>  REGISTER_VPCI_INIT(init_bars, VPCI_PRIORITY_MIDDLE);
>  
> +static bool overlap(unsigned int r1_offset, unsigned int r1_size,
> +                    unsigned int r2_offset, unsigned int r2_size)
> +{
> +    /* Return true if there is an overlap. */
> +    return r1_offset < r2_offset + r2_size && r2_offset < r1_offset + r1_size;

Hm, we already have a vpci_register_cmp(), which does a very similar
comparison.  I wonder if it would be possible to somehow use that
here.

> +}
> +
> +bool vpci_header_need_write_lock(const struct pci_dev *pdev,
> +                                 unsigned int start, unsigned int size)
> +{
> +    /*
> +     * Writing the command register and ROM BAR register may trigger
> +     * modify_bars to run, which in turn may access multiple pdevs while
> +     * checking for the existing BAR's overlap. The overlapping check, if done
> +     * under the read lock, requires vpci->lock to be acquired on both devices
> +     * being compared, which may produce a deadlock. At the same time it is not
> +     * possible to upgrade read lock to write lock in such a case.
> +     * Check which registers are going to be written and return true if lock
> +     * needs to be acquired in write mode.
> +     */
> +    if ( overlap(start, size, PCI_COMMAND, 2) ||
> +         (pdev->vpci->header.rom_reg &&
> +          overlap(start, size, pdev->vpci->header.rom_reg, 4)) )
> +        return true;
> +
> +    return false;
> +}
> +
>  /*
>   * Local variables:
>   * mode: C
> diff --git a/xen/drivers/vpci/msi.c b/xen/drivers/vpci/msi.c
> index 8f2b59e61a..e7d1f916a0 100644
> --- a/xen/drivers/vpci/msi.c
> +++ b/xen/drivers/vpci/msi.c
> @@ -190,6 +190,8 @@ static int cf_check init_msi(struct pci_dev *pdev)
>      uint16_t control;
>      int ret;
>  
> +    ASSERT(rw_is_write_locked(&pdev->domain->vpci_rwlock));
> +
>      if ( !pos )
>          return 0;
>  
> @@ -265,7 +267,7 @@ REGISTER_VPCI_INIT(init_msi, VPCI_PRIORITY_LOW);
>  
>  void vpci_dump_msi(void)
>  {
> -    const struct domain *d;
> +    struct domain *d;
>  
>      rcu_read_lock(&domlist_read_lock);
>      for_each_domain ( d )
> @@ -277,6 +279,15 @@ void vpci_dump_msi(void)
>  
>          printk("vPCI MSI/MSI-X d%d\n", d->domain_id);
>  
> +        if ( !read_trylock(&d->vpci_rwlock) )
> +            continue;
> +
> +        if ( !pcidevs_trylock() )
> +        {
> +            read_unlock(&d->vpci_rwlock);
> +            continue;
> +        }
> +
>          for_each_pdev ( d, pdev )
>          {
>              const struct vpci_msi *msi;
> @@ -318,14 +329,22 @@ void vpci_dump_msi(void)
>                       * holding the lock.
>                       */
>                      printk("unable to print all MSI-X entries: %d\n", rc);
> -                    process_pending_softirqs();
> -                    continue;
> +                    goto pdev_done;
>                  }
>              }
>  
>              spin_unlock(&pdev->vpci->lock);
> + pdev_done:
> +            pcidevs_unlock();
> +            read_unlock(&d->vpci_rwlock);
> +
>              process_pending_softirqs();
> +
> +            read_lock(&d->vpci_rwlock);
> +            pcidevs_lock();
>          }
> +        pcidevs_unlock();
> +        read_unlock(&d->vpci_rwlock);
>      }
>      rcu_read_unlock(&domlist_read_lock);
>  }
> diff --git a/xen/drivers/vpci/msix.c b/xen/drivers/vpci/msix.c
> index 25bde77586..b5a7dfdf9c 100644
> --- a/xen/drivers/vpci/msix.c
> +++ b/xen/drivers/vpci/msix.c
> @@ -143,6 +143,7 @@ static void cf_check control_write(
>          pci_conf_write16(pdev->sbdf, reg, val);
>  }
>  
> +/* This must hold domain's vpci_rwlock in write mode. */
>  static struct vpci_msix *msix_find(const struct domain *d, unsigned long addr)
>  {
>      struct vpci_msix *msix;
> @@ -163,7 +164,13 @@ static struct vpci_msix *msix_find(const struct domain *d, unsigned long addr)
>  
>  static int cf_check msix_accept(struct vcpu *v, unsigned long addr)
>  {
> -    return !!msix_find(v->domain, addr);
> +    int rc;
> +
> +    read_lock(&v->domain->vpci_rwlock);
> +    rc = !!msix_find(v->domain, addr);
> +    read_unlock(&v->domain->vpci_rwlock);
> +
> +    return rc;
>  }
>  
>  static bool access_allowed(const struct pci_dev *pdev, unsigned long addr,
> @@ -358,21 +365,34 @@ static int adjacent_read(const struct domain *d, const struct vpci_msix *msix,
>  static int cf_check msix_read(
>      struct vcpu *v, unsigned long addr, unsigned int len, unsigned long *data)
>  {
> -    const struct domain *d = v->domain;
> -    struct vpci_msix *msix = msix_find(d, addr);
> +    struct domain *d = v->domain;
> +    struct vpci_msix *msix;
>      const struct vpci_msix_entry *entry;
>      unsigned int offset;
>  
>      *data = ~0ul;
>  
> +    read_lock(&d->vpci_rwlock);
> +
> +    msix = msix_find(d, addr);
>      if ( !msix )
> +    {
> +        read_unlock(&d->vpci_rwlock);
>          return X86EMUL_RETRY;
> +    }
>  
>      if ( adjacent_handle(msix, addr) )
> -        return adjacent_read(d, msix, addr, len, data);
> +    {
> +        int rc = adjacent_read(d, msix, addr, len, data);
> +        read_unlock(&d->vpci_rwlock);
> +        return rc;
> +    }
>  
>      if ( !access_allowed(msix->pdev, addr, len) )
> +    {
> +        read_unlock(&d->vpci_rwlock);
>          return X86EMUL_OKAY;
> +    }
>  
>      spin_lock(&msix->pdev->vpci->lock);
>      entry = get_entry(msix, addr);
> @@ -404,6 +424,7 @@ static int cf_check msix_read(
>          break;
>      }
>      spin_unlock(&msix->pdev->vpci->lock);
> +    read_unlock(&d->vpci_rwlock);
>  
>      return X86EMUL_OKAY;
>  }
> @@ -491,19 +512,32 @@ static int adjacent_write(const struct domain *d, const struct vpci_msix *msix,
>  static int cf_check msix_write(
>      struct vcpu *v, unsigned long addr, unsigned int len, unsigned long data)
>  {
> -    const struct domain *d = v->domain;
> -    struct vpci_msix *msix = msix_find(d, addr);
> +    struct domain *d = v->domain;
> +    struct vpci_msix *msix;
>      struct vpci_msix_entry *entry;
>      unsigned int offset;
>  
> +    read_lock(&d->vpci_rwlock);
> +
> +    msix = msix_find(d, addr);
>      if ( !msix )
> +    {
> +        read_unlock(&d->vpci_rwlock);
>          return X86EMUL_RETRY;
> +    }
>  
>      if ( adjacent_handle(msix, addr) )
> -        return adjacent_write(d, msix, addr, len, data);
> +    {
> +        int rc = adjacent_write(d, msix, addr, len, data);
> +        read_unlock(&d->vpci_rwlock);
> +        return rc;
> +    }
>  
>      if ( !access_allowed(msix->pdev, addr, len) )
> +    {
> +        read_unlock(&d->vpci_rwlock);
>          return X86EMUL_OKAY;
> +    }
>  
>      spin_lock(&msix->pdev->vpci->lock);
>      entry = get_entry(msix, addr);
> @@ -579,6 +613,7 @@ static int cf_check msix_write(
>          break;
>      }
>      spin_unlock(&msix->pdev->vpci->lock);
> +    read_unlock(&d->vpci_rwlock);
>  
>      return X86EMUL_OKAY;
>  }
> @@ -665,6 +700,8 @@ static int cf_check init_msix(struct pci_dev *pdev)
>      struct vpci_msix *msix;
>      int rc;
>  
> +    ASSERT(rw_is_write_locked(&pdev->domain->vpci_rwlock));
> +
>      msix_offset = pci_find_cap_offset(pdev->seg, pdev->bus, slot, func,
>                                        PCI_CAP_ID_MSIX);
>      if ( !msix_offset )
> diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
> index 652807a4a4..1270174e78 100644
> --- a/xen/drivers/vpci/vpci.c
> +++ b/xen/drivers/vpci/vpci.c
> @@ -38,20 +38,32 @@ extern vpci_register_init_t *const __end_vpci_array[];
>  
>  void vpci_remove_device(struct pci_dev *pdev)
>  {
> -    if ( !has_vpci(pdev->domain) || !pdev->vpci )
> +    struct vpci *vpci;
> +
> +    if ( !has_vpci(pdev->domain) )
>          return;
>  
> -    spin_lock(&pdev->vpci->lock);
> +    write_lock(&pdev->domain->vpci_rwlock);
> +    if ( !pdev->vpci )
> +    {
> +        write_unlock(&pdev->domain->vpci_rwlock);
> +        return;
> +    }
> +
> +    vpci = pdev->vpci;
> +    pdev->vpci = NULL;
> +    write_unlock(&pdev->domain->vpci_rwlock);
> +
>      while ( !list_empty(&pdev->vpci->handlers) )
>      {
> -        struct vpci_register *r = list_first_entry(&pdev->vpci->handlers,
> +        struct vpci_register *r = list_first_entry(&vpci->handlers,
>                                                     struct vpci_register,
>                                                     node);
>  
>          list_del(&r->node);
>          xfree(r);
>      }
> -    spin_unlock(&pdev->vpci->lock);
> +
>      if ( pdev->vpci->msix )
>      {
>          unsigned int i;
> @@ -61,29 +73,33 @@ void vpci_remove_device(struct pci_dev *pdev)
>              if ( pdev->vpci->msix->table[i] )
>                  iounmap(pdev->vpci->msix->table[i]);
>      }
> -    xfree(pdev->vpci->msix);
> -    xfree(pdev->vpci->msi);
> -    xfree(pdev->vpci);
> -    pdev->vpci = NULL;
> +    xfree(vpci->msix);
> +    xfree(vpci->msi);
> +    xfree(vpci);
>  }
>  
>  int vpci_add_handlers(struct pci_dev *pdev)
>  {
> +    struct vpci *vpci;
>      unsigned int i;
>      int rc = 0;
>  
>      if ( !has_vpci(pdev->domain) )
>          return 0;
>  
> +    vpci = xzalloc(struct vpci);
> +    if ( !vpci )
> +        return -ENOMEM;
> +
> +    INIT_LIST_HEAD(&vpci->handlers);
> +    spin_lock_init(&vpci->lock);
> +
> +    write_lock(&pdev->domain->vpci_rwlock);

I think the usage of the vpci per-domain lock here and in
vpci_remove_device() create an ABBA deadlock situation with the usage
of it in modify_bars().

Both vpci_add_handlers() and vpci_remove_device() get called with the
pcidevs lock taken, and take the per-domain vpci lock afterwards,
while modify_bars() does the inverse locking, gets called with the
per-domain vpci lock taken and then take the pcidevs lock inside the
function.

> +
>      /* We should not get here twice for the same device. */
>      ASSERT(!pdev->vpci);
>  
> -    pdev->vpci = xzalloc(struct vpci);
> -    if ( !pdev->vpci )
> -        return -ENOMEM;
> -
> -    INIT_LIST_HEAD(&pdev->vpci->handlers);
> -    spin_lock_init(&pdev->vpci->lock);
> +    pdev->vpci = vpci;
>  
>      for ( i = 0; i < NUM_VPCI_INIT; i++ )
>      {
> @@ -91,6 +107,7 @@ int vpci_add_handlers(struct pci_dev *pdev)
>          if ( rc )
>              break;
>      }
> +    write_unlock(&pdev->domain->vpci_rwlock);
>  
>      if ( rc )
>          vpci_remove_device(pdev);
> @@ -139,6 +156,7 @@ uint32_t cf_check vpci_hw_read32(
>      return pci_conf_read32(pdev->sbdf, reg);
>  }
>  
> +/* This must hold domain's vpci_rwlock in write mode. */
>  int vpci_add_register(struct vpci *vpci, vpci_read_t *read_handler,
>                        vpci_write_t *write_handler, unsigned int offset,
>                        unsigned int size, void *data)
> @@ -162,8 +180,6 @@ int vpci_add_register(struct vpci *vpci, vpci_read_t *read_handler,
>      r->offset = offset;
>      r->private = data;
>  
> -    spin_lock(&vpci->lock);

If you remove the lock here we need to assert that the per-domain vpci
lock is taken in write mode.

> -
>      /* The list of handlers must be kept sorted at all times. */
>      list_for_each ( prev, &vpci->handlers )
>      {
> @@ -175,25 +191,23 @@ int vpci_add_register(struct vpci *vpci, vpci_read_t *read_handler,
>              break;
>          if ( cmp == 0 )
>          {
> -            spin_unlock(&vpci->lock);
>              xfree(r);
>              return -EEXIST;
>          }
>      }
>  
>      list_add_tail(&r->node, prev);
> -    spin_unlock(&vpci->lock);
>  
>      return 0;
>  }
>  
> +/* This must hold domain's vpci_rwlock in write mode. */
>  int vpci_remove_register(struct vpci *vpci, unsigned int offset,
>                           unsigned int size)
>  {
>      const struct vpci_register r = { .offset = offset, .size = size };
>      struct vpci_register *rm;
>  
> -    spin_lock(&vpci->lock);
>      list_for_each_entry ( rm, &vpci->handlers, node )
>      {
>          int cmp = vpci_register_cmp(&r, rm);
> @@ -205,14 +219,12 @@ int vpci_remove_register(struct vpci *vpci, unsigned int offset,
>          if ( !cmp && rm->offset == offset && rm->size == size )
>          {
>              list_del(&rm->node);
> -            spin_unlock(&vpci->lock);
>              xfree(rm);
>              return 0;
>          }
>          if ( cmp <= 0 )
>              break;
>      }
> -    spin_unlock(&vpci->lock);

Same here about the per-domain lock being taken.

>  
>      return -ENOENT;
>  }
> @@ -320,7 +332,7 @@ static uint32_t merge_result(uint32_t data, uint32_t new, unsigned int size,
>  
>  uint32_t vpci_read(pci_sbdf_t sbdf, unsigned int reg, unsigned int size)
>  {
> -    const struct domain *d = current->domain;
> +    struct domain *d = current->domain;
>      const struct pci_dev *pdev;
>      const struct vpci_register *r;
>      unsigned int data_offset = 0;
> @@ -333,10 +345,18 @@ uint32_t vpci_read(pci_sbdf_t sbdf, unsigned int reg, unsigned int size)
>      }
>  
>      /* Find the PCI dev matching the address. */
> +    pcidevs_lock();
>      pdev = pci_get_pdev(d, sbdf);
> -    if ( !pdev || !pdev->vpci )
> +    pcidevs_unlock();

I think it's worth looking into expanding the per-domain vpci-lock to
a pdevs lock or similar in order to protect the pdev_list also if
possible.  So that we can avoid taking the pcidevs lock here.

Thanks, Roger.

