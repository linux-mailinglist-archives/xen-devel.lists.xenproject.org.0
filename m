Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2564E4F826F
	for <lists+xen-devel@lfdr.de>; Thu,  7 Apr 2022 17:06:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.300870.513327 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncThl-0001om-Ip; Thu, 07 Apr 2022 15:05:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 300870.513327; Thu, 07 Apr 2022 15:05:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncThl-0001lW-Fm; Thu, 07 Apr 2022 15:05:49 +0000
Received: by outflank-mailman (input) for mailman id 300870;
 Thu, 07 Apr 2022 15:05:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qv4n=UR=citrix.com=prvs=089d11f18=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ncThj-0001lQ-Tn
 for xen-devel@lists.xenproject.org; Thu, 07 Apr 2022 15:05:47 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 32f25b56-b684-11ec-8fbc-03012f2f19d4;
 Thu, 07 Apr 2022 17:05:46 +0200 (CEST)
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
X-Inumbo-ID: 32f25b56-b684-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1649343946;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=BbKwJGnBg+WpuvFH+VXc8Z4GjsbFiG1ceXXGEuddvKE=;
  b=hmRsZdJXc+V2XQ+xnwWb/vzw4c4gaRA3h/z7i30rVwZftB0cn1ARK9YO
   5yFI4o1/r1kyZ80tcYI0TWPJY0sc0EJ/122QLnLiz6zf4oAuVVgFvv3Nk
   FqAKpjEaqNRgebeMoG47L2oIBDwYtsl1FNmdwIpv64dzu//PczgH9WiSW
   Q=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 68682003
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:hoTboaMoBUkZUMrvrR2ll8FynXyQoLVcMsEvi/4bfWQNrUoigmYPx
 mMbWm3Taa3fY2qhKY13OoSy8xtVvsCGnNFmSwto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdleF+lH1dOKJQUBUjclkfJKlYAL/En03FFcMpBsJ00o5wbZl2tEw27BVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Zz
 exxp5y1TzwSEpaQqdstUCtRKhpnMvgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALNs7kMZlZonh95TrYEewnUdbIRKCiCdpwgmdu1poWRa22i
 8wxNQVtchfRYyJ1AGwbGZgwpsWR3VLQSmgNwL6SjfVuuDWCpOBr65D9PdyQdtGUSMF9mkeDu
 nmA72n/GgsdNtGU1XyC6H3Eru3FkD7/WYkSPKal7fMsi1qWrlH/EzVPCwH9+6PgzBfjBZQPc
 CT45xbCs4A3zXC5Ttz7ZCaUmyK1gS4fadNpKPQ1vVTlJrXv3y6VAW0NTzhkYdMgtdMrSTFC6
 mJlj+8FFhQ07uTLFCv1GqO86GrrZHNLdTNqiTosF1Nt3jX1nG0kYvsjpP5HGbX9sND6ECqYL
 9ui/Hln3OV7YSLmOsyGEbH7b9CE+8Chou0dvFy/soeZAuVRPtPNi2uAswWz0Bq4BNzFJmRtR
 VBd8yRk0MgADIuWiAuGS/gXEbei6p6taWOA0AQ/QsRxqGv0ohZPmLy8BhkkeS+F1e5eJ1fUj
 LL741sNtPe/wlP0BUOIX25BI5tzlvWxfTgUfvvVcsBPcvBMmPyvp0lTibqr9zm1yiAEyPhnU
 b/CKJrEJStKWMxPkWvtL89AgOBD+8zL7T6KLXwN50/8iuT2ib/8YeptDWZimchltPjU/1iPq
 4832gnj40w3bdASqxL/qOY7BVsLMWI6FdbxrclWffSEOQ1oBCcqDPq5/F/rU9ANc3h9/gsQw
 kyAZw==
IronPort-HdrOrdr: A9a23:Qw7L8an1abWS6ONfVtyCNXqsO0bpDfLW3DAbv31ZSRFFG/Fw9/
 rCoB3U73/JYVcqKRUdcLW7UpVoLkmyyXcY2+cs1NSZLWzbUQmTXeJfBOLZqlWNJ8SXzIVgPM
 xbAspD4bPLbGSTjazBkXSF+9RL+qj6zEh/792usEuETmtRGt9dBx8SMHf9LqXvLjM2fqbQEv
 Cnl6x6jgvlQ1s7ROKhCEIIWuDSzue77q4PMXY9dmcaABDlt0LR1ILH
X-IronPort-AV: E=Sophos;i="5.90,242,1643691600"; 
   d="scan'208";a="68682003"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fOtyfMMOlAj53CIzjzRDwsKi8XVgZrhVnpoA0Pf7Fvm5VjCFhKUVbCOwjwjEuh89YDP34cGWO+S6Np/VXKiaAfOeEDAH55W1himiKfteREBjCJSriua1lC8AFcKA+VifzPhZoYC9bqpzvsfKv0H8n0KS5K45ipKs0xwAEz7qu2C2XMYS0vBhwJlr8DRrBvz/QgHjvmlfa5Iw8YiPcYKtcOHpdMgag5qc+6cbQI2Bxh8grP0QjwJwoG0NrjFmn2WR8Oq5kz0RkY5dtmVFCCxKM706VDkF7qBz3pDX2kr0DR+6SOVRRpOJW9S6zrLRYKFp6xsad4lV5iE6rLL6CNZZ4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lGd6cA+Yy1VyE3vwwOd4GCBdYtHFIvXCXHzoelx6Hrw=;
 b=QW+yIa/l/Fofa0T8FC5wC0hkemPC6LjUTxzJqJfzQDvcgJFAWberHviaiTXSuVnlKtlHz14/VOWLlHhsSaTx76ee0IQnSggctc2VGcC64z/pKVePMR7zvWkxLKVMkhhZI7WWS/WiTTQfWYP7sc7zbho/XzJYnaXiGkVPObg4x69+KB+m1HgZQDfkMYWvq5YvWP9Iklr3re0SSQ46DLI23mr7GqXw2xhuAMV3zMQclNBHSiUWnWwSTIByTnCYeUsZM7a6m34uV780RuwzMQeXg/SOFYr9ZL4F/WTGN0ov3PhouLXwNV+N90z5qKsIG/jazXLIJmbtTsmnWbZGxy6AYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lGd6cA+Yy1VyE3vwwOd4GCBdYtHFIvXCXHzoelx6Hrw=;
 b=TuGgNDVjZOYKnUdToJ51+qoaaIvs5qZ1sK7qBTr7kmeNum9rkKP6qjaZmSCZQZEfULq8szLdGUzyuApaaZAzVYl/o8tHtxpnBJ2SeUuftUn2w4MBv5O8fdGbyt6Ykl2Szb+GMu67bRDeTSgBRWtfYs+BrEPE0YDhl2+0xCinoQs=
Date: Thu, 7 Apr 2022 17:05:36 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] vPCI: fix MSI-X PBA read/write gprintk()s
Message-ID: <Yk79wNy1H6PDSVVS@Air-de-Roger>
References: <56a57946-04f9-90a0-ac4c-17773347dcea@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <56a57946-04f9-90a0-ac4c-17773347dcea@suse.com>
X-ClientProxiedBy: LO2P265CA0239.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:b::35) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a0b6f546-a149-4d00-5366-08da18a815da
X-MS-TrafficTypeDiagnostic: SN6PR03MB4095:EE_
X-Microsoft-Antispam-PRVS: <SN6PR03MB4095A8B6C877EF8F1CD1EF5B8FE69@SN6PR03MB4095.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9wEKnYaoz34xp5V9Q2f3tRIdQN4Uzaw1I96Nuqez0KCjAVANTA4yggQOT9Ej5KtO+i3iPpzYSnB+EldxaCt2jLhuf9W7MavqfGXios4GAwjE+BOGIwaknyJuA0s8lCaNJTWcVz8X9nQ5mf9bJbNK+tmvDXx7RIiQXQwQ+rEf3grR94WMizhQx1djAIdUGgim/j6WXXip02D8jrwFs51yA7a0GBQpfQLWSsObXCpQpjQ9pFxNIyZFABwUPhUq7ZrxoHTrYwQZEM6SU+APkwg3MYJcW1WRqg+eqEB5NZafGzXI3qd19pO2+jeZzlZFyHK+V24oZbTPk67yhOyX4S4KhqeKetzp8eAVjD/w/ZhRGaKaz/goqjW9zuPGuew2wzjn6AxhqbfSpIg0E0jGctK2A5TRUlitHBD8lPomY/NAoVGjBO/LLolTdt+csF3s/BPy3eLBU3ifBZl7q0mFKM7KogrOVPp91vkvWTEDqsFrYyA3Ma47iAI5ALxuwH4UgJkmd8A+fHX1PAKM2VvxmBJ6Gpb6uBp3RneRS4hHawmY4SHj/kskwm1YIUZGQ1dL9QMTD7Ag+8y3Qgl3f/1CSnm2GZ7pLaGajJVUcOiUnnUnxbm6Tzq0kjgWpOiXT5TuFsAi5lKYiWgcVW4JZCMYm8W8dA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(82960400001)(83380400001)(26005)(186003)(38100700002)(5660300002)(8936002)(4326008)(316002)(66476007)(558084003)(33716001)(6666004)(2906002)(9686003)(6512007)(6506007)(66556008)(6916009)(508600001)(8676002)(6486002)(66946007)(86362001)(85182001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aHpCQjhoeDI4NmRqTCtPZjBwZ1ZqS3lSZDcyV2RkZHdidnVxWWpTcE1BcEhH?=
 =?utf-8?B?Umhnc0NDNWIzcDd4SVNwZlRIVmRZMVp6R1hrK1BjcmMyMjc2TW9JU29UeXFx?=
 =?utf-8?B?bk1TaHIzQnhicmlRWUZZT1p5USt2RklhYmp1WEVnb0owZkFhaGxHRC9haklR?=
 =?utf-8?B?cUgwWVNLTFVzdVVZSTMzUVFIL29rbnlnaHp1bnpqa05TTUE0YWpxaS9sR0VD?=
 =?utf-8?B?Y0hwWWg4eVFuaG8wQXFQeTM3QUsreG1VZWxlWUZTTnVJakhLWWM0T0pCak1y?=
 =?utf-8?B?YVQ5ZFo1dHJpOVFUOVVNZjNzT09meGRDK2NWeGxlQmtVdS9KNCtyWERmUHJY?=
 =?utf-8?B?RXBjeWRKQWtoNGgwQnoyc091RFRxdm9iM2FFVmJKb25FTXZpbXBBZ3RBcGJo?=
 =?utf-8?B?OVlpSldyMk1PK25zeWVBUnVkWFBqejQyTDRlbU9tVmFjSGY3WnMrYnBEVWF1?=
 =?utf-8?B?MU5LUjlKR2ttY3h3elpKcVc3WDVGa0FCL2cyUHJhelFhU0dNOUkwVjJ5RUpw?=
 =?utf-8?B?enlqay9VQzl3dThETTJoZUplV0VvM1oyaWI0TUJ4cnR6d3RoSlNuTjNkZ0J2?=
 =?utf-8?B?YzlmNFBYOGIyeUtRTUVCQWQ4bEE3ZUJsY1FBTGdwS3dBUWtQSXoyaGczT3Q0?=
 =?utf-8?B?cjQ0NVQrYXV5VC9abHo0Ym92NjgvVk1aUHNwZkRmdms1MGhkbmVpR0Z0MGQ1?=
 =?utf-8?B?eE1SczlQMW4xQnlMTlorQ24yajd1bnlweXdjMlFUd0VKenQyRHpoNHFlMkNB?=
 =?utf-8?B?ZHVQU3J1YnkwVWR0b0w4Mkgvb2RXdk1DWDkrUjAzWnJ4UHdRT2I0bE5lNklv?=
 =?utf-8?B?S1VvNE1vYUc1cDVrVUtRK01mOS9XVFVlR2RKeDY3TFdPMXNacmNreFZEUU53?=
 =?utf-8?B?ek1DMVpTT05JSzJLUGR4ZEVXU0oxeHNvM2RCQ3l6Wnk3ZWhHN1gwVGk1Z0tS?=
 =?utf-8?B?MTRCZEhBbFg5MHp3b2FLemQ3N3NDZlpxMmhzckllOEtpZVdKZEFwQ3lEa0VW?=
 =?utf-8?B?eGJ2MFdYdWVQNHova1ZRM1NLbDdpOGZYNWk4L094Y0hJcWhZVzFzQmVLbVY4?=
 =?utf-8?B?RmJCNkRzVkl2bER3N1lMeXRsOUJkbEltZVVuWGl5N3R2T0JoTFc1WjhES1Ar?=
 =?utf-8?B?TzlWYXl2MVkwS3BXcGI4Rmg1bWhCWHc1ZmJqNlMvcWhGeFhnbTg4dUgzRW9S?=
 =?utf-8?B?WjVGdjREZ3p6SEtQRlVSY2hOWFp6YUR6ZHFad2NXQWtNMUh3UTdWN0hCaDRu?=
 =?utf-8?B?NjBqNHd0eTZhQU4zQytlNUJ4RXdiV0RYbHhMVVZ5WkZ4RENmQldRWWpmNXFa?=
 =?utf-8?B?YzV6TEorNU5pM1FJNEllaE5HTDdlT2pZODgwOVk2QS9nWFIxUU1WUzgrK2Jw?=
 =?utf-8?B?OUI5T3VVbVJDZTByK2lBd2lGUGkzTGM1K2RBcytHMFVUR0tLb2VUdG94ZzY3?=
 =?utf-8?B?TEl4Uk9wMWFZNFl6TkxLU2ExRXZLYUZzZ1dhMWY4dVgyMmU3T2tKekVDK3Zj?=
 =?utf-8?B?YWxyT044MnJWNlpDYk4reW5zUVEvbW5ZQlJYdEROWDEyYUxiT2pReWNIbVhz?=
 =?utf-8?B?dVFhU1VVUG1ha1cvTUIzR1pEUmpOeHBVR0N5aXZVcnl1ZmpWZE1yOXJxcVNv?=
 =?utf-8?B?dTdpampXNDI4a1NpN3JJb282Nm5EVEZwNHZsMnFraTZpbGJGcGtBZVFtMmx2?=
 =?utf-8?B?L3RIV1NXZ29Sd3RnQm9wM29NMU14ZmMxZy8wUElIV1hPUXJRblVuZnVrNlJy?=
 =?utf-8?B?S2tKMFdNeFo4a1p6VUROYzNjMG5pbGNQZmtmTS83U05VdjY0dkpSaUZ5TzJI?=
 =?utf-8?B?WVBJV1dsZmlCTEd3Vi9tTCtoZFVSKzMrQzU3aytGa0NIODI1RUdrdGNWbUho?=
 =?utf-8?B?Y0dreExpQjhhek03dGprNlhlQk41MmpRak9yWUZrcE1USHdUV1NYUll6Qzl5?=
 =?utf-8?B?bHZRZWNWNnlhdWZadENqYWVxMkJuOEdWanlUeXBwOVg3eDJCK1Fxc0tLMFdE?=
 =?utf-8?B?aVpHQkQ1WUdqOEVsWHZHZ2hlOEkvc1F1NHkrdy8wRjFycE5CaVppZFpkdG54?=
 =?utf-8?B?U2w2MnVUSGVKMjJhYmgrS3owbjkzc0dRQWJTS3pPTzhpa3VzZUwwUXM3QlF4?=
 =?utf-8?B?YXR2L3BuUWRDUklDWVdDU2p6b0R3d2hqQll3TUNJemVZaitoK0FKOFFXMHFY?=
 =?utf-8?B?OEpKUjZJbHR5U0t4VWNVaXVBeEJ4UkQ5MjMzNVFQV0l6dkJVY2RqNzFQd1Bm?=
 =?utf-8?B?Tmt6QndsVmhkcmxsZ0ZsWGhEeFlJV3FwcDZIYnBkOGJySmFKSVl6WmF4aUsz?=
 =?utf-8?B?M0svY1Ywb0ZJVFN3SnNrUW1TWXR1ZTBYNUVBYTZoaXV1LzFueGhhWnE1MUoz?=
 =?utf-8?Q?6Ov1j6UFjO+AzFcI=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a0b6f546-a149-4d00-5366-08da18a815da
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2022 15:05:42.7798
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RHqEXpiJQGiArv6EfLZHJPS16JTZg5yU+Z+YPUPRsKBiS642YWlopid2SjmG8jEFgaeTiuXTjctEqglOy9135g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR03MB4095
X-OriginatorOrg: citrix.com

On Thu, Apr 07, 2022 at 05:01:11PM +0200, Jan Beulich wrote:
> %pp wants the address of an SBDF, not that of a PCI device.
> 
> Fixes: b4f211606011 ("vpci/msix: fix PBA accesses")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks!

