Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F21322ECD05
	for <lists+xen-devel@lfdr.de>; Thu,  7 Jan 2021 10:42:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.62819.111406 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxRnG-0000Hj-Ox; Thu, 07 Jan 2021 09:41:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 62819.111406; Thu, 07 Jan 2021 09:41:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxRnG-0000HG-LI; Thu, 07 Jan 2021 09:41:22 +0000
Received: by outflank-mailman (input) for mailman id 62819;
 Thu, 07 Jan 2021 09:41:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FiKg=GK=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kxRnE-0000HB-W2
 for xen-devel@lists.xenproject.org; Thu, 07 Jan 2021 09:41:21 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4850c977-809e-4bef-be53-73eccf31fbd7;
 Thu, 07 Jan 2021 09:41:18 +0000 (UTC)
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
X-Inumbo-ID: 4850c977-809e-4bef-be53-73eccf31fbd7
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1610012478;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=naehgeSBDZJop/yMjCnmN0KUXY9rHisLEcDgPOOpSms=;
  b=Q+fStOVescxOi5W8v6Dwe9LfOLVF436d3sNOZOpFnuHXGa4RtUZafQZj
   GFFWfryOY9M8oum1AsyWyELYceJtqm4dWz1WxV/7HUXdv3pJzNWS88+sw
   /jfPntSz8BGuaXLMuO3nb5461QftFv3q1CwHPsHKHKjE5nlo6fed8VeFt
   o=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 7abj7DIphiTAvFZDZmEsev1LoYM5lqlSqmbuGv7OCRJkUthGhPv+GrMvsXqn8DU0prZNjDmaJp
 o+Yp9yeo33Bk0k6h2yCGVWuzrxadAwUnooPS15uq8QlHf7XD9FWr947pooowQ++sGYk0xBpTYI
 G6/z9qhKJoW8ozH4JkZ8uq4q5XYLUF7slgmdu9YMhSxpj3iMKpwB00w14D6V15ilI8m01J1seH
 M4HWj5zVphzqbT7iygawJOUM/RjAkInkpFI8uf1s5JFNEyZxld/Tsc5vFZIAhTf7UxQk3GXEJs
 Xlc=
X-SBRS: 5.2
X-MesageID: 34563669
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,329,1602561600"; 
   d="scan'208";a="34563669"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lkKtH86i3rap6TEPQz645pK7fkcQcNiDyNZ0qilrZD/vC7jw3ebtSnAfiJ1Uneq2XygXQmK0dUVqHDfaAU/ZwvFemaRvGbkPfc0KNQxmM3gwJme8YOgYW5VWo4xPlfw+y8oBuviZ7PSid5xSkJdU/H/ZPfjYp/GEYIPBcpn+GpCCx+9grMr9zhZPqATnRV8O2ITT59bYKPo/fWhaDbc/NMBjOqQzdmPOi8JDVAeCICDvyoQ92HJDR9Fy9ZKqiTbm/qSmWE6ivKhR30USgZyzHCOVP+e1MIwOAFxlu0RFrHK6c7vpEqCD8ZPYokTl4PgbRKwFk/4Uj53dlyt4JtnyiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=naehgeSBDZJop/yMjCnmN0KUXY9rHisLEcDgPOOpSms=;
 b=InhUGOIeJ5bj30emd72Dy1GKFW/s32+SoGQqz/mi/s5AxXHudL/VGTua22NtOrfa0ZujPBy6/uE/Hiy4A/veztwMahc7j0J3t8Q3og6kTA3gQ3wEY0V2bOATLn1J8zcIkc7gqi23gO5/99DumnjRHrImHZuBi99GW/83UYxqlPwqOCX6H63nbo/8TSjnWpyDSvwgVdIhC0hTX5pum9buB3mAGAQ+alLFay0HpGvQk8Q4xBE7txoEEOkYqr7YpEWPz0t0sD1nWczXYdtuZyHn1n5XA0W/m3hD8OV3NzMP60jHPNwVpS4DYgdzYPRF/E7Q78iwvXQSHDbCPqoq+92F9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=naehgeSBDZJop/yMjCnmN0KUXY9rHisLEcDgPOOpSms=;
 b=ibyxkVzavE+DUB3OXEn2Py/OpVMRFDaGBs7VrzyeMDA2kImTBbcz/Nn7regK/OozI8oP6JFxyz9jMyTu50c8UD52/v74vGSy0dVPw5HR6oMhWpy8Gidxz0FxMPtCFapk+uVvQ8Q+9+dP1Rw8UUtaheUpa52hxSIu8w+6cDFF4z8=
Date: Thu, 7 Jan 2021 10:41:07 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Wei Liu <wl@xen.org>
CC: <xen-devel@lists.xenproject.org>, Jan Beulich <jbeulich@suse.com>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>
Subject: Re: [PATCH] x86/dpci: EOI interrupt regardless of it's masking status
Message-ID: <20210107094107.5tt5s2b3y66rncco@Air-de-Roger>
References: <20210105183143.94547-1-roger.pau@citrix.com>
 <20210106210416.ekexubhrak74qoq2@liuwe-devbox-debian-v2>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210106210416.ekexubhrak74qoq2@liuwe-devbox-debian-v2>
X-ClientProxiedBy: PR3P192CA0047.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:102:57::22) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fa37318f-457c-4bfc-7747-08d8b2f0603a
X-MS-TrafficTypeDiagnostic: DS7PR03MB5463:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DS7PR03MB5463C85DE378013163F49B2A8FAF0@DS7PR03MB5463.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uBl6HiSB5ipoNwpn19dQGwni4evFgr5xRXr9aMEh1b0BlYwlxFRKy5yMdrqCWBiIynltXuSzkMtd70AQ+yERQDLrMIi6hlBUqQOindi7LTU13houKeOiO2f7L0QALTLCbYGVCanTTI8Jh6NKnx4kw3MkOKS/Z4qJRN3qbz+RO6/2UtFiS1wvm1wgab1CpfSsHhsyx5HZ+JO4OolGhbHlmoTWudpb85GE67JAm5bFsbYI/i98o8jlFLozWUMamfHPTXBTGlP1LOQgbzttQ9rEQ5c2AKFiocg/3EHIT2E/2xuKE/lafbfd+hrc2Go41T5cGUua7guxAatmerXIvLHa+VmyBudN1uCEUeX3EmNMd0YNU4HMKqYiuDceZ1IennOZATc2vW4ZXLUYViVVv0w8BOFNJJnqYcOLMQANJ6GzWVbdS2T+ia/rl0hFHDb6aZWc
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(396003)(366004)(376002)(136003)(39860400002)(346002)(558084003)(86362001)(478600001)(5660300002)(6666004)(85182001)(4326008)(54906003)(6486002)(6496006)(316002)(8936002)(66476007)(1076003)(8676002)(66556008)(66946007)(9686003)(33716001)(6916009)(186003)(26005)(16526019)(2906002)(956004)(26953001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?UWNJa21oWmVhZWM1RDVkWGhXcXlLczQrZnRLeVBMdGlDM1dlZXJXUkgzT0tU?=
 =?utf-8?B?YU40VGtVQWtoSk5EemNYWVRWZGs2RUFONStNMTR2TUVlTi9jZmc2dTdZY0Zv?=
 =?utf-8?B?dzVkZjYyWmlic2I1ZHVIa2l1cEl5WUNTTGM0cGh0VzR1eEV4eVVJOTlOV0dX?=
 =?utf-8?B?VERZcTAwZXBhbVlrSG1NWk1iVnZUenVRWHpGT3NLR0g4Z3RVblRvNDNxeHFI?=
 =?utf-8?B?N3ZhMHpuQW1BQ2VPMFpzN25nY0RtN1BNOTdVVUt4bndhYVNhVGlQNmxOdkVt?=
 =?utf-8?B?c2V2dmxZeWp5eDJsYnlGNXI0S3FjNjZacDRsQ0VYRSt4dFRjR1FmVFVoeFl6?=
 =?utf-8?B?R1hLZ256YXFqeVBiODlzUE9ieURiRC9ZcE9yOFd2NEdoT2lvOFdzdlhsM0RV?=
 =?utf-8?B?aHk4YXhaV2RZaittTTlFR291UkJ4UjRYaTRXUC9qem5laDZUOTlDMnpwVGR2?=
 =?utf-8?B?K3M3UzkwOWRmVks5b1BCWm1VL2hXYXhpRDdZVW5ER1cxeVZGWjdqVmxSTE9n?=
 =?utf-8?B?NmNmZkJRRUEvblJjM1ZLSXdPeUxGUWx5VUdoOU9vcnZKY1BNcVoxWkJselBJ?=
 =?utf-8?B?MTZ3OERhUlcwVjcrSUNLMHI0K0hSQWJkbVBQMlVNdnRkS0IvcnJXWkduTkds?=
 =?utf-8?B?cHd5WEdaZDdVd2M5WGpRdUNqRW53MldsQTNZMzVBVUZja3VOZEhxV05GdHJM?=
 =?utf-8?B?S3lDL3N3cHl1b2FMa01VcVluRmZDS1hoUE9sa3dZUGtONkdoZENxaG9QSmtX?=
 =?utf-8?B?TG9KbE9YK0RTNGs4SnFJUjdQWGwxOVhtZkhqMDJja3RQNWdvUHhNRXI1NE13?=
 =?utf-8?B?RWdjMS82WlJUVnJWdk10cEVMY3JOV3paUjdHZFpTdUhVZk9Kd09KVU5KTWxU?=
 =?utf-8?B?bjVYaktxVXErRFNGTDYwamMyejUwclhldENnUFdPUHh6ZkhudERvZm1vYy9w?=
 =?utf-8?B?a2tDWHZER09OUkozSDlrVWo4S05sTUtjVmxoRFZlSTN2a1hKSjZJYm1nbG00?=
 =?utf-8?B?YkV4aC9RbXpIZHdIeDBkOWpqWVA1ZWxzbHhBcm93UTZkTFB1ZjN6eTRuQStR?=
 =?utf-8?B?bDNTeU8xcXVsZnhBM3lBSVQ3eTh0b2NXcWtJMmJmd0psb1BkKzhXTDRkMk1C?=
 =?utf-8?B?dnMvNncxWVZjYXczRHI0VStqbzcxR0ZnQkVEUk1MTmRNTEZlM2lZYkdtWkpP?=
 =?utf-8?B?bkZPNDVtc1pKb3RRUFo5d2F4MHVIV09yZUlVVUVqaU1YUGJwSzNtMUNpNVhj?=
 =?utf-8?B?SkdmZmR2NjZqNVE2QURDdWh4QVJXbmtwTzl4SEppRnIzcmV4V0VaQ0lxRmxL?=
 =?utf-8?Q?bQdLfOiBwkfdAVXibtbzVkaCwrFbjrHclI?=
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2021 09:41:14.8179
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-Network-Message-Id: fa37318f-457c-4bfc-7747-08d8b2f0603a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 43ouMhO/lpF16xVHqdADPuvCcmKu8AWmkxHj0J6dcBTxvttDaVp7rKkc0hTEJtnrmABCZBwZmeONOIbVw/flnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5463
X-OriginatorOrg: citrix.com

On Wed, Jan 06, 2021 at 09:04:16PM +0000, Wei Liu wrote:
> Typo in subject line ("it's").

Ouch yes. To whoever ends up committing this: can you please fix the
subject line?

Thanks, Roger.

