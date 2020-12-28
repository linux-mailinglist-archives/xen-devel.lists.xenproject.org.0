Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 456AA2E69D5
	for <lists+xen-devel@lfdr.de>; Mon, 28 Dec 2020 18:45:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.59541.104521 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ktwZh-0000od-4j; Mon, 28 Dec 2020 17:44:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 59541.104521; Mon, 28 Dec 2020 17:44:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ktwZh-0000oE-0u; Mon, 28 Dec 2020 17:44:53 +0000
Received: by outflank-mailman (input) for mailman id 59541;
 Mon, 28 Dec 2020 17:44:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=shBg=GA=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1ktwZf-0000o8-Gk
 for xen-devel@lists.xenproject.org; Mon, 28 Dec 2020 17:44:51 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cf96829e-272e-4038-b141-84e148faea27;
 Mon, 28 Dec 2020 17:44:50 +0000 (UTC)
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
X-Inumbo-ID: cf96829e-272e-4038-b141-84e148faea27
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1609177490;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=5LGS3+UTbtcKUWixPrb/RZkvl1ZQM3IwZS3pKmQ1TpM=;
  b=EhVUdHDLSKlr3xD5rT7vTDX93eLG0l/ysdYB2sn35ITYJC1H1OfnZF67
   dMrBZOOaGBlfXVfEIbwv+0b0jt+TcEOcX5MTnYUVx7z1XG3Oi5N/hXzNO
   h6bonJrgz8+X6cqyucTHBasodiseCwvAnqWQI4EbnFETCGBDuVHo0I43n
   A=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: NDe9ExaczJgGE/LvwBRGg7en+xk+3tfKDOK4iSmMruT5xHVnvkBL/JX8MXj96scZQcYNLzwDyr
 zoDw9kLk8PL3fHhKJMRfizb1cqELMvjGJt+c+WpS1VY+fhgiHYmyZJLNWmlyOrqRBMuD+A+Nux
 YbCSfMhF406U66qi+0GMRrhgjHNtPf7/okW9G+tFUx7KntqIPZ0hjVh9wh/19iQwXbiOueWBAH
 OGo+3g03x87uKSLru9OiXfyRhbXM1qSk1zBkcZzroc2ygjIfnc68aQiaI9fPiZ8qwSWXOGAk9J
 ViY=
X-SBRS: 5.2
X-MesageID: 34276701
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,455,1599537600"; 
   d="scan'208";a="34276701"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N4Pt3MqwZakn2fl0V6hs4keHk7HfvEd4aDLG3EFC4pePpJ+25zuPa+LVOmb9sVp4q/9+QyYmE7lRcRogPSIsVRhdJJwqTSTFLbhGEQWhjbzjzSrkvT1had4ASikqyuCpIUnUcmVTdlqNkITMucT03O8PqHLcz3Gz+VK7cVpvGPT4PdxMyg3wr2oMYyb0L6lpeFYcgeaxY0VhRXEdCAKSi4sHrl0ixtjTNKQxB4Ex7r49R8wO1SzC81IaGTnxNikClmiu8NvfeWTy6mteeLGJyecfv6qqky65Vfad3XI4/MshKG0fYdROVUWfaFWkFN3brnZRiIeOi+0naspUDLSWYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gHbgmvOIQuMOTRJcNZ+TnyAETGrViUzj+xZZhk4ohds=;
 b=KQMtGaxjI2ZfsiqmZsLClM1G3V8UgvMK+O3I4R9rAm0vInAIuw+tkEKoHRhb0kE6OqtUGuG1M2z2MrcxOgct/kKag5uinpDYYQTE+tbrohGjKPU3gYfCTgbG/qjeKrvisaFS+fFy3LfDrcHbLkJK5VR52Ez2KbbEoCLTs2zfeUSYJlHrmfiZdWKYudAgnGxJQquANQQCyQHFsOsm6jgP/vEuTpQ7GtSnL2/1ol0Q/H8IwLlBQov+GKgWs2DGoTxiDaxctEmWZNNaVznwsZRzGb8Gw9ArOhG/6qur57XqiKW1d9CnxbEbfWy456lN15xCDJbygV2OEqoAsRk04Tp4pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gHbgmvOIQuMOTRJcNZ+TnyAETGrViUzj+xZZhk4ohds=;
 b=jn8DFsbnE96Xe2UE8ZYq5KY3IWrq4u+ixIpDffnEvVdB0cvSIYXKWhiMbCEznPHJDj5KgMn6m4X6d7026rDWX6hGKWEnCBe0kOVtwHc/c236uOF+Cz044TxPOfWqzUz9MbK5V0JZdFNcUEgPVtmSaPkf3Y79FtSxwYxhvdx9LJ4=
Date: Mon, 28 Dec 2020 18:44:39 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 4/5] vPCI/MSI-X: make use of xzalloc_flex_struct()
Message-ID: <20201228174439.nljyqls3m7s7pewd@Air-de-Roger>
References: <f93efb14-f088-ca84-7d0a-f1b53ff6316c@suse.com>
 <062e84e0-0e19-001e-df65-b06318cc5925@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <062e84e0-0e19-001e-df65-b06318cc5925@suse.com>
X-ClientProxiedBy: LO4P123CA0014.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:150::19) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 11522d6e-eafa-4411-064d-08d8ab5842f1
X-MS-TrafficTypeDiagnostic: DM5PR03MB3066:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB30660A7A91150F7D9BEBFC858FD90@DM5PR03MB3066.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1107;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XQTYHPwkQeEj6OLpKDrYC0JUokyXjFOdgoi9+IrmfF5978gfPgx8N8TaaFC1Lxd3TaVdAFaObF8SeCBgJWKOf7oRlh46OQZoWTMYF2l2YD+q0AxTW8uK2DvQf5HwVNLCe60w8pBkkYtUzEUWHY/4CkeKyckkCOtK5FPG60kl6HExS8jekGl3y7fnemkKB8X6irLvWSrxaaOTbhpSFCpkDNP9CcJ62BLeJ/355Y+vX8bXk9tZgn9Oj7HRVEWc5pjDmyv2irWNy5wRVFcFRYTOwxtgtCR0ypW3z5veah+XlO9IHTbtQ7143j6dvXVSGipoitLIHWJTDY8fLKIXMSeUn8yqcoYW23+X3mrZo2Q2tlPoa7XR0KUiUFfcvhB6p3q+E4gQJVEoVc2cBTHq8ZKzag==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(396003)(136003)(366004)(376002)(39860400002)(346002)(86362001)(16526019)(956004)(26005)(6496006)(4326008)(66946007)(85182001)(66476007)(1076003)(6666004)(478600001)(2906002)(6916009)(6486002)(558084003)(66556008)(5660300002)(33716001)(316002)(186003)(9686003)(8936002)(54906003)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?eGZCUXFuYjlCZFMxMnhkelIrV2ZIZzZDZWxiT2pleldqRDc1ZENyU0ZGaHZk?=
 =?utf-8?B?MWN5ZHNGMENXQ2FRZ1o3Z1hWRW1lK0l3NTRWZXpJSG9kbEF5UGFGRnlxdXBR?=
 =?utf-8?B?OEhySDJYL0Z0VHVuK1dEc2FqNm1EZWJaRHd0RkhKZEwyTk55L2FvMzVxUk1l?=
 =?utf-8?B?eGdtVng0S29ST3JUazZ6dDFVQ21aazZhQW16WVR1Y0pobFJJNDhBQ1U5Q0FX?=
 =?utf-8?B?bHczaUNqTGVUZk8rMWR1Z29zVDZqRXBQV3VGc2doOXV2WHkyQWNRajRvcU5v?=
 =?utf-8?B?eERja212Q255YnAzeXU5QWMvWTRxQXk2cGdlREhNQkF3N05xR1VhMjZYTnBi?=
 =?utf-8?B?dFZSalRrY1QvUyt5Ti9oN05LaCs3eTM0eWJSalBIMndnbnM3c2UwRDJlQVhS?=
 =?utf-8?B?c2YxUjVJQ21EQ3N3SVJOaHNiandUWmV3QzZkRnBUMmVLL2JEU0o4alVHUGYx?=
 =?utf-8?B?TjFJNlQvS0ZqVzlxc1lSMjdxWVorR1htWGlFSzhvNzBGaHpqSXpFZmxsT1NK?=
 =?utf-8?B?VHZHWmhuK2k3QTlzMWpQSStsd0RJNWVNUnA1UEIxZE4yOXJZbUNUMlRBeVhp?=
 =?utf-8?B?TjF3MWtkYWx0NUsrUHdyVjIyeFhnemZvVmJsRkY4T2Y1Z01ZY0VIeTd3V1kx?=
 =?utf-8?B?VnR4alRMdkx3azRORytReFRmMFlERUxiNmtzcFZmcm1jN3ljWk5WYkRicDVl?=
 =?utf-8?B?dDBoRiswNlNjNGVvRjFodTh2MGNLdFBsTDFJNGFXMmRjVlprRkJ6NjlvSDF2?=
 =?utf-8?B?MnBlTDlhc1ljc1g1dWZodFdjZXplanFzZWN2eEY0MWZLb0tSUWUyMGNYUFhU?=
 =?utf-8?B?QTdidjlHOVBJMzdIbHlvVHhUaFJrZWY0M2JvR1Z2b3FxVS8xTGM3V1h5aGhV?=
 =?utf-8?B?bXJRaEhwZ0xDTVUvMW4vNDRtNjJUYkxPK0VYc3d4a25zZnEvYXB3aGhGNzZu?=
 =?utf-8?B?Z0hlTHhJd0V3Ri9TUnhiYlErbVRZa2xuOXpsWkRDekdmVTdqSElIWllrOG5K?=
 =?utf-8?B?aVByQWNuaXEzMUVGQTlzWFlVNzRCMHc0czF5Z1BTUHkrYlJHQ1RNeE1lOWhs?=
 =?utf-8?B?a2p5YXlGQXk3bTI4OGZGQ0hiVlh2TStPVmJPWjR0SHVvMmE5aWdDRDhKcnBT?=
 =?utf-8?B?Z2c4dngvaHE2SVNPS2NDVXZheHdraFpxdXVvc3gvci9YbTRlM2QvWkc4Ukkr?=
 =?utf-8?B?TUNjYlEvSERjNDVLRkVyc0hPdk5hUFlUNzJPa29UR2FDY2dzZ0JaaXJlMjBB?=
 =?utf-8?B?MHFNK0tvNWtGZ2NaYWhhd2FocE0rbzVXeW5sZU53cW9oZFcyeng2Q0F0OHZs?=
 =?utf-8?Q?9QQJnOT969KoTwgGrklXjHMV1jljBp80Di?=
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Dec 2020 17:44:44.0403
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-Network-Message-Id: 11522d6e-eafa-4411-064d-08d8ab5842f1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v9fljspzlJi0ihLezudw7JxVJaXHwIdAcG0NA7jMPSrY4sQKP/jeVUIonOuc+UiAbFi5NcExPuCpYVMc+oXr0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB3066
X-OriginatorOrg: citrix.com

On Mon, Dec 07, 2020 at 11:38:21AM +0100, Jan Beulich wrote:
> ... instead of effectively open-coding it in a type-unsafe way.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

