Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6079143B34B
	for <lists+xen-devel@lfdr.de>; Tue, 26 Oct 2021 15:41:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.216444.376053 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfMgv-0001Ad-La; Tue, 26 Oct 2021 13:40:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 216444.376053; Tue, 26 Oct 2021 13:40:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfMgv-000180-Ht; Tue, 26 Oct 2021 13:40:37 +0000
Received: by outflank-mailman (input) for mailman id 216444;
 Tue, 26 Oct 2021 13:40:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=d0pl=PO=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1mfMgu-00017t-7x
 for xen-devel@lists.xenproject.org; Tue, 26 Oct 2021 13:40:36 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4badec3e-3662-11ec-842f-12813bfff9fa;
 Tue, 26 Oct 2021 13:40:35 +0000 (UTC)
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
X-Inumbo-ID: 4badec3e-3662-11ec-842f-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1635255635;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=nMxPkiJhXX3eZBZt7xRyIOtdYz/D8U+ti/RFH9K9Ey8=;
  b=CyopV/XuWlTLl4/qtocfBDDat67kh1iWgx1vYqToDGqMgKfh7u1mxoIQ
   TQaaT48EFUundvjyZnroTFy+xl10nN9cXd69/ddOVNE9Yqbjp32yQqj85
   BZDYE2iCHjS1lv33uI4odufCx3B827FmFN5IVBmbg+4Xjo2HENWT1FtvS
   E=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: fex1S8MH68AzbxaCBQ2sJ9283UvenL0NBKVfw8XBYPZPaHGEe7K9W7qpJOaavCuYu/WU69TfSP
 BbtEFiCJyH8TAHqeN0Jlu4TaEIjlLpVrBZIW4kKoNmBTzoh1VndEeD9YAGojXW28/yGj+plKel
 cSwTInFM80sLxFzKq/hsQQx7o4weGMlnYn/y81zuendIRYOjc262yPZRCmR9jSreJ2urG1qM5S
 iyOU9ZyUNJFyNavNnOG8/urouvXCVAdryXZ1gHCuNXf5MtvOCQygo/7pS/dv0dOcjhVQG6fmEQ
 yLdcOtx0Fmsg4rD3i4/0isC+
X-SBRS: 5.1
X-MesageID: 56477036
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:z2NtAK7J9Ff8O3SAMIS5LgxRtLDAchMFZxGqfqrLsTDasY5as4F+v
 mQdWG3UOPfba2P0edx0O4y38R9Xvp6DnIVhGlRkpHo0Hi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuV3zyIQUBUjclkfJKlYAL/En03FVAMpBsJ00o5wrdh2NAw2rBVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Zz
 81piKL3ZBcVMrzKxdk7EBADEwR1MvgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALNs7kMZlZonh95TrYEewnUdbIRKCiCdpwgWls2Z8WRqi2i
 8wxQgthUj+fWj10Y2gnVLUdkr6sun7xfGgNwL6SjfVuuDWCpOBr65DmN9/Qe8CWSN9OtlaVo
 Hrc+Gb0CQ1cM8aQoRKV/3TpiuLRkCfTXIMJCKb+5vNsmEeUxGEYFFsRT1TTifuzh1O6WtlfA
 1cJ4Sdopq83nGSwVcX0VRC8pH+CvzYfVsBWHul87xuCooLY/gCdD3ALZiNEadcm8sI6WFQXO
 kShxo2zQ2Y16fvMFCzbpuz8QS6O1TY9KncmWBFDYBs578jl/bwVzRuUTvNoH/vg5jHqIg3Yz
 zePpSk4orwci88Xyqm2lWz6byKQSovhFVFtuF2GNo6xxkYgPtT9Pt33gbTOxa8YdN7xc7WXg
 JQTdyFyBsg1BpaRiDfFfuwJGLy4jxpuGGyB2QAxd3XNGjLExpJCQWyyyG0hTKuKGpxdEdMMX
 KM0kVgJjKK/xFPwMcdKj3uZUqzGN5TIG9X/TezzZdFTeJV3fwLv1HgwPhPJjzC0wRl8wPBX1
 XKnnSGEVi5yNEia5GDuG7d1PUEDn3hWKZzvqWDTkE38jOv2iI+9QrYZKlqeBt3VH4vfyDg5B
 +13bpPQoz0GCbWWSnCOreY7cABbRVBmVMueg5EGKYa+zv9ORThJ5wn5muh6JeSIXs19y4/1w
 51KchUIlAam3iaXd17ih7IKQOqHYKuTZEkTZEQEFV2px2IiccCo6qIefIEwZr4p6Kpoyvscc
 hXPU5zo7i1nRmuV9jIDQ4P6qYA+Jh2niRjXZ3iuYSQlfo4mTAvMo4e2cgzq/SgILyy2qcph/
 OHwilKFGcIOF1Z4EcLbSPOz1Fft73ITr/1/AhnTKd5JdUSyrIUzc37tjuU6Kt0nIAnYwmfIz
 B6fBBoV/LGfo4I8/NTTq7qDqoOlT7l3EkZARjGJ5reqLyjKuGGkxNYYAuqPeDncUkLy+bmjO
 roJn62tbqVfkQ8T4YRmErttwaYv3PfVpudXnlZ+AXHGT1W3Ebc8cHOI6tZC6/9WzbhDtAroB
 k/WootGOa+EMd/OGUIKIFZ3dfyK0PwZl2WA7fkxJ0mmtiZ78KDeDBdXNhiIzidcMKF0IMUux
 uJ44Jwa7Am2ixwLNNeaj38LqzTQfyJYC6h35IsHBILLixYwzgAQaJPRPSb6/ZWTZogeKUItO
 DKV2PLPirk0KpAuqJbv+awhBdZguKk=
IronPort-HdrOrdr: A9a23:YLPcSaGZTbxGO745pLqFcpHXdLJyesId70hD6qkvc3Nom52j+/
 xGws536faVslcssHFJo6HmBEClewKnyXcT2/htAV7CZnichILMFu9fBOTZsl/d8kHFh4tgPO
 JbAtRD4b7LfClHZKTBkXCF+r8bqbHtmsDY5pav854ud3ATV0gJ1XYGNu/xKDwReOApP+tcKH
 LKjfA32AZINE5nJPiTNz0gZazuttfLnJXpbVovAAMm0hCHiXeN5KThGxaV8x8CW3cXqI1SvV
 Ttokjc3OGOovu7whjT2yv66IlXosLozp9mCNaXgsYYBz3wgkKDZZhnWZeFoDcpydvfpWoCoZ
 3pmVMNLs5z43TeciWcpgbs4RDp1HIU53rr2Taj8DLeiP28YAh/J9tKhIpffBecwVEnpstA3K
 VC2H/cn4ZLDDvb9R6NpuTgZlVPrA6ZsHAimekcgzh0So0FcoJcqoQZ4Qd8DIoAJiTn84oqed
 MeQv003MwmMm9yUkqp/FWGmLeXLzEO91a9Mwc/U/WuonhrdCsT9Tpd+CQd9k1wgq7VBaM0oN
 gsCZ4Y5o2mePVmGp6VNN1xMvdfNVa9NC4kEFjiaWgPR5t3cE4klfbMkcEIDaeRCdo18Kc=
X-IronPort-AV: E=Sophos;i="5.87,184,1631592000"; 
   d="scan'208";a="56477036"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ob3DrVv+b9Oe76vmESdgIARPUPoxhmWPaLN/5K3sjBjMnJv/yPrViwneB97JD7nYQbzYLIhVn6nbs8rYMXDyrHDkz+XrofYHxy+KtuBKBkOhiBwYHfaa0dmzLv5v6RyoRDDDgXF0DbVYXxoDaTjrbkpDw3xK4qzXJW7asUBmNBYB1C3HVdvOzSUYROnLuq7fahBh18eF5ARTljNh80Nfl+a0rCBXYT7B7dAJBy3wgUG0OSc8WPFEBPb/YCyJV2KAC9OGw4F7RKku5JnIJH+FthQ+KJZemo5M1LCvc4twThd29UPTR9POT/JEuPxACeDrUWydFwwPMS0xvCYLVtAZRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tjYSvRpet7gm6YxK64R7Al/jcQCA4Ww53OXbvsIJD98=;
 b=DbEA9BSY7gZoikFDEYZbQrH+Aa3qpWeND0oOHF75Z4zz/HciZ83qRimK1LU2RQAuDILrtYOGo+1XTA4qpESp0vGxm9bGa0TmiGLAYsuLOEtqabYkISyhQwDUws1s9CDOaze7ne8mXhN8kV2fmslQlmcTSJkln5CiQBk42uCd1Sd7wfmUnn40Y/L/jOeOkPaK2XnST2wqlStI7OWgaBlj6a+zN9FDGV0yZMsNo/VZaxMIJgafLQOdlE/hOp2GJwRFhktvpcw1ODZfo/cuEO2V+JJJY4u/xTvyqeRgDtk5QK3Xwi6BPgFoJHizBtXf/TKPacLKJZ9BdRvhF+T9JlyzIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tjYSvRpet7gm6YxK64R7Al/jcQCA4Ww53OXbvsIJD98=;
 b=JwBFhIuUWsyjzwI4ZmvStNhwxgedap9K9jx1et47EdjgMpCMCLZZnMFjN+TdSNBNCr4UCHE8X5SlbS+oNVVyuVR8lRUFBY4QZBh7/BP/wVawISuRBetRdaOALMsCI0+K5Wz0uJ+U62R2shrN4vRFut24CooNG3TgwMmRaBEgHGM=
Date: Tue, 26 Oct 2021 15:40:26 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: <George.Dunlap@citrix.com>, <dunlapg@umich.edu>, <jbeulich@suse.com>,
	<committers@xenproject.org>, <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2] governance: communication channels
Message-ID: <YXgFSgHhhEpXsvpQ@MacBook-Air-de-Roger.local>
References: <alpine.DEB.2.21.2110251845500.4586@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <alpine.DEB.2.21.2110251845500.4586@sstabellini-ThinkPad-T480s>
X-ClientProxiedBy: MRXP264CA0028.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:14::16) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f78e8702-9b0b-4b8b-6165-08d998862e4f
X-MS-TrafficTypeDiagnostic: DM6PR03MB5065:
X-Microsoft-Antispam-PRVS: <DM6PR03MB5065A5F8FE809FE2FBBF6F4B8F849@DM6PR03MB5065.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1751;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yWXOAcJbi0ioA7KAjqhe9+oFBXqX84mPc8KjcOzngaTJk/MfyLabJBHwWipd/dinrF6f1Dg6MAvcw6wg/U6XK7twiByfhKgffwZ7WgqvyLljRPR/HDXEuyUac1dOEjlSeYqkRq9iHwbJE/7pPhQ5rvCiUfK5DGgruuZKDQ8bbCIc8iOFTvgqaM7/y6UgUhUsCpt/l3bNVhY4MpZSVIrx9LljH2dpyCkeUQ71TFaRbVWX32KfBSMhzm7VmjrTqDSVC83yJ9az+CoLG9gUaVx3x3NNu9jgZ8EposMl6ZIwZSrjQHSHZN23pdTChk9Yrm8KJnibeWDHHIF98sYzqQrj6xwz4ObtWIrRSxJRjuj28j43wBQn2K13HYz363u92UveCl22D/+B19Gn1w0oVoQfsTK3+vwkV4iURe21iQwBliidtYS/5D7q/OGlr0XHZnkmrw29UNP5Ldowy6QCBBWLxg4DbEWK3bG/PgEIrCDryMdfFjAc0ZCMcroMjxooUiLHXluXYIa/Roz/71+qRIZhgJjW6new7g38Z+C1xHsJk3n4eS3W04E2IkN+dkZ9janzyNoOpZT+dG9xF43V7acgA8vV+Iz76GvrrdNUMQti502lL7WOKaLtxnmks5KAIdWjUIGcrNKqrIfR+SgN9eOiYA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(26005)(85182001)(6916009)(38100700002)(6666004)(8676002)(6496006)(6486002)(558084003)(508600001)(66476007)(956004)(8936002)(66946007)(5660300002)(316002)(66556008)(9686003)(4326008)(186003)(82960400001)(86362001)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?LzIyQnJySlRwdXk4aTVEVForVm9XZjlxTW5lZzJzU1RadTFFd2dWTGxXL2RX?=
 =?utf-8?B?WEpLTmJiRXNOclA5ZURKTlFWd0JGTlFsR1pVb0JoSzI0c0VIQlB6dksvY3M5?=
 =?utf-8?B?SC80cGVNMFpjL1FqdEdiWTdKanhEbUE5aGFoOHB6eE1qNFI4T04zWWVhSFhO?=
 =?utf-8?B?bDVoKzh0Y3pOQUVjT0JwZkU1czJxMTRTeElqVEtpbWlVNlhtbDNiV09ycHlI?=
 =?utf-8?B?Mk4vamhtbjdobGZuaEZ0NDh5STlvUkU2dHpqZEJRaU81VFdTVjNmU1RFNklL?=
 =?utf-8?B?MnFZZkZUNC9UN0pSU01iZnE3VnNRSnZzWUhyWWxlRkowQVMyTENXeWJ4Vi85?=
 =?utf-8?B?bkR6MnF0VVBVcTY0YlZ0MlZxK1RiVm1jeDVxNXJnNnBxY2RHNjF0Y3QvWXh3?=
 =?utf-8?B?S1N2LzJ3QWkxM0lCUUJHQUVzV0diS2kzTldaajg3U3hmbjdyWDMySURycEYw?=
 =?utf-8?B?YytnZGczaTMzTS9wWUJhd0ZibkNWTGxiYXVndzBKdko5UGIydlo2aGM2dytQ?=
 =?utf-8?B?NktuRmlLeGVtemVFSHpteTJPaGNZdmRielNaand0VzVWYkYzSjdNNGNYL0Jt?=
 =?utf-8?B?S2p0ZHBQZkxLbGI4dkRsRWc2MExVVzByZ05tNU8zZFhCWUIzOEZ5d3orTFYv?=
 =?utf-8?B?WlI2RlBBR2RCWG1UUTk5YkNPMGtyZlNNZ0I4cC9SLzRxOVU2bitNYXZPNVg0?=
 =?utf-8?B?eEpEeGhaaDBkMlkyRFRCeU1jdnJ2ekFBN1Y2VHRTOUlPZGJsaWZhbmlYeWRL?=
 =?utf-8?B?SC9xQWpMbVFGVDJJOVh6aVUxSGZaZDJMUU9naHJUNnFoMmJaNUQwNzAxU0U0?=
 =?utf-8?B?TW9SRVkvQkl4Q0VvRkVQd0taZitGVjA1Ykc3UW9yMHFyWWxGdlMzZ205MVpw?=
 =?utf-8?B?RTRnNDFLbms3bkN3SUlUSmVzbCtpWWlhQlRXRisyR1FTcUNxWmIrRG9XSVlI?=
 =?utf-8?B?TnU5QkxtWWNuMVVnWG8rQ0FobUpUdWRGYXl6dkpsTUNFOG5pdUxQcnBpcDYr?=
 =?utf-8?B?ZjdXSXQ0UDB3M2Zock9lSHpEelU5MTIxaHFLSkFiZ0NJM3d5RFlXNFB3NlMr?=
 =?utf-8?B?S1dIWDZvbDAvVnNxcUhMQ09UM25YSzMzUGRBTkU0ZVZ2dUpXMzZYWW4wV1pU?=
 =?utf-8?B?MmEyYlpPR2xiKzBxRHVhM2lKdnZaalQvRVY4ZjMxR1hTTGNvd1FlYmRJczFu?=
 =?utf-8?B?ekpNdnRLQnFmUjNURUdmeFZpdTNSV3VJRVlFWDZmVitRbk5rSWJuMGNJdGtV?=
 =?utf-8?B?ZzQ1ckpoeFltK3FydE1HWGFDL1BKWVRoY1BKMUMrdlk0ejFxcnRhUzd0dERp?=
 =?utf-8?B?UnZxeE1jUndraEF4YkhBcjRUcFpBU1orSFZwTGRZaDk4c0xsRDdvcVVvMzFq?=
 =?utf-8?B?YVhtWVdHbDRrQkR6aDVUaW1JY0F3OUpVQkhYY3psTFM0Y1hqNXpiYmR1TjlF?=
 =?utf-8?B?dEJDa1E0bW4vd3R6N3V3QWZWcjV6bVNyRGVjbWlaYk1QNm0wL1lpT1RibkdU?=
 =?utf-8?B?MFoveFNTZlhRRHdqTzBsSWxBY0J1bHNSY2lFS2VhOCtaL3B5S0RnK0dyRTNz?=
 =?utf-8?B?bkFJSG5CTkdYMlBLMHFwa3lFRWwzSmsvSXBGdDFlYW5VZXpVQXdoQ0hydDNI?=
 =?utf-8?B?NDUrL0xSVDZBaGNGcUllTDd2V01VY0ExNGE1SGErbUNqT2RYQmprSE5nb3ow?=
 =?utf-8?B?UEE1d3dVMzJYNC9ReElEOS9RNVNiNnNFNEFLbzBJTmZzcVp2dkhWeGs1UGZh?=
 =?utf-8?B?bXl6K0I0U3UyYUROTHZVaWtzYXZPZUZ4c01wY0pBTmFNSHRETGkwZmtMek5H?=
 =?utf-8?B?N1NqUnpmWjNpblJWZXpPcllVaWs5YnpTRGFpTmVxNWw5OU9lT2Y0MHJYVTNH?=
 =?utf-8?B?aTUzVGx4V0tXSDRrZU0vRmIwOEpXbWYzbXlZRGZLUEpZZ0Z6TkMwZGRHVmZ1?=
 =?utf-8?B?MHY2enNSVW9qcXhNUnMxQWxIeHVCallBSWRTZmhnTTRjUitIVGJ6Nm1IZXVk?=
 =?utf-8?B?SGJvYWpUd0RRWXN4a09hamIwQmRtSTg1bWg2WTRFRHBzd1RlOTlwK2xrQWlX?=
 =?utf-8?B?M3FMREw4d3RvOFM2Uk5Sbmo0TS8zNlN0V2wrRysrbGg5d3FDN0N6eFBMbktQ?=
 =?utf-8?B?bXZWYjd4WEVNNkQ3R1krYkZoVEN2am1oSGtlTFN2TVhQTjFjZnV2anF5bENn?=
 =?utf-8?Q?PqXsgKuhrNixDbQxXJTK9SM=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f78e8702-9b0b-4b8b-6165-08d998862e4f
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2021 13:40:32.1879
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pDmf15L8lwauD1a71B2+RN3kySNdAtymCL3pHTpr3JTea8vc5Khjzk+dFExQgHbspj7kQqwizGjx2d7WW6al9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5065
X-OriginatorOrg: citrix.com

On Mon, Oct 25, 2021 at 06:46:45PM -0700, Stefano Stabellini wrote:
> Clarify that xen-devel is the only official communication channel.
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

