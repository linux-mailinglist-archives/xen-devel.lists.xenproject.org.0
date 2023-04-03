Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B5466D43C3
	for <lists+xen-devel@lfdr.de>; Mon,  3 Apr 2023 13:44:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.517396.802646 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjIbv-0003bP-DX; Mon, 03 Apr 2023 11:44:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 517396.802646; Mon, 03 Apr 2023 11:44:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjIbv-0003ZH-9D; Mon, 03 Apr 2023 11:44:31 +0000
Received: by outflank-mailman (input) for mailman id 517396;
 Mon, 03 Apr 2023 11:44:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=W/KQ=72=citrix.com=prvs=450b71a79=roger.pau@srs-se1.protection.inumbo.net>)
 id 1pjIbt-0003ZB-IY
 for xen-devel@lists.xenproject.org; Mon, 03 Apr 2023 11:44:29 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e2224a1c-d214-11ed-85db-49a42c6b2330;
 Mon, 03 Apr 2023 13:44:27 +0200 (CEST)
Received: from mail-sn1nam02lp2047.outbound.protection.outlook.com (HELO
 NAM02-SN1-obe.outbound.protection.outlook.com) ([104.47.57.47])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 03 Apr 2023 07:44:16 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by SJ0PR03MB5853.namprd03.prod.outlook.com (2603:10b6:a03:2d0::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.34; Mon, 3 Apr
 2023 11:44:10 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda%6]) with mapi id 15.20.6254.026; Mon, 3 Apr 2023
 11:44:09 +0000
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
X-Inumbo-ID: e2224a1c-d214-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1680522267;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=MgN5akSc15Gle+v7aSaA+1Daes50i5XlQsd5PTdXRAQ=;
  b=Q4rxInMefbKne/G6v8WPWCnOLxCeY93gn4FBXjwhJXZfHeLK/bYxTTcp
   ENYyLq9xdo7FfDRm7J0iy9u8BOB7dlUczGHCgRbMpzrY3McASYysaWBfS
   3ZNTmn9BVJl23a3ASED8DnGwnmryvTaISLT4LtS6vHn6vlqqK2Yl2+KAI
   k=;
X-IronPort-RemoteIP: 104.47.57.47
X-IronPort-MID: 102904644
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:mlhrX61UOZVmlorjE/bD5eZwkn2cJEfYwER7XKvMYLTBsI5bpzcAy
 DNMC22AbKuPMWXzKYh1b47i8RsOvJSAyYJhTAJppC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefTAOK6ULWeUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8tuTS+HuDgNyo4GlD5gBmPqgS1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfC0IQ6
 eQSIhUxMB3dib6d3qKmWtJwv5F2RCXrFNt3VnBI6xj8VaxjeraaBqLA6JlfwSs6gd1IEbDGf
 c0FZDFzbRPGJRpSJlMQD5F4l+Ct7pX9W2QA9BTJ+uxqvC6Pk2Sd05C0WDbRUsaNSshP2F6Ru
 0rN/njjAwFcP9uaodaA2iv03L6XwX2nBOr+EpXgq8ZLuwS/m1ZKI14WfFXghKeGrlSHDoc3x
 0s8v3BGQbIJ3E6hQ8T5Xha4iGWZpRNaUN1Ve8Uq5QfIxqfK7gKxAmkfUiUHeNEgrNUxRzEhy
 hmOhdyBLSRmrbm9WX+bsLCOoluaJiw9PWIEIygeQmM4D8LLpYgyilfUSI9lGavt1NntQ2msn
 HaNsTQ0gKgVgYgTzaKn8FvbgjWq4J/UUgoy4QaRVWWghu9kWLOYi0WTwQCzxZ59wEyxFzFtY
 FBsdxCi0d0z
IronPort-HdrOrdr: A9a23:jWwQvKnUYeSkO4uI1OiHpmkKk+XpDfLo3DAbv31ZSRFFG/Fw9/
 rCoB17726QtN91YhsdcL+7V5VoLUmzyXcX2/hyAV7BZmnbUQKTRekP0WKL+Vbd8kbFh41gPM
 lbEpSXCLfLfCJHZcSR2njELz73quP3jJxBho3lvghQpRkBUdAF0+/gYDzranGfQmN9dP0EPa
 vZ3OVrjRy6d08aa8yqb0N1JNQq97Xw5fTbiQdtPW9f1DWz
X-IronPort-AV: E=Sophos;i="5.98,314,1673931600"; 
   d="scan'208";a="102904644"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iFhXLTVEItfp1DLIYa3L9wwHl7QAUQCDsB8GSi+fKpdlfxMzoWWVuxfEWobem8+CWWzocq3YxWoZHOIIkAg3tv0/LB7Et4Sk6C7JaYFDY8aia+jahxueXmCI2MFR+kKE5rtvRa0UF7afZf7/PchYbUNkCPjyc3guIbGHjjY2mzarnVHVaZI/mtK9BkvY7xQyr1fMUx9I/RPXunFJcBgg91BTFB3sh6DDdqEHfawZnhUay38IwNGpKQe9IjhS8RROBUCujrOzYDLBin7Mcs5VO9Ax+jRYHrWvJcBOxMxEUHAkELZ2wIhi413kHgowlNBQxZet9bWCO4Km+Fp0hunzeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GDY6ZPt2ogBpnfv4hBUOFEYDGrLLJXxL+TTEDteGKw4=;
 b=dv3e76jrtr1xVHetxmjX8DlIhGNK8TEGARIPlLpGxw1dHh0UQ3/oq/fFPBtm6CyCyeVT/UZKVxDP4hJiwGgeO9vfXtph62CrlsmdbwxSBSMkT/K7vnJokg9gkBQA8Z/J18QKt+2N3lZZwrtxb/DEvcfqcd+Y8bD5OViSy3nvoySB11oMd+iVpiGEZC9uQf2ma4gy9uBp8iWr5f3TtmGu9p1pZiKs5sSKWojucshehCliMykNipCOlU7rElvR+alAdgmRAB+diwF7gDZz79UXjJ8Yq0bBptDIWVvHxj4Ux5Lz8+hnQ7sZA3ismA1DGAFt4BnLG5HCVJel/vwUEIIbMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GDY6ZPt2ogBpnfv4hBUOFEYDGrLLJXxL+TTEDteGKw4=;
 b=kQrVgZrGYcdEmY025Bcw/gWDriD40XJHZe44/5HdUPTmZFSj2Eoytlu7qQFVjXvCPr/v65p1AuUfJBRtoN/Y0Xa0BUsY7rnkzpj26kLWtaQIIQmpk5zmy13KXZXrej8GhznBB5EzwH5Is6wCImUxzwntTfF9QcWRmt7/s1A905Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Mon, 3 Apr 2023 13:44:05 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Paul Durrant <paul@xen.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v5] x86: detect CMOS aliasing on ports other than
 0x70/0x71
Message-ID: <ZCq8BQU3lqgxSp6Q@Air-de-Roger>
References: <5426dd6f-50cd-dc23-5c6b-0ab631d98d38@suse.com>
 <8f2fa47d-89b7-b39c-e60f-edee1de5ca82@suse.com>
 <ZCqz0YCFUifIlthC@Air-de-Roger>
 <be49b5d2-f4a0-44f7-0f6e-56c0e63e9da0@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <be49b5d2-f4a0-44f7-0f6e-56c0e63e9da0@suse.com>
X-ClientProxiedBy: BN0PR04CA0199.namprd04.prod.outlook.com
 (2603:10b6:408:e9::24) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|SJ0PR03MB5853:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ebf2394-e93e-4d97-9eeb-08db3438bcbd
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	OlPD7bVk9CGTz0PdgPTUKivu+0/DNWjjsCR3+0Qjb+OmgKkODqBktQ0G2BeBBoE+XNe2smJVj/UV3ffqLAmUh+dt7hsgMYq/Q/3fwQ/tAEWlyN2qcp8ptg3XekI3gbz2ixts8X1C/ZnA2H9f8LQHl8c8JsCtSMm0kjNHVXXsZc33HDUr4SX8WThtj9MLo7s7R0fcMJKsnF7hH3aGFMbgnweD3ixCAEf2paKkCG+36zbX6kgYGFSlO4gvPBkOs2S5p27gMkqjD9VIAqRhOecF69BKjC0EDZve2XGuuvTa9QlrVbXr5IlJmVmD/amlEr4euT23zUFXrbR69eLdUYeSxdI6MHSbTtZwn0c8fXwuHHLZ3m4W/G8F18JsUwmaHrCRLmtnolGnj/h2nNRQjuR5to6hm+vkpV4eeSEuciPdFw/kF/k7zxdpLCtQVzyQSdKAdl9sn+WMtrfFY6LxCPlDnKf5EeXqOYvXvwXYShoXjIS/FphvgXx2n3nWIzlOCUgm2v8Tv1WBKHbV2qN3H5OsOS1ko1kM5CgcrPhCzhdg8tcTatrlTSvk9pHrZatg/ww9
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(7916004)(4636009)(39860400002)(396003)(376002)(346002)(136003)(366004)(451199021)(2906002)(38100700002)(5660300002)(82960400001)(66476007)(66946007)(66556008)(8936002)(85182001)(41300700001)(6916009)(8676002)(4326008)(54906003)(316002)(83380400001)(53546011)(86362001)(478600001)(186003)(6666004)(9686003)(6506007)(26005)(6512007)(6486002)(33716001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bDYzSDVZOVdHUjJXdTQ2ZW5Memh5WGN4TDNNRUJkV3BTYm9iT1R1NnhMVHBw?=
 =?utf-8?B?Q3loMnZEQWlETG5paWgzSFNwYXBFeEJ3dUI2L0kybHYxVjJJQ1AzaWNuQStk?=
 =?utf-8?B?STdaQkpQdmt5S2VmZzRXdlhxc3pUZElnajZaakt1Tm1YQXdQZUxOTUlFandi?=
 =?utf-8?B?eWsrdW5QMzFmbW5vaGNTUzRwSkFJNk1PVndNZnBYUkw0WkNPb0hxdmxRNmwz?=
 =?utf-8?B?WndKZEYyQ2RFZUNjSDc2bGEyaFhybXZhdFh3bG1zVkdSNlNVNVNZUGQ5LzBX?=
 =?utf-8?B?WmgzWXRSaWZYa3N1ZXRnVVRlQ0FRTVlQdHhUaWFTaTNXK1JZSGl2b1dtSUN2?=
 =?utf-8?B?YUdoSExBcCtQZmN4QlQ2NnRPSGRUV1c0WWlkZ3hBYytaUWhNVGFXbFQvVi9G?=
 =?utf-8?B?R3BLSTc5WUM4MTJvSnBiSnVndTNvTEdkb05KNnQ5bnhycUJjbGpvOFNGbzQx?=
 =?utf-8?B?d0V1OWVPR3M4V1FoU1FmSEJjSUZyZHkzYzQ1aXlUWmowZEV0cFBoMFZWb0hk?=
 =?utf-8?B?b09MUWg1UU5OVFI3cnJFQWJLVE12Y2Y2bGdueWtJMEE5cG9saUtMR3hkSjd5?=
 =?utf-8?B?WE5CRUpMNnovclVhbmVqWjJidmd6WjRGL2FIQis0YkE5WmI5MTJoTktOVUho?=
 =?utf-8?B?VjViZGJJSjlPM1BMNmNKTVFjb2FsMDYvcWVNWXJERVBYSEs3Nzk3NWhybjVm?=
 =?utf-8?B?dTBySFY0eDNhYXg2L0Z5VVdBeFp2OWhLeXlWZUxwUnJEdTVmZ1lldVFNbzNh?=
 =?utf-8?B?K3NHZjZqcjdjK0wzMEp2Y2V3My9DQWx5STJFcjFqVEw1NFdNVndRZXNpNGhP?=
 =?utf-8?B?Q3BEQnliSFN0dm1IOVBTbnlYeXc0TVJSTkdXVENiMVcxUHhxZ3lVL1BOaGxQ?=
 =?utf-8?B?RWh1MXdZWUcwNjIxeWxTeG5sRGY0ZUpZZkJIUndvTU5pVFh6UzNIbEUvdllj?=
 =?utf-8?B?bUpxdkt2cFB1VVhDMnI5QUdqakF0Sjl5K0hUSlN0Sy8wc3RXZkpiVXo2UHNG?=
 =?utf-8?B?SVNURTAwYXh6VlpidDdjWlExRzAydVN6NHkzaVFJNGJEc0V0U1hoYlJhWitq?=
 =?utf-8?B?V1crczBqeEE3UzA1d0pTZlJCMGRNOGYrZ0RwRmJFNDJiMjl2STRyMi9nVGJ2?=
 =?utf-8?B?SWZaaUMxNUdSZkVZcEdjMUJYdjloK2ZVbG0wbkh1TUo5RExOY0VWT1FQUFVa?=
 =?utf-8?B?dmo0cjllN3BxdjJlMVNrZ2VDMWp6Q2xHUHd4d0dickUxZlRnbUZmYUpLUU9h?=
 =?utf-8?B?N1lGTVMxNkZROGRScUlvZXE5TkJsaWlhd2xJeGdIZDE4WmorT2k3ZE10YWxJ?=
 =?utf-8?B?MzBxQnREeVp5clFCTUo1Nlh2cURma3puK1Q1dGVZVm12THUyRGJVLy93RkNr?=
 =?utf-8?B?RlYzcnJXczIyUEM2R3JzREViTlVLS2FwUEJJU0I3TVM3d0J2N3pUdFdQOFg0?=
 =?utf-8?B?VlJkUjJ4QlFTS2hPQ295Vk1PWFlQb3BmLzM4amU1dnU5bXBjcVV2L1dEYVhO?=
 =?utf-8?B?WEF0NnE0OXNtRzlrQ3JHYVN2cklHSVBwb2NrK3F3eWI0elBYYmJXR00vL1lm?=
 =?utf-8?B?dFdvQTVqdC9pMGtjZGtVL01lTUcvRU9ZU2RoZXh6SVRuOUt4N3lJTy9kem1i?=
 =?utf-8?B?MWtoaWt4cWdNYitDWFNUZmdnb0xpWGZURTcwMW51MEtBNUVGZWVScWhYYUZW?=
 =?utf-8?B?NDRudGg3SjFndWkzdUpXaUtCNWFETDV1b0czMWZ2OEhjZ081UVo0a01sOUx1?=
 =?utf-8?B?ekFVb1c5UHlWS3V6RkNheDJoVFlYOU9WN3hNdEtHWE9adWo0Nlo4NDA0YUtY?=
 =?utf-8?B?T1RacEQvem1GWkpScGgrU2pOZ2pjSkYvRXFnRlUzc2NyZVhYdDZuZUpyWlE0?=
 =?utf-8?B?UisrOHBDODRDODVFVFhpSWVNUkZqZ3k1cWduTCtYQ0ROMlpGZGt2SEk0QlZi?=
 =?utf-8?B?MDdyTWFYdUF3QTNyOGdFcXNXNGRhd3JqbWJMZjdwVWUxSTlyUy9pdGpIaUNu?=
 =?utf-8?B?c25rdHBBRkN6aklKNnRkemtLeENQcjQ4TmczQlhObERnTjRDbGxhcm8rNHVo?=
 =?utf-8?B?MjJmcktnWXpxdHdTVy96a0liWEtkSlhTTldFY3hleW9Wa09aQzNPcE5EMzcr?=
 =?utf-8?B?dHNGTjRTclIrQ1A3d0p2VC9JRU16N0JtUVYxTHBMam1oU1lCVVRUTHpQempB?=
 =?utf-8?B?VkE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	7Sma2PuAt8zP0CMrLo3bsg1YXKOKxKB1RjgDg7olFq4qPSTtPk2jukpjP2Jj2OGBhy4/l6xASaWGX0/Mbk/TGRtqbSPsP+NZSmX7KiNdOHNhJ+sFnLBMpghGVKxMFtHivm6l2HLYtZwRXVe8OgcxTzdKr9JXjdbv2irFUCrGNfGoj6mkkAacVRhGPd7mzdVBUCvstNFELVfmJKvloxCDx9pwVCcTVSaecY0rAxXJtxSt4AoUScn7aZVlnRPPZFw5LUybt3XcwVIiGXM7v1raUPtLv4NXiwu9UrPsDi7qglNXfuAM5uXbqf8xXtEmrjRlEF6yiSEnIATyBxa7jvUAf3pngEavChupMVLei5Cu6zqe0nPiljva5i8K1irkIQvLRiE7EEfmVlwc9HXmShGFmS4++lBqGqg/jO11vPH+JCyS83zBciM/isaymJGB4Jutb9fn/1DAtnaYvOX5GopVrAnd8WCOpTqdpPUfb2hzm5opF6Y54K2ElSXtTaS58u2INy0Jn/RLPMS9jvazm//UcfWWAwsGZ6yhfzhSB925je7h3cZnGgKd/dOlOPghjVlFYLgsMmN2itw7Q5x5IyqPldztjFzLoHqPsBihT1y+lv+0j6HlCVnM/7jgCybPoKrKp3r608mn8GN7i9mjJi2HqnKQpPUYNukQrLT8iz0ScqDgDSAnIYVZ9trR/SE6yTEjfOJowrGiNKpSrAXKrxh4d+nxBHQoRkfFf1RduPjkkhAfLBh9jph129kBug+BZ5k70HMFOgxkfv63ceuDpfm2v6FQsHxRByElpvIGXUAsPxBF56OKHGiCVdBNsVRmAki1
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ebf2394-e93e-4d97-9eeb-08db3438bcbd
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2023 11:44:09.6857
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nxlWr4DejAlde6ieUF2PEt9AYfDnb11Gi4IY6dT/6+nR1zEkup4ccgeYKzR7hfFHXpLO+VTuHG0T7sWHN5lmGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5853

On Mon, Apr 03, 2023 at 01:26:41PM +0200, Jan Beulich wrote:
> On 03.04.2023 13:09, Roger Pau Monné wrote:
> > On Thu, Mar 30, 2023 at 12:40:38PM +0200, Jan Beulich wrote:
> >> ... in order to also intercept Dom0 accesses through the alias ports.
> >>
> >> Also stop intercepting accesses to the CMOS ports if we won't ourselves
> >> use the CMOS RTC, because of there being none.
> > 
> > So it's fine for dom0 to switch off NMIs if Xen isn't using the RTC?
> > Seems like a weird side-effect of Xen not using the RTC (seeing as we
> > would otherwise mask bit 8 from dom0 RTC accesses).
> 
> I haven't been able to find documentation on this single bit in the
> absence of RTC / CMOS.
> 
> > Also I'm worried that when Xen doesn't intercept RTC ports accesses
> > from dom0 could be interrupted for example by the vCPU being scheduled
> > out, so a vCPU might perform a write to the index port, and be
> > scheduled out, leaving the RTC in an undefined state.
> 
> I did specifically add "because of there being none" to the sentence
> to clarify in which case we avoid intercepting.

Oh, right, sorry for the fuzz, I didn't parse that last bit of the
sentence.  I'm fine with the current wording then.

> >> +bool is_cmos_port(unsigned int port, unsigned int bytes, const struct domain *d)
> >> +{
> >> +    unsigned int offs;
> >> +
> >> +    if ( !is_hardware_domain(d) ||
> >> +         !(acpi_gbl_FADT.boot_flags & ACPI_FADT_NO_CMOS_RTC) )
> >> +        return port <= RTC_PORT(1) && port + bytes > RTC_PORT(0);
> >> +
> >> +    if ( acpi_gbl_FADT.boot_flags & ACPI_FADT_NO_CMOS_RTC )
> >> +        return false;
> >> +
> >> +    for ( offs = 2; offs <= cmos_alias_mask; offs <<= 1 )
> >> +    {
> >> +        if ( !(offs & cmos_alias_mask) )
> >> +            continue;
> >> +        if ( port <= RTC_PORT(offs | 1) && port + bytes > RTC_PORT(offs) )
> >> +            return true;
> >> +    }
> > 
> > Maybe I'm confused, but doesn't this loop start at RTC_PORT(2), and
> > hence you need to check for the RTC_PORT(0,1) pair outside of the
> > loop?
> 
> The loop starts at offset 2, yes, but see the initial if() in the
> function. Or at least I thought I got that right, but it looks like
> I didn't (failed attempt to try to address a specific request of
> yours, iirc).

Hm, doesn't that first if() cause that on all systems with an RTC only
PORTS(0,1) are allowed?

> >> @@ -1256,23 +1330,25 @@ unsigned int rtc_guest_read(unsigned int
> >>      unsigned long flags;
> >>      unsigned int data = ~0;
> >>  
> >> -    switch ( port )
> >> +    switch ( port & ~cmos_alias_mask )
> > 
> > Given that the call is gated with is_cmos_port() it would be clearer
> > to just use RTC_PORT(1) as the mask here IMO.
> 
> Hmm, personally I wouldn't consider RTC_PORT(1) to be reasonable to
> use as a mask (even if technically it would be okay).

OK, never mind then.

Thanks, Roger.

