Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47DDB2FA84A
	for <lists+xen-devel@lfdr.de>; Mon, 18 Jan 2021 19:06:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.69955.125447 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1Yup-0004vQ-Qf; Mon, 18 Jan 2021 18:06:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 69955.125447; Mon, 18 Jan 2021 18:06:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1Yup-0004v1-NG; Mon, 18 Jan 2021 18:06:11 +0000
Received: by outflank-mailman (input) for mailman id 69955;
 Mon, 18 Jan 2021 18:06:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wFfa=GV=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1l1Yuo-0004uw-Ob
 for xen-devel@lists.xenproject.org; Mon, 18 Jan 2021 18:06:10 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ea066862-f310-46d8-81e6-f13fd6beaf5d;
 Mon, 18 Jan 2021 18:06:09 +0000 (UTC)
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
X-Inumbo-ID: ea066862-f310-46d8-81e6-f13fd6beaf5d
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1610993169;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=yUSq5YASNX3/9TQMPU8TnqizfyiJCygugxcg+Shuk8k=;
  b=MRAhG4GqFhIAKSlSPquI1yDowPvASIfqvhZWZWfoxzZQ4E6N3bfHrHIi
   2SYg4tUSWdtPYKbWDzkbNP6pAsQVVvTtLzCtAx7b7NPWb7md5Boe6tGH7
   pHwcsXu2h3hM/4TRR8YJx1tr1IPbNaxc9q8Bak/3n8Bi4Llu4+190/Sbp
   g=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: xZ2ep1mh4t5VsofrpkJn4rgAw9nD7qaqYNx2Cpd3Am0TJW65fzWLP06SaUyV/8wsKH8fD+tkZV
 wR5l57D1R3IbSVZjhvxNZ5SAlbg26HnPTinoAoro58IoCYozb1zbiMHC3TsdRN4pCs1y+ibl7A
 XHQmXp2RXxAjtpwND6YDKt8bNfXS3B/MpNIYpt8wpQQhbL5jIPGS1RdGSOSGLANYVxSTAU511L
 tSEsQaxSeEXDoVXaItoQBwC+StheS9Ozqx4PN0sF2g6j066yJxf//5DKsE28iQq0R9hhfrqY5x
 AuU=
X-SBRS: 5.2
X-MesageID: 35319136
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,357,1602561600"; 
   d="scan'208";a="35319136"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hfSedh54yrde1M2UEBG3CLiX3vCzbKvBoc3LGK7oFcDv/jSZTNYn36pWTdeUcgBNqWJtWoraNu4RnuR5nlS2HXuYDlYjO6t7/tWynTj2RV1EYCicb+d+XStG2IoZlysRxzYCrwoUYC6LbeBWj3istWJ46iCKQNaaMU16wObs0XDHb6YOCO0j27DN2fdny2+k8FVz1AaNZMcq6uCIvspSEyC782XO7ksf+X8ringblxXdJoQDnEAJ+iS7A1YCJEe3tP0lYPHsYLd5MAej0hyRSn+LlscVuUHetN1iK8M2pufYzidcr/5rPto9p2oeOxTJHC42c/QecMlh/QRYP2nbFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hw/qG9s4frqG75LOIO/yM2thPWvUnSBX3TDFMpMJpZI=;
 b=AZBVpNX+RecUZJdzY6IBF0n/q4l0b8i9xkq92G6KJ5OWNHQO5KlgsAFdzRuvhKD+Znu9/JwKBaazwPgfiEpQHG0cBiwwbkOVhb2xoz/B74Cyz00EplOoGXlGN46s3uZDRZEbBFipTE9XrtMtRqZt2KwFqa3iMbFHoyQARTwJSdFbjyltYL52QOtGMJM31Zd40YjAXnBYmpnzC52Xa60OrMOZHNrI7ZqTFUlZdStwWssTXqrFoSok5/KNlx2iPbTFCdrgf19YvV0FtmQ/GYkcCh39HLWr7P6xQjZB62E8cHaNzEsYzx1j97/4Fynn9KE6M75htorLx7dqKfmLtc5kKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hw/qG9s4frqG75LOIO/yM2thPWvUnSBX3TDFMpMJpZI=;
 b=JBCFEfjUC371PMOp8vw2OdffY5dK4d0y0FjadfUxzprMQNtrBt41wFVV/MF/r/EEZ2ECfirgP2dYyR52MeUSV3RA/IBCCaK4cTuvbf8J28pY0q2g6c05aTHktVXZdu07+j89aPIHFbHNBvuP5Mz27a325I3qpj+F0i4IRjL5kf8=
Date: Mon, 18 Jan 2021 19:06:02 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Manuel Bouyer <bouyer@antioche.eu.org>
CC: <xen-devel@lists.xenproject.org>, Manuel Bouyer <bouyer@netbsd.org>, Ian
 Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] xenstat_netbsd: remove usused code
Message-ID: <20210118180602.6asdxdanoxfcbc7d@Air-de-Roger>
References: <20210112181242.1570-1-bouyer@antioche.eu.org>
 <20210112181242.1570-22-bouyer@antioche.eu.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210112181242.1570-22-bouyer@antioche.eu.org>
X-ClientProxiedBy: MR2P264CA0127.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:30::19) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ac4a9cac-d0ad-4ce3-8ea7-08d8bbdbba51
X-MS-TrafficTypeDiagnostic: DM6PR03MB5083:
X-Microsoft-Antispam-PRVS: <DM6PR03MB5083BCD163E5052F0614AE098FA40@DM6PR03MB5083.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:580;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yO9qd7L7+W3XDy8VOTEZll7QLPRWoVz/e7v7cktw+xivu7ljnYExvrCmbYC10OEcbV5pZqIOxGbhP9PaYJXVAo34zpuh4AxXGc9vMTGV4cxsmDJaQ7qRM+PBfHJKqNZJPcpXUyRJCyKouIxnyawCH+++2w8RsSQGUzawT5w2RE/XnXi3P799p+i9mpXtpTd1fMoGDeQ6LL8eHj45qK0QgThaSpKjzQtyVhOR6GDih+NeUYu5WVBnguwCO7pRajpH6/to83HAo8Mf1aTPxGza41qWxaw3uK6MWEqit8lcb/PTbdXP9bDPD4G/SzfsVR4e0hY+kORuL3qtnkTE8CuaBO9DlQii92Zv+NKtLyWDsgnJIWvXipZPdmC7m+kH/xr6+VIAXfAvdRishbdSwFO8g/bVs6ubswYFNKiEWBIl3CVRlX8PBVaaqM2mgpA+1GBVB/Yxo9XSKN8NfJ+gkVV6m5ANCd4K5mJr+Vz+0MwR1E1xAP8T11eJKL3T34+1npPwtZS5xHpXuy0nEOrE+q5aMQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(376002)(396003)(346002)(136003)(366004)(39860400002)(4326008)(186003)(478600001)(33716001)(956004)(66476007)(1076003)(66946007)(4744005)(6916009)(2906002)(5660300002)(16526019)(8936002)(26005)(6486002)(54906003)(66556008)(316002)(6666004)(86362001)(8676002)(85182001)(6496006)(9686003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?L3htVXlUeVUwek5pVWNZTGszRDRSUGNVbFZlV3NjTkY1ejlMNVl4MGR5UFk1?=
 =?utf-8?B?dUFya2YrazhkVkROWEVyMXpkNkI3WnFjYnZ0aHNMOGRJV3g0UHNidVlLLzVJ?=
 =?utf-8?B?YWpCZGRTS1lUcVl5Vkl5RCtmVi9VYkZ5em5KUTdqNEYyTWVEbkUrMnU3dWYy?=
 =?utf-8?B?L09pcTFkTjFPVlRFMkwzeWZ4OFBwVlFvNUNEZlU1NEthYmVoZnNsSzF4NUVt?=
 =?utf-8?B?MjJkSFN0NkNPeEJyS1lPazJNT29ZZjl5YVlFUHJrNHFRaE9EcS9OTDJnSFVC?=
 =?utf-8?B?eTcyMUVkbVV2VWtxc3hKdCtDdVdwaVUrTzFmTGxNZ0p5ejk3VVRsdkFQNE1q?=
 =?utf-8?B?eXJkRUNVaTBrWEZCTkRKYkU4WVo1NkNsOHdnRmtodEcrNHQ2Q3pZYkJqV2ZH?=
 =?utf-8?B?dkFCa2ZhRys3RXJtelpBc3dGUFVUYzNja0RUOVNBQ1FlUFpCSTUrcDNHOHY3?=
 =?utf-8?B?Qko0NFBWMDdUSm1VTnBHV0lQcDFCNG5FMFBiT2JONlQ4TGZWRnlCR3RPTnNY?=
 =?utf-8?B?cXcwRmNmNEo5T0k5T2NuS1pRK2VEOVZkUnpNTmpkOXE1aHFRYWMwMkdKZi9l?=
 =?utf-8?B?OUMybkoxMzdQaDFIZm1wbHgvZnVrUUo0NWtRdm1sSTE1YVdhdFhTZFVDQlJH?=
 =?utf-8?B?TEY1TTZDN2JpTnNKa0lNem82VEJ5WnVDbTZIVytSdlpPMW8vMVpONStUcE12?=
 =?utf-8?B?aUoyZWFUOWdqb2xndEpUcVUzaEwrUlpiNmptMmZkTVp6MFVvQ1RXa3FFUDlw?=
 =?utf-8?B?MzJFSmxhYVJhc2FORUppQVI1WnFyNkhLUUdoNCtUTlRlMCtDcUg4MWxwSFB5?=
 =?utf-8?B?Qk5mVmhKNkplNlhJT2tYNGJpa253dmZ6b2lYZUl0N1BNZXM4WnRYVmNpLzN6?=
 =?utf-8?B?cnRKSHpyYktKTGZpRi9pc1FDeXp6elpXcnZBWkpCS3d0UHYvUlp5NTJTOUky?=
 =?utf-8?B?dVVaemJSaUdBTjZScmR0eFpMOVRpMlBWc1JxQUpCYm03L2toQXZySEJFQ1Ju?=
 =?utf-8?B?ZU1TelRyV25vd0RvNURENGN3SWVrUkJlM2RZbzByd3VuSXk5SlNEZkhBYkYx?=
 =?utf-8?B?UFZ1ZHl1cThrTHNkTkNseVUzQ1UrT2N5Y0VNTjZqMlUycW5QcTBXWjR3akw5?=
 =?utf-8?B?OUFRMkp5NlBiMmFSaFg2YmhBSGc3cmIxWmQ0N29XR3MwU3Z2QmJlV1k2QVcx?=
 =?utf-8?B?T1Ria2dCYkVpYjNoSllFTU42MTNTQytSczN3UEVNTHRGK3dpS0JIb1BNblFO?=
 =?utf-8?B?QkxZb01iT2tWQkZpNFlvR0JLeG1JUnplSEJyb25ZbVNEWXcyb0piYUk2QmJh?=
 =?utf-8?Q?JiTb5OtnBEoWKPfQ8qP9v8X8AUV5ZXCQxL?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ac4a9cac-d0ad-4ce3-8ea7-08d8bbdbba51
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2021 18:06:07.2199
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: keDsibB47Mk6G3adBN7KRmbPLoCNy7/40kCvDVpsE434BQpMEo0aiVOQd+RJmO+FH+/ifXHvpGwbTygKRPpi1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5083
X-OriginatorOrg: citrix.com

On Tue, Jan 12, 2021 at 07:12:42PM +0100, Manuel Bouyer wrote:
> From: Manuel Bouyer <bouyer@netbsd.org>
> 
> remove PROCNETDEV_HEADER[] and read_attributes_vbd(), gcc complains that they
> are unused
> 
> Signed-off-by: Manuel Bouyer <bouyer@netbsd.org>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

