Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD3F6785A27
	for <lists+xen-devel@lfdr.de>; Wed, 23 Aug 2023 16:15:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.589336.921215 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYodA-0006eN-De; Wed, 23 Aug 2023 14:14:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 589336.921215; Wed, 23 Aug 2023 14:14:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYodA-0006ch-AA; Wed, 23 Aug 2023 14:14:44 +0000
Received: by outflank-mailman (input) for mailman id 589336;
 Wed, 23 Aug 2023 14:14:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dmRg=EI=citrix.com=prvs=59206e676=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qYod8-0006cY-F2
 for xen-devel@lists.xenproject.org; Wed, 23 Aug 2023 14:14:42 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 65a26a60-41bf-11ee-8783-cb3800f73035;
 Wed, 23 Aug 2023 16:14:41 +0200 (CEST)
Received: from mail-bn8nam11lp2169.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 23 Aug 2023 10:14:37 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by BLAPR03MB5457.namprd03.prod.outlook.com (2603:10b6:208:29b::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.26; Wed, 23 Aug
 2023 14:14:34 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::50eb:2fe4:369d:decb]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::50eb:2fe4:369d:decb%5]) with mapi id 15.20.6699.022; Wed, 23 Aug 2023
 14:14:34 +0000
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
X-Inumbo-ID: 65a26a60-41bf-11ee-8783-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1692800080;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=JHYkfzGXuwOHKbXSVHjs4P5GRXUGbylRMMm8Q6MUfjA=;
  b=ahr5Q1Hub7acpjFbgFyJAK4+1ZUPn/KG5SQcK5iYi0nHtXT8ugFTcius
   yCXvUb8dj0gGzVXFUVejK12ZtTKngQmzZOTtjqTnWjcjIcY2Jf4nBydE2
   gc8dpgllL1yOGXkOHBiDM6USjxSSbMi7K70Fgxz3cpthpvcuEmlqD1x7g
   Q=;
X-IronPort-RemoteIP: 104.47.58.169
X-IronPort-MID: 120410922
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:rNZudKJ+O4klINRSFE+RnpUlxSXFcZb7ZxGr2PjKsXjdYENShGYHm
 2QcXjzXOf+PYmOgf49wYY209B4AvsXUm9NjGgtlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHvykU7Ss1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpKrfrawP9TlK6q4mhA7gZlPakjUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c5JKHhu6
 f8zAgw9QVeemv+K8qqxbtVz05FLwMnDZOvzu1lG5BSAVLMMZ8CGRK/Ho9hFwD03m8ZCW+7EY
 NYUYiZuaxKGZABTPlAQC9Q1m+LAanvXKmUE7g7K4/dnpTGNnWSd05C0WDbRUsaNSshP2F6Ru
 0rN/njjAwFcP9uaodaA2iv23rOWxXKhAur+EpWA/PM70E+36lcCJyMxRwGBhdSJhmOhDoc3x
 0s8v3BGQbIJ3EqqRd75VlumrWKevxgdc9BNHPY37g7Lwa3Riy6JC25BQjNfZdgOsM4tWSdsx
 lKPh8nuBzFkrPuSU3313qyPsTq4NCwRLGkDTSwJVw0I55/kuo5bphfORdZqFOiylM/4HRn5x
 jzMpy87750DgMgK3uOh9F/Gij6lpZ/UZgcw6kPcWWfNxgpobYjjZJGt4EKd7f9EIIuDZlCEs
 D4PnM32xOsJC4qQkDCMRuolFqym/PuDP3vXhlsHN5s88zWg/VazcIYW5ytxTG9rOMsZfT7iY
 GfIpBhcopRUOROCcqtfc4+3TcMwwsDd+c/NU/nVap9EZMh3fQrepSV2PxfOjibqjVQmlrw5N
 dGDa8GwAH0GCKNhij2rW+Ma1rxtzSc7rY/Oea3GI92c+eL2TBaopX0taTNisshRAHu4nTjo
IronPort-HdrOrdr: A9a23:FasTNKsgqrxsfAf8iQHTDDRK7skDgNV00zEX/kB9WHVpm6yj+v
 xGUs566faUskd2ZJhEo7q90ca7Lk80maQa3WBVB8bBYOCEghrOEGgB1/qA/9SIIUSXmtK1l5
 0QFpSWYOeaMbEQt7ef3ODXKbcdKNnsytHWuQ/dpU0dMz2DvctbnnZE4gXwKDwHeOFfb6BJba
 Z1fqB81kedkXJ8VLXCOlA1G9Ltivfsj5zcbRsPF3ccmXWzZWPB0s+AL/CAtC1uKQ9y/Q==
X-Talos-CUID: 9a23:7fDzwGwlaZVk5eu8vJjKBgUqM9kFbn725kvgDAilFHtVeqWfbWOPrfY=
X-Talos-MUID: 9a23:2o4xZAlHMaB2hKI9V3u1dnpaPso5s7aKJHscvqshqZO+EQFANxqC2WE=
X-IronPort-AV: E=Sophos;i="6.01,195,1684814400"; 
   d="scan'208";a="120410922"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RibFO8GnMhp5HUnQsJAog2OxQlt5fcd8DGF0qzJ32oBx1cFCMcSH7jidkbbi0fy46jpdSBbIWZc85pjy7h27pPFe8tQTKQfOzgt9kfOv/1DtsHxsHcO14TIdkKzks7BB2TLisAoDG64HoKa343MHwL3YNIzCgvb+K3EmAlAjDZOnNm2Dh3GpEJhVnxGaRGs1Zz7w8atRZNXYk4c1YhchsCKOHZ93cRxm20+DgzvODt5lQdMgnq89AXmrkDJXFYckE9P9IlopSb1P/U55ALYt+glfsQ61nkx61h8AJqblLI7i+XEEFrrZH7+P29xV05kOHX2/EHALT0T1AHKJhxZbMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fUsrN5T4FZnQblj0u5TDFm71/MJW8OASu6ZHgaa0RE4=;
 b=L3nlbC+7VTO1K9KelypyCVW5iFQU6ai67Wfo6Fo2nB9AkPwxrVp5c3LZOu4SMVOjul3sBWio+IuJbW1owZKgMPPrzTEGDHc22zZJX6Iz6Fc6r6noh9SRTNZNh2ZYxS8A+EkvNwlej9P2j3nvODXjJKiJkRXPd1KL4N5TjhXN0a53z4ORrPVqaTU/rx+XSb4TrFs5ozeFGyDw37Wu3yE/VBxzCuw3Sr0ktuH9BNZNug4owUpQ0feXbT69eW/ZGXj1g0zRUA41DVSaHoikRo1T9gXJYx7olPgkt7HTIPcn2aBiUlKhFEI5oLMnOM/s24My1C2TgQdWL3gQ6HFr3zwqgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fUsrN5T4FZnQblj0u5TDFm71/MJW8OASu6ZHgaa0RE4=;
 b=fALaF3nwPSa60qOdUt5tMV6mJznkWryNkLupUiCsOCblQOhB7fngTQ26Ce4v5CLnhLmVSDpzc6aKFl1bk7NzCB2uvfxKGVqVwFqLYf9new6oidrKpuOXuHqgNUUTSG8L8yUdiogdVU7F+wTP8CqTSqM14VyUfsIByssdPvSxTAU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 23 Aug 2023 16:14:30 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org,
	michal.orzel@amd.com, xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com, consulting@bugseng.com,
	Julien Grall <julien@xen.org>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH v2 2/3] vpci/msix: make 'get_slot' static
Message-ID: <ZOYURt0D1_CWJzRn@MacBook-Air-de-Roger.local>
References: <cover.1692275359.git.nicola.vetrini@bugseng.com>
 <c6e270c813ef1a4da7045a5fcf7bd9e1b8f21947.1692275359.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c6e270c813ef1a4da7045a5fcf7bd9e1b8f21947.1692275359.git.nicola.vetrini@bugseng.com>
X-ClientProxiedBy: LO6P123CA0046.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:310::8) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|BLAPR03MB5457:EE_
X-MS-Office365-Filtering-Correlation-Id: cdf1f33d-280e-4ff8-128e-08dba3e3468d
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	tIrc4Vf3VevwwK/hpgIM0KIHTIaRS66aP1PpX2+8+eI23umclPEM+6FUxTOf/6aEnq8ynMFYn1bHoN4Y4f+WCIrXKIr82xC23FrG2X6M1NKN+Zg5vt7/dKgWFlgIZ7Ai8KnfrXDHlhIjOEQe5Gy7YZ1emBaKhmn5tmO/G7u8fKXlLHo9xYjZnxaOQWlGdG8KynuMFfgsz9z1G84JVQSjumZOk9a9+Rhg3S+BQp19ai+xF9+xk1OTNG2tJCmOp7y2fGaz/0Ibs/vqLm2pOFsuo2Aewe8cwRVQFqX5MLxbuJ8qW4AFzm++OofVviPpLBuQrEADPENcO6zv01Y2wH+PB4wTOdG7r+/RoMMqvH3mnzh4Z+oUI28P34ZdnkxKm31Hlg6DPiowb3py2eFaA8PV5gOIIVSaObhiaoatdkteLmt1CBam+pmNCBCBW3k0ffY5tbscQhP7KTVGPI851lJY0NF/kq3ypK72vKL6lZeP64NRov7gqho0T/77LT/P/DB8MrJXBapcZEe9gzCCnBqSCmbJxbCXtdA756h/5Dx6MTea9K7CKkFDKO6rSZGooqW4
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(346002)(366004)(396003)(136003)(39860400002)(451199024)(186009)(1800799009)(83380400001)(4744005)(7416002)(2906002)(6916009)(316002)(6486002)(6506007)(66556008)(66476007)(54906003)(6666004)(66946007)(478600001)(86362001)(85182001)(5660300002)(26005)(82960400001)(38100700002)(41300700001)(9686003)(6512007)(8676002)(8936002)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UHlNZWxqenEwTXIxeE9ubnVzU1FKc1dMbGlIT092NHE0MU5WcU0ybXQya3Bl?=
 =?utf-8?B?ZWZJdGcxRWs0VUtNc000cFBpMW5xMGRRSlFDNmFGUW1icEdPaUdOQmcvR3N3?=
 =?utf-8?B?VnAxaFBRbW1ZMkV2QnUwZTZjOWQ4Qm5GR08xTGFjVVh5N1NUUzRCQ0txcjY3?=
 =?utf-8?B?L013SGNrL1JWYXhwZHRhVzRsdUpoZHhiV2dRc3kycDkvRnlydnd5anVWZlNv?=
 =?utf-8?B?eUVoQmNSZUNLZlVxQlVoZVRPVFZ2WTRkUnJSKzk5QVRJZEFvVnd3OWZBVTNr?=
 =?utf-8?B?RS9GWDlPUkh1dStwaTBkaE5QRWdKell6NU0wZlg2V0lLR1dNR21xVlltWC9r?=
 =?utf-8?B?N0JsVktMUk5vYkFmWE4zWjZGb3lYZjMrRDBneFJucTVCaVcrdXFsQ1VlNUpS?=
 =?utf-8?B?ZzF0bmxTWHpma3N4TFlkOHY1VjFtQnZuUTRsb2xUUTZOR09nV1ArWm9TQk02?=
 =?utf-8?B?MGhZa3F3RXQwMVU4SWpwZm8ycG1sd0hIOVdOS0I3R0NsRUpxUFI0RmZqeWRG?=
 =?utf-8?B?M3pXOHphNFArTUNZOFBRK2M5SDZNbC9ZZjE3bEFaWWFlVHQ2dGJVMnMwbXNa?=
 =?utf-8?B?Y3IyVjl4UENiZWxaYklaL2ZlZkNYSkc4NE1zN1VReDEzR0VVV0ZEOEw0WUM5?=
 =?utf-8?B?cE1vZGdld1hic2U0VVJCOWdpUjVpeHNXUGdGQkhvMlFmUjRaK3g3dGt0eCtQ?=
 =?utf-8?B?bkJVWnROYUY1VHVKTVg0RDRUTFB1QjduZUVMVkJnUTIxTXM4L1JZQW45TVJI?=
 =?utf-8?B?WWJSSExueW5DTHB5TVl4RzVaVWRXZ29SdUorQ0lpbnZqNjNPVzV6Si9nWGNh?=
 =?utf-8?B?ZERLMEhZdHBYQzJPeFZxNmZGU2RsTGIvWTVxRzQ3LytqR0RsNkpqU1lpaUd0?=
 =?utf-8?B?YTJHOWVuK2Y3b0N0SHEwREQ1ZmpUQkVPUjRTaDdGSzhDRXN2SERlZjdLYitM?=
 =?utf-8?B?cmY5cWxwcnJJTDgvUThob3JyTk50UmhYNU1LSnJxNElnSEQ3aWw1ajUzUGVU?=
 =?utf-8?B?eUNKQ3NJdHI1U2VvNEJ4NlFOR0xYblBoMVJDa2JzRWdWTkZtcU92a0xRcFN3?=
 =?utf-8?B?S1E4aHByaWlHNWFFcDNCa3lYaFF2Qm9uOWJlUUJVdGd3K2lpSFo1RWg0S1Bu?=
 =?utf-8?B?VUlYdUdTUUZPeVdXcHNLYWk4QUt2WUd1WjZoYlFBRThOczdZVW1KRDdmWjd5?=
 =?utf-8?B?Yjg4aVk1QXJsQnZpWnFvK0JKNWdlKzV6U2Rmc0RTRHQ2blBwL0t5Yit6SHJn?=
 =?utf-8?B?WVlZbjVseGc1bXdDVmtUZjFIdk0vMEJnSzIzdTFmanJDNzRpck5MYzZZcmdX?=
 =?utf-8?B?dW91d2l6cjhsbmZETVZKRXNOcERJcDFsNVBRVUgrblVPSHdiYmgrNjk4VjBu?=
 =?utf-8?B?THpWNGZ2Y3E1ZkxvREs0eE5ndURaV2dBb1RiVlZvQ2lmaE0zdFppai9BVEV4?=
 =?utf-8?B?N0RmSGwrWDdxWkFoZzB1ZytGSGkxdUNDbE1RMlhDcU1DNGxRUDhnQkJ4Qi8x?=
 =?utf-8?B?ZExRd2ZwajVlclJXYVN1MElGVmNxdnlSTFhYMFlnTU5CS2NoZWRqZU4vVHJK?=
 =?utf-8?B?RFNhTEY4YzBLZEN2V1J4eDYzWXgxc3hTUXBuU3cyeHB3RVR6OVhBK2d4ckJH?=
 =?utf-8?B?aW4wbjB4aXJDOElLZnk1RkF1VmE1RXEvOHkrc3FyQXA1bmw5RnRyalhHVVdV?=
 =?utf-8?B?OHFsT05Tb0p4MzE2R21GcUFodVNOSGJxcWtmYXJuMUdSSXJBWFl0dXh3TndS?=
 =?utf-8?B?N3NyNVZiN3VFT1N5eE41MXhaa1hmMkhPakY3aTBBWnJ6K1Q1V3d4N3ZjZXJV?=
 =?utf-8?B?dC9STVBvTFZRUW9kRDZLZDBiQkdxcExIRzNqb09PS3J2N3hMeUV3YTFiV1lH?=
 =?utf-8?B?YTJiTGVzTjRGY3dhYXMwaWpidXJHOWFqdFI1YUpkQ1VPSDd0ZGZmMlNHK011?=
 =?utf-8?B?eUw4S1NKN1Fsek1TZjVMeG5zcG5ReDhuRytQdHM3KzBrZDIzaUYvNnEyTUl0?=
 =?utf-8?B?WU83VjdaU25Od0d2VlNSNFBZcU45YXc4d3I0R0Z5VFdmVnFhRnU5YmpHYjRZ?=
 =?utf-8?B?N3BWUDFLczMxM3h2VjhFb3NZN0Fha1FtQVAyOHFlc3NRdW9xWXpmbENtZEhp?=
 =?utf-8?B?Q09JYUtodW5jWStTbnpjRFk4SWxmampIREpYMWtwL2ZMMFNHZHFQSGFEVmxq?=
 =?utf-8?B?M3c9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	iyqEW2wAMAuGcwXDbmP3FukB26kqq3f6wztTkVojIJA9FhOWsotqNsFfMp4JG3LmnX4TZGF9zphnqJHu3iLLFSKLix4///RCnqY5LmPYq8KnzC84eapxDgD8b+sbq47EvJz3Cqv/t7+GlmfNdVbTo3tQyJfWEVFys2AyIAq9ACSo+p4bN5C7CeOaP09gyZKcMGw3wKrjV74aWzYtU06gCBE95/CymfAOk51kHVcy1ZksynfVuHeWy6PUNNaYgihiNAj4eP7h8I7A6qcVlVOH8l7ZHthc9aQc0kRJ4u9dyb/Gc+oeI+mo4D3XqgSEV9D3yVma9dUgVx+47CFAC0gcCIJkhsvRg+VvZS2+qfUc1vUuzwNi+NKYRTz3vkN023yODjtOb0wO3Sh+rV5EzsBwFtQvfoUwJnd1DM8JjBDk4uSoscPreOVby7wbiMtoyR4OWna+hBZPrR8cqFLK7t0fB7+a5Y7qK7XWpGitLEnbV2aRRyvxtMl7VOuak2R/NhgA9VBhftuijLR2wPqDR9/tR9N2tY2s0WW1GJFrtva06M78xzzMW4vgZM9rRlNoZ1doPk4dVZzujRWje5nRShtkgBzkRH5NJhSOq3jR+HtN1rWUa7+gfhWerIl2CFBhDjTVZRNjAVwEGtOdOq1xSqYTDjZuOFvaoTYBmFaJ3Vadqro41iF+v8DIpozPBNR5i5/da/rnp9AQdSZTQgSgbfgBT8h23EzCtxAai9AGsZF6clZnCfipSwau6fElr70nC2JwvKdRSuQB2HC6UwSDXag38/ztPRsNN01nUYI3ObVdoKPgdh8/+0Q2U6WsZwwVGH0H6H/ub+Ms6jKDw058oc3ygIpScQK5v8AQtcfPLIhsDl88jss5na2aOrYBzXSP2EkRZJV/upSvU87vhI8YB4DemA==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cdf1f33d-280e-4ff8-128e-08dba3e3468d
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2023 14:14:34.0847
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s3vb7VqgNbR7uKYAfHi8VgS03TFT/uYCAAQWAkPbvt+4zSwqZUsTAVcOJb8pyuAVjalWOzIKB1q0oj3eD2oA5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR03MB5457

On Thu, Aug 17, 2023 at 02:39:27PM +0200, Nicola Vetrini wrote:
> The function can become static since it's used only within this file.
> This also resolves a violation of MISRA C:2012 Rule 8.4 due to the absence
> of a declaration before the function definition.
> 
> Fixes: b177892d2d0e ("vpci/msix: handle accesses adjacent to the MSI-X table")
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Sorry for the delay.

Thanks, Roger.

