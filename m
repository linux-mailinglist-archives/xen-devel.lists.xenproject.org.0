Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BCBC5F3F8A
	for <lists+xen-devel@lfdr.de>; Tue,  4 Oct 2022 11:28:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.415309.659852 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ofeDd-0002K9-L6; Tue, 04 Oct 2022 09:28:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 415309.659852; Tue, 04 Oct 2022 09:28:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ofeDd-0002HJ-Hr; Tue, 04 Oct 2022 09:28:05 +0000
Received: by outflank-mailman (input) for mailman id 415309;
 Tue, 04 Oct 2022 09:28:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AV+7=2F=citrix.com=prvs=269045312=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ofeDb-0002HD-MW
 for xen-devel@lists.xenproject.org; Tue, 04 Oct 2022 09:28:03 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d64414d4-43c6-11ed-9377-c1cf23e5d27e;
 Tue, 04 Oct 2022 11:28:01 +0200 (CEST)
Received: from mail-bn8nam12lp2174.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.174])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 04 Oct 2022 05:27:57 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by SJ0PR03MB6795.namprd03.prod.outlook.com (2603:10b6:a03:40e::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.23; Tue, 4 Oct
 2022 09:27:55 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::861e:b46c:1acc:c576]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::861e:b46c:1acc:c576%5]) with mapi id 15.20.5676.031; Tue, 4 Oct 2022
 09:27:55 +0000
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
X-Inumbo-ID: d64414d4-43c6-11ed-9377-c1cf23e5d27e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1664875681;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=rvB3iHjOVVN6VxzgLzO4tYMh9gN2XwbqdS5lXhIlMxQ=;
  b=YIDQqciFdG4imE9YdHQTzXnKhCCXu1XxClPj8jPGIg9fVSkJ0oEgDfNb
   Z8KG5y289x0bFIbYc43aVrr/su3SoDYskMILM4TjGvNM4Scfkex7qPq47
   iWg/64+15CCdPJW2bxL0yGw3lvZIJXxNakJrpwssKiCYRukmHh/qY+M3z
   A=;
X-IronPort-RemoteIP: 104.47.55.174
X-IronPort-MID: 81937031
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: =?us-ascii?q?A9a23=3ALnCJFa9orFjFQnDtDnxqDrVtTnXEuO9mBUUsX?=
 =?us-ascii?q?f3CRtIx9vdXhiku+b6FwMMm01cbdD4nL4WkTyrq7CIW0Lia/gCEpxFf6gdzj?=
 =?us-ascii?q?OyjA48YN1ttKIZdiutTTevj5JCBkghgV2aCNbdIgO0glQHaKmmcqCaJuxeMy?=
 =?us-ascii?q?GvwrgP7KjQnWG3t7bMytgbFGiEu1Vn3Tmww9NrOrYw9pYXchlFBrDJ3wCsXi?=
 =?us-ascii?q?JyObUcMnYHllmda/o3uZe7pYF/tSQRqY2078NBETISUXA8z2Cq9exV+BmAo3?=
 =?us-ascii?q?eG4ffIb21oOxTka+S0y+Y0sSCQ1qEHjNKTwS2PtwTD1gKcyFWo4gpUOX3JbG?=
 =?us-ascii?q?ytwCTt8/a6ududX/Z56lC4XgmNsaUKtYLBHylvCLDW5WAU0Y1InbIjRB3A0r?=
 =?us-ascii?q?QQBH2QTeJ5e9amLBFr6Ekwe73IJsWYEHGhAJaB5rg3c9RfsP7oDxIUXEcSYL?=
 =?us-ascii?q?5rabC6ZduYrIKrRs0Iou949Ur5FD1ZCZJ65q8/mYRTdHC2wkk1FeSfz6NfXK?=
 =?us-ascii?q?lo+JilULNvYi4p6EyWhU6BaQYpEscXjZwEDIDpXjP84+6dNilUZba9wFs/vg?=
 =?us-ascii?q?/BIKLh1jIBkBWxMIKveSaPmWpPqGTjDN266B9/wLmaCeeQt2EqG0rlkQW65+?=
 =?us-ascii?q?hrPEUQeMxvmtATNNQVlmhvQSsL0YBE3rTQBIBd9HEGuVF0Tn399KL2xlczUE?=
 =?us-ascii?q?AY7qs7ZDZx6e2VJnrDOQjD7AeCqc7b/9pM9KLnGx7+7xzbotC8tA96tPs1Ux?=
 =?us-ascii?q?WmkqFuWeHw3QUOR7zwnwmDI6Xgrg0xmVEq019e5AKNZBzWlz60Q0Zy2HLl2a?=
 =?us-ascii?q?gvWYGTqh6Sx+xCk9Di7rYITXyLbTzK5QW2Yj09KD9+wCp0l94R/x8wMK/gQ7?=
 =?us-ascii?q?xfCZAreR5/pusu2ca340s3oz+7NVz6oLFKB+PgemeiFLhWlJfCFZyjSvMhTu?=
 =?us-ascii?q?K8IqhdzDrWjB9JjdFmEiDAkoj3EBy0XujN/sa3bVSrRVL+yEBK1fCK3WpD4e?=
 =?us-ascii?q?YGtxwL8Uy8h03IUQs18meenqnW09qdYcl0aE58pweAocDDClo9r06KfL/4VY?=
 =?us-ascii?q?LsG2ZWu4RQ59IBj3yTZ8jYM5NhEWcd8U0UZlDiNnVUVwCO+DjFUSoxnLnl79?=
 =?us-ascii?q?51tHkcsUj2jeag1uE7bXqAXy/cAXFvsniRTNL8a7E55RR02EP/DhpZE2l8hu?=
 =?us-ascii?q?uGpZxoQGYHch1UWb/uNNM7W7TEoysg1jdS6PBmcFES084twAO947SAplENz6?=
 =?us-ascii?q?RKkiPKo5OCnBflQ2KR2NX4WAldZbUuXupbeIxlegBb+167x5kuvcIP5QRp6e?=
 =?us-ascii?q?hH46BlMjq7P1noFvTP8PrhHOWTxQgC5QfuzM2tovwB0no0b/boUdVFyfcSQ/?=
 =?us-ascii?q?rYbMoE8qawR8niflGO71SNLP5KNuShDAsAmp8J3CbngcdkYSoRd4h0APPSJk?=
 =?us-ascii?q?XL5ArTN4Hkv8szHXnxlzlXoOKxJNnLhfiuMMBrwQKu9jTSXUFWRbbIQiR6Yo?=
 =?us-ascii?q?E5Giaw3s5APy5tJY60SjxKDM8Yt64LhBng+V1sEDm5Ko9uU7UM/+YSlt0vb8?=
 =?us-ascii?q?Jb0VrUvZw5lt3C7roRiURionYy4l9V06FbZSOFmHoCSjC07gclG1gPYz+LUe?=
 =?us-ascii?q?fN570m3JXbHej3ghGvKJsU7l4yrPAhGRLSaJvVFMA+B8S4tE5yr/nsRnCztI?=
 =?us-ascii?q?yG6ADI6m4OAfrhNaHDtNQ/NAz4A4f8sqII2IPG47J7+3A0GFoflo+9SkLXFM?=
 =?us-ascii?q?Y0ZJdp+SnCIyc/wyr+e54+rPAhHAObik9PnCMr/oBsztH9pfpqdhswGIrjBa?=
 =?us-ascii?q?0zCyyyQwQNgALvhaYKi2TAtH2DwL+07X8T+xDo4rUrSmta2eDntz4vlu1gzh?=
 =?us-ascii?q?SWUhY5jlwKiQ9u6vVDeQlU+t79ANjgsiooFrBJ6IkrOvhSgNzqlyuRJ/7hcK?=
 =?us-ascii?q?sfxfwJldLwhEFyh6/6y9sieu7j9KHLgiV300HPLrz48d+dlCm2pBGoiEHmS1?=
 =?us-ascii?q?ebH4pRdP4z0SlggSZ+uNYFaaTkpM7mbUDHAOmE/ExnmlEeACGRjgOx9DunAE?=
 =?us-ascii?q?8OD5/FhgGWn9+Zpaole4vQSMUJkZ9seuSDNDLzJG0MGL4uA79ZI0HzCFbGLk?=
 =?us-ascii?q?Wl5S0UbeIYTFBvM4Ol3Xhrs3ANrqywank58esSSAosGm3px/cQkyAeBGgzCT?=
 =?us-ascii?q?iIj8MMCM0xv3ez8rCewXZ9b8OajXvysr0SEpveykRqJy88cUo2mSObXXwt1A?=
 =?us-ascii?q?VFgirGOnOpLTZqK9yVSxtuMwvh/fhXsDqzf6M69+C6q96AkcM2TQCdSgfr5p?=
 =?us-ascii?q?NflEbSf9gGkoSV3rLKPhBAsQF/86AlqjIMWsHUaeCFAAexYeG+rqABCLyAyJ?=
 =?us-ascii?q?ZnlDG2+2Auq7bdbF9Wv/f0l5InuQvsdeRSaehLvzTnI/8UeP4Ldh0VttKw62?=
 =?us-ascii?q?+Q=3D?=
X-IronPort-AV: E=Sophos;i="5.93,367,1654574400"; 
   d="scan'208";a="81937031"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vc+Gfv3tTnnWWyXuhnH9MCtWZ4J7GA/brrkA6lMLxpqV469rJUQ6DvZg12cqIIIVpbTOCl49l8/gM+e91r/rPMQaGFXp7sGxv6mqY5SaF1CScbhy2agTxPxNfLwKR/LfKFsx9P+7sxZq5omh4BgEaOYEl/619IYWKRKzDGMUUa1Y5k/byNIlemcEJmwi88aQczPMuOzCRTW5cPXUsy7i0tTJfn3bI+yCIj7F2FQmjxlp728Xt6Qr2BxT3LyH+uOa7lcgwUP2Bc+53/67cjbeHwodzX/huonUHwzCd4sVIo8T2VmP1d+JGPo4uHaZmZyRLI9EZEFGVeHNea834ASFig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n3uBSVoH60hyNSYLt3+BFe7B7dZcfaz0za/QaNp2PLA=;
 b=ASxLIHVANZ8Hj3uVLzjnQjIls8Nh5LgBfOZy1mHmoxCfVth1fRBT7VGpi7TJTLqw/+4Tlw6BsEkCVtl4EXpMffDlAGrXsBj7TGgx3f2igGtdzVGOj9Xgfd8wR5fSQpwZ1tOxOtY4pQAMc2/AavWiV+QxtJhsFG17WaJCpnYhTYY/GIJmcxmL4dF2D78e9D+tEH5MgkgDplP2E3pajga+Yo9O2gicCjY5HVPPq529mE/41g1q3+Pb2DtBjU3JZM0Yz6ILYCT7dEW983twvJChVMeQLDc4vT1+o1csYbUqZeXqMKs4qHmScdeymjT4Cq0S25kED6dPrjYBknsbWuxNEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n3uBSVoH60hyNSYLt3+BFe7B7dZcfaz0za/QaNp2PLA=;
 b=lem++7rWAPj/F0nw1M6DH+W2WrkWdayhWeA8PdEa0rFV8a2DwtXIN4i7bWxTA3iLF53FTPY9wdz1F7xEeIZSu2hkRVMZCyKwh04M3LHf5dNtP/zBZLK4bMmBFwbJ5W8XDQVnTLfEif/+P15ScSkpSk2cigU58uC0KwuEFN2Mr6g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 4 Oct 2022 11:27:50 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH for-4.17] x86/efi: don't translate EFI memory map MMIO
 regions to e820 RESERVED
Message-ID: <Yzv8lpnf28aXgQQM@MacBook-Air-de-Roger.local>
References: <20220930141737.67574-1-roger.pau@citrix.com>
 <e3235c0f-5964-0f95-fcc0-bcc44bf9d784@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e3235c0f-5964-0f95-fcc0-bcc44bf9d784@suse.com>
X-ClientProxiedBy: LO4P123CA0190.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a4::15) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|SJ0PR03MB6795:EE_
X-MS-Office365-Filtering-Correlation-Id: b1fef4cc-d5bf-4308-4a34-08daa5eab801
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3/gxxdjE/9SJyngZw5/rGaaLx2FFcVgmbCOnGimeeuD+VzwHAivLq1mStiu/DAcByvy2zcE7rwNy++3UqDERWKHuIHKtqsQjOWlmk8q8mxBDtq0+2oJWyRMgLqyrFwK3n2PiFeUTbZJoSqT4O0S/AjTnXfLvo23ixypFVOvbuv+ZHTpffPkg0H0f//v4gJfivu7HNpyrrZnvSC22ZiJ6XUpnOVhqWlzqkL0LsKNXSmndREl+XQQ4mCBATJB70SDVQ+WM+pgoqPTnov9BwsKGY53mW8+eGa84ggX88J5CDvE1+FoKI1BQVwSR2uV/9YJ9KgldOACFj775mfOHCdqCpW2pRdeD5PztvchTbmbpBKU2TQol9WSGU27ZosuKjAbuXqqOi4ku0Z4AgmXyVE7tireT9mpZuo7IMBoxNnIPjCT7npTtvCLBcwMAVNYnDy2eNuzTSWTujpQ3IQZQfmcpWJc+1aObjncQ4RiO+V/8xz510HDfPA+zoPWfLG0iSX5+Src3nESZa0/rgPxfAokq22UFdaqFHMHURjAsKBtuGO70vefXmAlJBhsolcIY3spOzfJCKiwWwLe5jBwYk8kXegsUvGIFux8svjOhkcctRl+rwFo6Uy0YZjb7+X5JIUECJeLSIq1ZGOLjiTgil37yriM50i8xx38DUcZAlsEWMFliEGx8eWYkoyR4b3i8svRIfiIOOxyh2Mco6aljmFhXNQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(346002)(376002)(396003)(136003)(366004)(451199015)(478600001)(6486002)(83380400001)(82960400001)(38100700002)(6512007)(26005)(85182001)(8936002)(2906002)(6666004)(66476007)(5660300002)(186003)(316002)(4326008)(8676002)(53546011)(66946007)(9686003)(41300700001)(86362001)(6506007)(6916009)(54906003)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dk5hQUVtdEdqdzFXR3VacjVtK0Q4bFNGaVlaZFFwcXBUTU9XVXVhUnhuVVdL?=
 =?utf-8?B?RG12dVE4OWZyVmladUpHVklpU2NXWDljblpPRlNacDFXMDJLS29KQm02TmlE?=
 =?utf-8?B?MTBFVUl4ZkxZYzJ3eWpHV3hCcHdIeE1Jb0dYazZsd3dyVWRXYkhxZnRDSUtp?=
 =?utf-8?B?TFBuZis3WmZ4QzRjTjNWR1MwdW1LMVdSOXFWMWc4a1l0VUFHNkw4dlBZdWpU?=
 =?utf-8?B?MFI3Q0VjVzZId2VoWi9hRmJoaFRZWDVaeDYxVm1vSmxoa1VRNEMwWFFlVVJV?=
 =?utf-8?B?WnU5YlpsN2JGRXE5YW53eStyUFZhd25CMFB6UmtmOVJRN2hCa3lucVdsbDFT?=
 =?utf-8?B?MWpyV0NCK1NaOWVZcVZhNjB1RHZUS0FjZThYYVM1ZVc3dTFIWFBqVzQwT25L?=
 =?utf-8?B?cEJYTGNMcUtKcmlsMUJyYmhHT3BaK3lLNVppdDJrRHZtU3dYRnpxUEVvVi8y?=
 =?utf-8?B?SUIwa1J2dHJMaEZkenZzSC9rR3dYUzFoV1JCbDY5aU8yTDFzc2twV0t5SzRp?=
 =?utf-8?B?eGdWVHI2VytkdWpJa0ZFNFZyTXh2M2huQTZVN0xYVVhDRFhPd2s3eXlkczk0?=
 =?utf-8?B?cnZHRitYTGtZQnVFQjRCL0NYUXVhUmVrTGl5aE93WHZuMkIzb3c1QjErUTNq?=
 =?utf-8?B?ZkU4OGpFN1MxTkI5bE52RnoxY2ZycEtyWDQvQXNueWtnVWtRQ2tDM2dFTnRJ?=
 =?utf-8?B?MVZNbHdldXh4V2VubmpNSG84YWhTWDlNTVlpcUhUVENsQ3NUTkxNcGVHVGh1?=
 =?utf-8?B?Si8wY3d3R3NQSmlOVmdSWjJJN0JtQjhUcWlCTE9xQjlQenplQmtFaDJwMGtn?=
 =?utf-8?B?MXlreEh4OXVFaDNaR1dQOWx0VjBFWkRyejdlek1KVVUvTk1kUTJIK3MycUFN?=
 =?utf-8?B?a2VBYU5MQ0RVODBtSGtpcmVhKzR1aTZhN2ZWODgyd1h2ZDFzOEpJb2drekp2?=
 =?utf-8?B?ekkzRXVZdWpDUjdZUWhwOFB4OXdJTXp4NnVNZXV1c25hNjRORk04YXhnK2xV?=
 =?utf-8?B?V1NNeERwUDB3YlhDVzVxMUppOHdLczdBZ1VBaFNwdHNKMWljMElJU200Y0hx?=
 =?utf-8?B?VGlvM01pbGVNUG0zKy9POUhEaVFQOGNGYk9ydmtTOS9XQkRKdHFoYnROSy9G?=
 =?utf-8?B?cytyeHFNTnZPNTRneDFubUFGM2JzTnFzZkVwZ2RXbzlxTTFBTjE5ODVFWXhw?=
 =?utf-8?B?YWtEZEJzVEowTGRqVWh3cHIvZk11bHpPaWo5VzBqMVpueVlRVE1nZUY4dnRD?=
 =?utf-8?B?UVlvNFJOVmkwRldoa3pobkIwMlRJeGd0WXRNRG9wS1dhbHhiL2JlUjQrTEhy?=
 =?utf-8?B?T0k1bXlsdUlnNm45emEyOGh2VDFjVEpLWXZqY1BUVzdZWHhldGgrc2hBTmJq?=
 =?utf-8?B?ZlFpOXkrWmpQRU1OTUVhZEdMSXVJaXQ1WEY4VUhtVVI0dW5PNnpkaVMrZ1Fy?=
 =?utf-8?B?dUVJeE1RZTVMc1hkcjBwbHovUHAwV1hyN0VhRXVHeVZ5WDlhSER4OTc5czhM?=
 =?utf-8?B?VW11M2ZVYTJ1ZnpjNG1HSGZuaWlEcE1TUmkvTHVYRzVQTFlNWSt4aGZ1QlJL?=
 =?utf-8?B?QW1uczlGSkpVT05Zc3BYcnZOeTUzSkxJT09UVmxzdHp2ZElQLyt6amo3Tzdr?=
 =?utf-8?B?SFFRVko5T25YdXlqQnJaT2RtVDZaWDliem44QXVhZDNPU3ZmTzVEekxmTWtF?=
 =?utf-8?B?ZkJXRitCZHJSMUs5dEtYMW9kR1k5UGRtamZQbHYvWmw5aTJRM3NWQytOZU1I?=
 =?utf-8?B?ellyNjhIdzJ3WDlFUysxeWpFTERqNlB5eUVtUUVlNXNreGdTN0JrbVFPeDdm?=
 =?utf-8?B?SHJDblFqTG5BWjNva0tUcWF2emQ3VGxYNWYzZ2hwL3NUaXVxOEVBOWpJYnhY?=
 =?utf-8?B?ajd4WUNzOER1d25NZnl2UTBXWGtDTFpMTmVUanZYYnVpUFFHWjFKR0pLakZK?=
 =?utf-8?B?R1ZGa1paWWl3NWI3VTh5KzdGb1BwUTZwM29NR284dE1YMmw0Lzl4eWdxbkh3?=
 =?utf-8?B?S1B4cXhibjd6OGhVZkNERVQ0SFQrWlY4KzJSb1BoNjl2YTJGU3dualFmT0NF?=
 =?utf-8?B?WkNkWmV0akc1SUhZQWJVUEtyalpKcGc0Q1dtR1g5SWo1R1NxMFovU2F3ZTJ3?=
 =?utf-8?B?TFhGS0oxLytWVThaZVZjOUJYYjlCaStTbUVWWG1NbUtYaDhIQko4SnJYQ0Z4?=
 =?utf-8?B?WUE9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1fef4cc-d5bf-4308-4a34-08daa5eab801
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2022 09:27:55.5774
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zq6M/y+A3x82rrvlPzwFiG58VFYoQVo66wu8tOYVil9B8oGVXF2fgBqJkRbSPPlcQDH/o5E39wXLpBdq2xZXHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6795

On Tue, Oct 04, 2022 at 11:01:18AM +0200, Jan Beulich wrote:
> On 30.09.2022 16:17, Roger Pau Monne wrote:
> > The EFI memory map contains two memory types (EfiMemoryMappedIO and
> > EfiMemoryMappedIOPortSpace) used to describe IO memory areas of
> > devices used by EFI.
> > 
> > The current parsing of the EFI memory map was translating
> > EfiMemoryMappedIO and EfiMemoryMappedIOPortSpace to E820_RESERVED on
> > x86.  This is an issue because device MMIO regions (BARs) should not
> > be positioned on reserved regions.  Any BARs positioned on non-hole
> > areas of the memory map will cause is_memory_hole() to return false,
> > which would then cause memory decoding to be disabled for such device.
> > This leads to EFI firmware malfunctions when using runtime services.
> > 
> > The system under which this was observed has:
> > 
> > EFI memory map:
> > [...]
> >  00000fd000000-00000fe7fffff type=11 attr=800000000000100d
> > [...]
> > 0000:00:1f.5 disabled: BAR [0xfe010, 0xfe010] overlaps with memory map
> > 
> > The device behind this BAR is:
> > 
> > 00:1f.5 Serial bus controller [0c80]: Intel Corporation Lewisburg SPI Controller (rev 09)
> > 	Subsystem: Super Micro Computer Inc Device 091c
> > 	Flags: fast devsel
> > 	Memory at fe010000 (32-bit, non-prefetchable) [size=4K]well
> > 
> > For the record, the symptom observed in that machine was a hard freeze
> > when attempting to set an EFI variable (XEN_EFI_set_variable).
> > 
> > Fix by not adding regions with type EfiMemoryMappedIO or
> > EfiMemoryMappedIOPortSpace to the e820 memory map, that allows BARs to
> > be positioned there.
> > 
> > Fixes: 75cc460a1b ('xen/pci: detect when BARs are not suitably positioned')
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> In the best case this is moving us from one way of being wrong to another:
> So far we wrongly include BARs in E820_RESERVED (_if_ they can be
> legitimately covered by a EfiMemoryMappedIO region in the first place,
> which I'm not sure is actually permitted - iirc just like E820_RESERVED
> may not be used for BARs, this memory type also may not be), whereas with
> your change we would no longer report non-BAR MMIO space (chipset specific
> ranges for example) as reserved. In fact I think the example you provide
> is at least partly due to bogus firmware behavior: The BAR is put in space
> normally used for firmware specific memory (MMIO) ranges. I think firmware
> should either assign the BAR differently or exclude the range from the
> memory map.

Hm, I'm not sure the example is bogus, how would firmware request a BAR
to be mapped for run time services to access it otherwise if it's not
using EfiMemoryMappedIO?

Not adding the BAR to the memory map in any way would mean the OS is
free to not map it for runtime services to access.

> I guess instead we want to handle the example you give by a firmware quirk
> workaround.

I'm unconvinced we need a quirk for this. AFAICT such usage of
EfiMemoryMappedIO doesn't go against the UEFI spec, and hence we need
to handle it without requiring specific firmware quirks.

> > ---
> > I don't understand the definition of EfiMemoryMappedIOPortSpace:
> > 
> > "System memory-mapped IO region that is used to translate memory
> > cycles to IO cycles by the processor."
> 
> That's something (only?) IA-64 used, where kind of as a "replacement" for
> x86 I/O port accesses equivalents thereof were provided (iirc 4 ports
> per page) via MMIO accesses. It is this compatibility MMIO space which is
> marked this way. Such ranges should never be seen on (current) x86.

I've heard the Arm guys speak about something similar.

There's a clarification note in newer versions of the UEFI spec:

"Note: There is only one region of type EfiMemoryMappedIoPortSpace
defined in the architecture for Itanium-based platforms. As a result,
there should be one and only one region of type
EfiMemoryMappedIoPortSpace in the EFI memory map of an Itanium-based
platform."

> > But given its name I would assume it's also likely used to mark ranges
> > in use by PCI device BARs.
> > 
> > It would also be interesting to forward this information to dom0, so
> > it doesn't attempt to move the BARs of this device(s) around, or else
> > issues will arise.
> 
> None of this is device specific. There's simply (typically) one MMIO
> range covering the entire 64k or I/O port space.

So this translation region won't be in a BAR of a host bridge for
example?

Thanks, Roger.

