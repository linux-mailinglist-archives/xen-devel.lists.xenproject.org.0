Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92F9135882E
	for <lists+xen-devel@lfdr.de>; Thu,  8 Apr 2021 17:23:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.107412.205349 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lUWV0-0006vO-DQ; Thu, 08 Apr 2021 15:23:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 107412.205349; Thu, 08 Apr 2021 15:23:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lUWV0-0006uz-9s; Thu, 08 Apr 2021 15:23:14 +0000
Received: by outflank-mailman (input) for mailman id 107412;
 Thu, 08 Apr 2021 15:23:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3iLd=JF=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lUWUy-0006uu-1P
 for xen-devel@lists.xenproject.org; Thu, 08 Apr 2021 15:23:12 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e3728f53-766f-46ff-be71-92d0b686487f;
 Thu, 08 Apr 2021 15:23:11 +0000 (UTC)
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
X-Inumbo-ID: e3728f53-766f-46ff-be71-92d0b686487f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1617895391;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=4KU8twvSkDKRI1bCA66Z8y9pvrij5UKphJG8t8KKZSI=;
  b=U3pXZ1Kx0RsFQVrilvcSZg0JyPl3DAWn9vzgC0u3HGVkdHjGZavdAFho
   h/bkBMCJs6MY1fSdT4aAanBdgFJJS8FySxqL0JoMWKpyFXnImF/4NUkdY
   dzACFCB1e5mSbETWvLTRu9tJbkqD0MWbXW96HEbxjRgixMdoWCwtmSAfD
   Y=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: Gi2IRrHB5VNRa/sTmTw1QNgNq1EVQykaIyuSUJ4ttvwUYXWgKs3JqB8YScUaYYRO2WRazUjnV2
 z8nXzYyJAqDnpjfJVE4tg0qxYh2QW1f5B2I94iUWLk+tN4I/VQRj13yb/DXuYw3bPd9jPBuyhz
 HClKqTaxvATv5WkCE7LTNr1aghZs7k1L3fw9y1BdoHs7+z7xDE48b+kTAcGJv67IZe880Um8ay
 KhXxQeeUHTruT3w5JemuOiRR+nd9Q9Nm4k+DPU3P6dD/adrphZR1Nq7JAZyPhRM8U1XctI0icN
 WUg=
X-SBRS: 5.2
X-MesageID: 41562848
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:aUGBwKmcgbP7UcLgCSV8IjllGm7pDfO9j2dD5ilNYBxZY6Wkvu
 iUtrAyyQL0hDENWHsphNCHP+26TWnB8INuiLN/AZ6LZyOjnGezNolt4c/ZwzPmEzDj7eI178
 tdWoBEIpnLAVB+5PyW3CCRD8sgzN6b8KqhmOfZyDNXQRt3brx7hj0ZNi+wOCRNNW57LLA+E4
 eR4dcCijq7YHIMbtm6AH5tZZm4m/TgkpX6bRkaQyM28QXmt0LS1JfWMTi9mi0fXTRG3Ks4/Q
 H+/TDRy62/v5iAu33h/kDJ6ZA+oqqF9vJiA4i2htEROnHQjG+TFflccpmjmBxwn+218lYtl7
 D30mYdFuB+8WnYcG3wgTaF4XiY7B8U53XvyUCVjBLYyKSTLlJKaLszuatjfhTU8EYmtt1nuZ
 g7p16xjJZLEQjG2B30+tmgbWAVqmOPvXEgneQP5kYvN7c2Vbk5l/16wGplVL0EHC789bk9Fv
 hvAMz29J9tACynRkGckW91zNO2WHMvWj+AX0gZo8SQlwNbhXZj0iIjtYEit0ZF0Kh4Z4hP5u
 zCPKgtvLZSTvUOZaY4IOsaW8O4BkHEXBqkChPfHX3XUIU8f17doZ/+57s4oMuwfoYT8Zc0kJ
 PdFHtFqG8bYSvVeIyz9awO1iqIbHS2XDzrxM0bzYN+oKfASL3iNjDGYEwykvGnv+4UDqTgKr
 iOEaMTJ8WmAXrlGI5P0QG7cYJVM2MiXMocvct+dEmJpu7NN432ps3WePveP9PWYHUZc1K6Jk
 FGcCn4Jc1G4EzucGT/mgLtV3TkfVG63Z8YKtmZw8EjjKw2cqFcuAkcjlq0ouuRLydZj6AwdE
 xiZJfukqaxo3iK7X/Fhl8ZfyZ1PwJw2vHNQnlKrQgFPwffarAYoeiSfmhUwT+hKgJgSdjVVC
 pSvU5+967yD5H4/1FsN/uXdkahy1cDrnODSJkR3oeZ493+R58+BpE6HIprFQvKEBRxsR1wqH
 hKbTIFQkO3LEKvtYyVyLgvQM3Pfdh1hwmmZeROr2jEiEmarcYzAkcAUyWWSs6RiwY2Tz9yjl
 l8mpVvxIaoqHKKEy8Ske44OFpDZCCyDKhdBAqIXolSh4vmYRp9V2uMmDychSwiY2aCzTRjuk
 XRaQmvPd3bCFtUvX5Vlpzn9155bU2xVUN9YHISi/w0KU32/lJIlcObbKu61GWcLmYYyuYGKT
 fffH85OQV13e260xaThRePHXgr3Y8VI+TYFbgvGoujnU+FGcmtr+UrDvVU9JFqOJTSqecNS/
 uYYBLQAzXiCe8lsjbl0UoNCW1Rkj0Dnvzp0hG+szT98347HPbIIFNpA5scOMqR6mD4R/COlL
 V15OhFyNeYAyHUUJqhz6qSUhtobjX0ikSyR/szqZ9Vsbkp3YEDVqXzYH/t7jV/wB46LM3Ij0
 sQT6Rw3aDZNuZUDr4vUhMc2mBsqc+GI0QquDHnG+MSfVkiiHnAItOCioC43YYHMwmkpAHqP0
 OY/DAY1/DZXzGb3bpyMdN6HU1mLGw94m9l5uWMasn5DxirbfhK+B6fPmWmeLFQDIiDFrN4lG
 cx3/i428uWfTH/wgbeoH9SJb9P6X+uRYeKOz23cNQ4heCSCBCrmaul4Mm6kTfxR3+aUi0j9P
 F4XH1VSN9ChDkkhJAwyQ6oRMXM0wQYr2c=
X-IronPort-AV: E=Sophos;i="5.82,206,1613451600"; 
   d="scan'208";a="41562848"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GsBeJIQuIqoa5nk7q+EDNQp4EiEHuTDUBNjOXWWsrsqQzBqTyUi2kIAvRmlRfPwqaCjDijASX45gFAxLJbEBPDxX06TaYyEa9q94huNyzz8RLXSjXKyqMfap3qSWT8aXRYeM64DOQmaVAJj6jj2+o8RqNzN1aLFFHzwhXm7G8ohNRl2hJP1oO6k0I3VwwhJWpmtvOldxxypTqLE4AZc0nD0oF1PybS5s5fMLDkz2jb5ai8PTGq5cCmjQ8cRLc+wDxOjfocbXOcJMaEooo1+TanrwbtMZf2d9vs/7G5cczDoPzTLDQqqj1mPOnDmEbg727AffLjhLrZrYb4qSnUVFJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ToPtUjBIC2bgU6YSW+8amcXda8QXGfemGcE44UtHH5M=;
 b=OHS5MggJzCbLe1fZwAY5szRbaQ4AkBBZDoOqjOcWq7S7DZaJq54nkooi2DTvqP99o8bdG88XY8RL2eGbY6aoam/IhMJEFd9skwoq5XcfcojoRHv/rEGaP7rXeKLR2uxzmAY2OtP54lW4a1YwHGy6DQItvInTjAHeA6pR6QFeoFTFe3y5ujJcqbcZjaJS7o/5eRLuaj+6d/1f2vcPlwWkpu3OVVmsW/8ebV+3h7uNyexummwNhSE/9vbTtMUQEyezcbRRzhagrZpD4052HDaISj0N2AlXAEGA+A26hrPBulNbomzS69dmfejZ+Jhcxk/Bw/4pQYJsiiU/puzrdmAKEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ToPtUjBIC2bgU6YSW+8amcXda8QXGfemGcE44UtHH5M=;
 b=Z6S4XH4f7WAsk4Utxc74yoMF0lnRlj4YFS3E6VpNbeQS2VjQTe/pCoYDaC5Yvyz/i6NMEEZ9uu9dw9WZCggZSefreqIUmNNU1xqKfao2znAOp3HWZFRVhSptN3hbCy7qha3fL0lXd3LUS6Hl9agjiyEUsBMJCCv14DHu9COkEuM=
Date: Thu, 8 Apr 2021 17:23:01 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, Paul
 Durrant <paul@xen.org>, <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3 08/11] x86/dpci: switch to use a GSI EOI callback
Message-ID: <YG8f1amKV/WHj1/l@Air-de-Roger>
References: <20210331103303.79705-1-roger.pau@citrix.com>
 <20210331103303.79705-9-roger.pau@citrix.com>
 <47616bd4-2e3e-92ea-73de-8ea6fb1992ed@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <47616bd4-2e3e-92ea-73de-8ea6fb1992ed@suse.com>
X-ClientProxiedBy: MR2P264CA0133.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:30::25) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 704f534f-c346-4146-788a-08d8faa23547
X-MS-TrafficTypeDiagnostic: DM5PR03MB2972:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB2972BD9D1D96AD0C971B7E348F749@DM5PR03MB2972.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KOwcSyxykUH+DN4L0jGcB02v4qpsinWY7h2ElwstRwrQTcpiQ1vvCNpWX5g70gDg1LydOp3rcmCILPwB9cBjpySsV1RQc8c+92HKSuvK5jdCPcqkzAHagD5verX5ZwzWiGZdywZDJI61P8o03yu/t6+QXr8+NZVka3ZPyEk6Og6PevSX5xnVHJup1uS1ndVm0hqLRqCInsTKooVOPVWQu9XFMmxc7UOJiPB8028sZsVWZlyQWMKou5rL5a9SObZGJ5k3y/3qYIYXHxNG0fKujMbpCJxEtXXoHtCpFzApjNoKJLNfdYoh74GWgk1ntq3dM0FR826kZt46Sg4jZhCg2UCOq/X3K74SfcdvPBCc/wJ6q2b2t7DxHwsnYBxBE45Z20hJahMngyn3RzL14g2Wi7YPAeL232zCE3NjHZcL2ID5opBiVLSw2siPgW8LUgmrj94414ezOFOxxEsy6mQzDHcQHd9iu6kdbRuViOiNQvJvKLP3KANGaC7BL80DRyQ1P0YmUSx5HI8L5kFn58ByzbAjyCReRA4aWajSn1IbQXs9Y2+toENEXRWHTDtoUutaclldRUpNw8n9rMpJc30RmHOy85Me8D84oI2cta9NW604A+7FQloUjuNYOv/AlnUkdMVsyhq0vGPLJAdT81WkY0f1zcLwP3FqzqB2BSmqJ5A=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(136003)(366004)(376002)(396003)(39860400002)(346002)(53546011)(956004)(478600001)(5660300002)(26005)(38100700001)(66476007)(186003)(6496006)(85182001)(86362001)(54906003)(4326008)(66556008)(83380400001)(16526019)(66946007)(6916009)(6486002)(9686003)(8676002)(6666004)(8936002)(316002)(33716001)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?YW11K2ZROFRrTzEwY3FINXhOR3RmdVpmdWU1OHNWcTRSZ0Fza3dJK3NOb2w4?=
 =?utf-8?B?S3FOZ1gwd1FxT21DVlJRWTR5WjZqem5EaTNQWnAyNVZEa2E0Y0lteEl6VjBF?=
 =?utf-8?B?ZlBNdUdYVVk0SElaN0VRNnVuTkduTnF3ejM5WFJUa3o4elF0clVNdjRKbFhX?=
 =?utf-8?B?Zis4SW4xR280ZGhSeFMzNittcVcvb2ZaM0E5MnJJMVg1alFTOFZaNzI5R0pq?=
 =?utf-8?B?S05CbFNFNHIzZjF1Z3lPRHlIWFQ2bzhxZ0hMLzhiWlY3ZGtudzFHNzNYM1JS?=
 =?utf-8?B?em1IZGx3T1grZjZhUFUybjRnbDB1ZStIL3h3YTNZV2VIMGU3dkNnQU43Ti93?=
 =?utf-8?B?ek9GTTN3MjNjc2tHcGR1OVJFZzVwbHp2TlZsMUpSY2lxbUtaU0xDcDhaZVpw?=
 =?utf-8?B?ZW9zcXFXc05tRDlNdmJlN2cvaHBMUHpNRlNzN09wbW1pd0RxeE1PYWd1eHE5?=
 =?utf-8?B?bnBTVVBiT1NiRG9jaklobHkvTnZORC9tZEV2YWZlR3oycmVsUUdka1pJTUJr?=
 =?utf-8?B?MWsyMDRrUE1mdDdQaTNoNW1xNEpJVStkYTlDMGQwOHVYZUs5N09BZjM0bWQw?=
 =?utf-8?B?QnJIUFhCRjFYdDc2S3Q5K2luemNrRDJLRlgvK1g1VzQrc0hTdlRzSXIyYUJR?=
 =?utf-8?B?SWZjK2RYYzVPcloyNklvblRvTWltMHQvWS8rbUtCT0pHeWxyeHRvSC9kOExq?=
 =?utf-8?B?QmlnYkU2djNReXVnb0RuWFYrZ2t3eHZMeFJRZTFvRGlQbTZBUENra2Vsd0hj?=
 =?utf-8?B?ODJyL3h0Q1hCak1DUnFyTERkMVF2R1ExeGlOeUxHU1VieHUwT3ZjVXlrM0F3?=
 =?utf-8?B?MnJvTXJyMi9CMFFNWXN0Q2xxNVlvOTQxakttNS9yeVpXT0g5THNmNkI5RFZ5?=
 =?utf-8?B?VDB4bjl0bzNzZ3lDNEJaWW5nR3NZUllLQnVnSVN5OHNMVXhsZFlqRFNMTHB0?=
 =?utf-8?B?M25XdEVvd0g2Vy9jUEVlUnN1UGU1eHNpWUFYWUhQa2pxV3lSQlpFc0hKaWho?=
 =?utf-8?B?a3ZrSFBoV3lwRnpETFNKd0E2SmZDRmdHSTRDbk1LYTlBN0hzeE5XSHBEZkg3?=
 =?utf-8?B?clE4MEJ5OXI3SkxsdXFXR3p2SnpKdlpjOS9xTWhzUThPc1ZpYUVSeG9EdmRO?=
 =?utf-8?B?SXIwUVFXVEovbDZWRFlkczc2a2s2RFhmL3VpWHBscTlpNVpZL3lmanFKTys4?=
 =?utf-8?B?c3VDVCtXSWdWbHJKT2JtTys5MEhtYXlsWE82MmoraWI1YndlaDdsY0Z5N3Qw?=
 =?utf-8?B?OTZFL0oveURqelNNamM4U3kweTVVam1YZUlKSjdvcktKZ29QcUo1Yzc2WTlv?=
 =?utf-8?B?M2QrSVM2MzN5UnpqRUpMZVMvR1RTYzdXVU5aYVFuengvNDY4YzlJV0JnOWRR?=
 =?utf-8?B?YTF4SUZXWTZtMUM0WkI0aFdaUTU3NlZCeG01dzJMd3hjQ0J4QjdNOW8ya3BB?=
 =?utf-8?B?QXZ0VkNBcUNuWS9qQ1hjeVljemNEVThuV1I4cHkwaHFWRnAyNU5IQnBrOUhp?=
 =?utf-8?B?TFJ5SlBlWCtVUmovRHNiOHNNQVhPamlHSDFESHhreVVaU0xCLzAwREhDcnV1?=
 =?utf-8?B?SHMvd0ttLy8rSlVMNHhTRHFiRWxuTVcrQ3BiaUNsSnhZbEZGZFZJdFVrVktS?=
 =?utf-8?B?K2Z0L2NwM3NrUjZCS09oM3lhTnJ3cmZhWmVLRkp2VU1SSzRuT1dkc0QzYmxZ?=
 =?utf-8?B?WmhLb0RLYnlOYXVFbFMwUWFGMVQwL3F3SGl2WE1jTlNDN0ZmZnREWXBZRXJp?=
 =?utf-8?Q?GyN+wkf2+EVaTr/PVL3Jb/Zm1RnQaV/ESwo021S?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 704f534f-c346-4146-788a-08d8faa23547
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2021 15:23:06.0359
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qXEofUhL/y+T4jhzadqMs1k97zuJkIeQRtXzopFWg0IQw6N42vbHx+ybq6/tQ/b9dOJYw/J0NkWvnqmNkJ8cBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2972
X-OriginatorOrg: citrix.com

On Thu, Apr 08, 2021 at 04:49:48PM +0200, Jan Beulich wrote:
> On 31.03.2021 12:33, Roger Pau Monne wrote:
> > @@ -515,17 +528,44 @@ int pt_irq_create_bind(
> >          }
> >          else
> >          {
> > +            /*
> > +             * NB: the callback structure allocated below will never be freed
> > +             * once setup because it's used by the hardware domain and will
> > +             * never be unregistered.
> > +             */
> > +            cb = xmalloc(struct hvm_gsi_eoi_callback);
> 
> Is this comment as well as ...
> 
> >              ASSERT(is_hardware_domain(d));
> >  
> > +            if ( !cb )
> > +            {
> > +                spin_unlock(&d->event_lock);
> > +                return -ENOMEM;
> > +            }
> > +
> >              /* MSI_TRANSLATE is not supported for the hardware domain. */
> >              if ( pt_irq_bind->irq_type != PT_IRQ_TYPE_PCI ||
> >                   pirq >= hvm_domain_irq(d)->nr_gsis )
> >              {
> >                  spin_unlock(&d->event_lock);
> > -
> > +                xfree(cb);
> >                  return -EINVAL;
> >              }
> >              guest_gsi = pirq;
> > +
> > +            cb->callback = dpci_eoi;
> > +            cb->data = d;
> > +            /*
> > +             * IRQ binds created for the hardware domain are never destroyed,
> > +             * so it's fine to not keep a reference to cb here.
> > +             */
> > +            rc = hvm_gsi_register_callback(d, guest_gsi, cb);
> 
> ... the one here really true? vpci_msi_arch_update() and
> vpci_msi_disable() seem to tell me otherwise (or for the former
> comment, they suggest there should be un-registration somewhere).

MSI doesn't use hvm_gsi_register_callback at all, since those are only
used for GSI interrupts. I should replace IRQ with GSI in the comment
above to make it clearer.

> It also doesn't seem logical to me, considering (yet to be made
> work) pass-through of devices or hot-unplugged ones, at which
> point Dom0 shouldn't retain IRQ bindings, I would think.

Hm, maybe. I think we are still very far from that. Right now GSIs are
bound to a PVH dom0 based on the unmasked vIO-APIC pins, and they are
never unbound. We could see about unbinding them, but TBH I would
expect a PVH dom0 to just mask the vIO-APIC pin when it has no
devices using it if those are unplugged.

Thanks, Roger.

