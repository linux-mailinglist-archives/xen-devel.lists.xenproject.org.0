Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F17654BB8CC
	for <lists+xen-devel@lfdr.de>; Fri, 18 Feb 2022 13:01:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.275312.471135 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nL1wf-00062Y-3M; Fri, 18 Feb 2022 12:01:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 275312.471135; Fri, 18 Feb 2022 12:01:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nL1we-00060d-VT; Fri, 18 Feb 2022 12:01:04 +0000
Received: by outflank-mailman (input) for mailman id 275312;
 Fri, 18 Feb 2022 12:01:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YtLv=TB=citrix.com=prvs=0411da6ea=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nL1wd-0005gu-AW
 for xen-devel@lists.xenproject.org; Fri, 18 Feb 2022 12:01:03 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7043625a-90b2-11ec-8723-dd0c611c5f35;
 Fri, 18 Feb 2022 13:01:02 +0100 (CET)
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
X-Inumbo-ID: 7043625a-90b2-11ec-8723-dd0c611c5f35
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1645185662;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=3Ag96AKa6ckCXDTMAqCXlDOih2VxTNmBDm/9Ym2Fx4s=;
  b=TEYcBq7LQ/5WB5/0zDGIXZWaVLlLWX2344Q4vSdfzXVNgmzwtbMEJ0B6
   lAaOAxr56ZuNby7BCB0tZAEK5+Xr7iXnVm7/z0AYO3O4Udnt6UO24b6cM
   OWFnTgpmZUq5n8YXu+w+IWIr+Dr2xrWzHok2iyekA4PupcSa14zhtIdWW
   Y=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 64916530
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:enEo1q/aY5rDMJmZ62EyDrUDv36TJUtcMsCJ2f8bNWPcYEJGY0x3y
 DFMW2/UOPaPYWajfN0lOd7k9k0P7cOAydVqSQs9/iw8E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si+Fa+Sn9T8mvU2xbuKU5NTsY0idfic5Dndx4f5fs7Rh2NQw24HpW1rlV
 e7a+KUzBnf0g1aYDUpMg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZdhMUdrJ8DO+iL
 9sv+Znilo/vE7XBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XnRfTAKtao2zhojx/9
 DlCnY2KcggYJonIosQUCykGDQh1DKFp0bCSdBBTseTLp6HHW37lwvEoB0AqJ4wIvO1wBAmi9
 9RBdmpLNErawbvrnvTrEYGAhex6RCXvFJkYtXx6iynQEN4tQIzZQrWM7thdtNs1rp4STK+AO
 pFBAdZpRCTjZh0XanImMr0Fs6CB2GjyYgxckV3A8MLb5ECMlVcsgdABKuH9YceWTM9YmkKZo
 GPu/GnjBBwectuFxlKt7XaEluLJ2yThV+o6FqC89/NsqE2ewCoUEhJ+fUu2p7y1h1CzX/pbK
 lcI4Ww+oK4q7kupQ9LhGRqirxasvBQRRt5RGO0S8xyWx+zf5APxO4QfZmcfMpp87pZwHGF0k
 A/S9z/0OdBxmKyvcn2s7pOQlxO7YRhLM0YJVCMrZARQtrEPv7oPph7IS99iFou8gdv0BSz8z
 li2kcQuu1kApZVVjvvmpDgrlxrp/8GUFVBtum07S0r4tlsRWWKzW2C/BbE3B95kJZ3RcFSOt
 WNsdyO2vLFXVsHleMBgrYww8FCVCxStbGy0bb1HRcBJG9GRF5iLJNE4DNZWfhoBDyr8UWW1C
 HI/QCsIjHOpAFOkbLVsf6W6ANkwwK7rGLzND66IM4MUPsAgKFHepkmCgHJ8OUi0wSDAdollZ
 P+mnTuEVy5GWcyLMhLtLwvi7VPb7n9nnj6CLXwK5x+mzaCfdBaopUQtazOzghQCxPrc+m39q
 o8HX+PTkkk3eLCuM0H/rN9IRXhXfCdTOHwDg5EOHgJ1ClE9Qz9J5j646e5JRrGJaIwPyL+Tp
 ynlAhUwJZiWrSSvFDhmo0tLMdvHdZ1+sWg6LWorO1Op0GIkeoGh8OEUcJ5fQFXt3LYLISJcJ
 xXdR/i9Pw==
IronPort-HdrOrdr: A9a23:YagHa66OGe94NEmmvwPXwBfXdLJyesId70hD6qkXc20wTiX4rb
 HKoB1/73XJYVkqN03I9ervBEDiewK/yXcW2+ks1N6ZNWGM1QeVxepZnOjfKlPbehHWx6plzq
 FnfLF5CNrsSXZHreuS2njfL/8QhOCd9qamnOHfyGooazpLReVP0ydVYzzrdXGfYmF9dOIE/V
 6nl7N6mwY=
X-IronPort-AV: E=Sophos;i="5.88,378,1635220800"; 
   d="scan'208";a="64916530"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kSjEZo0CG061CYMyUv000bNswHK41SbUbsu04GJWKEtRqKwV4KKXHweuFBTY+EVg/nvzU7sUT0aKo2GaNVrcupd0mMTyDdMfvsszVWN9hliBCuq68eLGvMgUxQ3YHTjTcWKbLabeYzmumEJHMFtVczsP2ovRzdgjozZcu6PQCDcjsJxgk6EPuMzbA2OMpX/yafbzJM6iK/ozlMNVqiKBqaFcqDxdicPKQ7PiD04hk+qc+fPUU3CMLNBJ5PMI7niqZDM8jVpWfcJkkKfsnB5bWljjUoYQj2Rkd+Ais3BzaD1Hxj4YUhH9WnMItxT6mEGKgz6rLwkhLH7M8r5wuziRFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JVEEC7hGK2V16CSDkdSlQ4L0CqRHMYhugTfKIlrqonY=;
 b=XhlEE1EdYhvUtOknVQIWYYC80MF5zBYxBYNGYEyvYvQzhHWiUlBuJ3IhOsCAXVpsSws7e7xp/aB/dLXT9mrdfsDETlyat+PVxczqBTXNiZKx21v+YsWOqV5SygY+8/KVF12t85PTFJMKnTMYE0EXUm0MFK+dv7sbtiK95h2Q9SkyTEm6w/8cCTDLT9xrN44ULxVErKnW3RDUJqyPWox8Y2lt3GxrAiDunRHu4Hfx94TTCjhUA8jv/TPHCW6iDFONK+EBDir3nXADkO3MY9WWY7VQ8cqo1hF0ZinYgeHJOyEsVeWrN0fqWmVKExou0QmD7da0w4cGkEM3XbqIP2H4iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JVEEC7hGK2V16CSDkdSlQ4L0CqRHMYhugTfKIlrqonY=;
 b=p1I5HxPv7tn71SJ+hJ6/ioQl/KyN8W30dH5RDaDfyqiqQ8yN1dssaLxBFB2HjfjMvSqVQevAQDjxjXVCcs1cthKZNWVKO4FTwzbKsB8TseiJeO+HWGmotfunLelmB/BU5p48TPp3ZLr4BU8LlVbrDc670IkYaGai6YXI81hdZMA=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: [PATCH 1/2] github: add workflow to run Coverity scans
Date: Fri, 18 Feb 2022 13:00:41 +0100
Message-ID: <20220218120042.32102-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220218120042.32102-1-roger.pau@citrix.com>
References: <20220218120042.32102-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0185.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501::24)
 To DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fb09affa-e51e-4329-eb9a-08d9f2d6519f
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5406:EE_
X-Microsoft-Antispam-PRVS: <SJ0PR03MB5406D81619BCB8A90DBFCE1C8F379@SJ0PR03MB5406.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kdCpd2k5MLryhXGAty8WAnj1SomgnEWGl3dB2ctn+JP0GyqNI65htEunAVoTe/608v1oKd2CHLIOdZK0tyWu0CxJs2D3ZauHySfAbv1OpUNhqz1lx1hzr7V/yyaWeWLvB3hvwOErwZ6SokADi2Wmq+pfYMCeBiSvMS3a+QYRSpvru9ag5LjeRgrXB26FqxAOpSMwp/LKsBR2iBfJCqUQzIltV1UtYr9fbDzMUbCBWEhdGpVjmBhy/YfWuP+9O45QFVDvIjXkVPp6N3KYyzgYoCztHKyO+CVlGfoXyuo09VxUEeFreKafc6SZrjHGNRUCz0/AB6etBguU7q8ewoF4BS6uCDdzH5LR6Q9Nwi5bG2dtmW3NuTwKG2K1SkXZdbK7nhKGbvwpzKdTYWO0bWny1FDopXtJgXwZzVol3kTSvwfraRrjPTt5fMsUXJNVBn05TcmlTpafWTs8kkP+6WTwdzOtPTXBmTMSL2BAYtDGav7YcfEaLGi1/DUBR5O43nq83KZpuzNEQQ4uBDEmYSFjekff7eA1rvEbEfky8/Khr46EpHbMFvk/5aZE7Z4ZC9QOHxWgBhqfaiWeTxBuUTWx826wEZRAD6fJOXBd/mJf6OD8RlyWvZskzY0qRjDSKROHP1839gFExr28uBBuMgiIfA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(5660300002)(1076003)(2616005)(38100700002)(8936002)(66946007)(4326008)(83380400001)(8676002)(2906002)(66556008)(26005)(186003)(82960400001)(6666004)(86362001)(66476007)(6506007)(316002)(508600001)(6916009)(36756003)(54906003)(6486002)(6512007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?clIvVzB0M3l2elN2TVZPajlVT0Rpc00rR1NFYTFCT3d0d3ZhVkRkTDhqcUxV?=
 =?utf-8?B?S3ROVWhQTjN3Z2VvWjFKWlZpSWE0Tm1MRDFmZjZ0bzVFODFSWWE2YmRyeFBu?=
 =?utf-8?B?UWdqWUVrTEh6MEhHMjBTS1NvRHVjRGtSeGZtM2M4QURoWUtKTmJnWGpYRjlB?=
 =?utf-8?B?SnJOZTdVZ09xRmpYMmZUeE1pbjBLak44Z21MbUhncnNpN29xRDg5L0U4LzFt?=
 =?utf-8?B?UW5TN0R5Znl1WDRGWExmSDJlbWlER09JZ2F6R3NzeHdMenVwL0NTV0I1WEwv?=
 =?utf-8?B?Smd2clNhMWozS0hhTTdwTU1USjJHN3B5ak5yZFZEKzNWWUViV1lXeXlnNktM?=
 =?utf-8?B?RW5GdHFKN3RhRjNWbmVFWjAyeEdxcEtYMy9icGNNNEU5N0xOWDFkUFU0RlUr?=
 =?utf-8?B?TWF6VGhaZFVoM2cvNlAwL0FCemJQSGhjNjlNalBiV3JsY0hwbytIaVdqS3pt?=
 =?utf-8?B?dy9RNm05WWNlVUhSb2RGZDZXYW5KZW1rVlVRWlJnMmR5akd5ODRlK1U5NS9w?=
 =?utf-8?B?YWtENmF6K3ZPNkVNTFFpcGJXLzB0N3cwdEZSYXRYS0FTcnNROHFMSDIxb1ly?=
 =?utf-8?B?Q3lpYW1TangxRkRsM052bWJLYlI2V1JZRFBQRGJXb3BLcCtzVDFReVYvWnM3?=
 =?utf-8?B?aWpEL0xmYVVSSmZkdnRsMXd4aFJDQ3lCY1FjT2dVU29jMUZGRkFxLzQxZXhH?=
 =?utf-8?B?emplTThJQkpwOTRQL29pRDN5REVPWkVSdFRCV3BIbVBTMWs3cWJ3cWZZbC91?=
 =?utf-8?B?YUZIaVpJcUdGdDl4SkY0RllLbUt3K1BGUWNTNDBOdTQxd1U0RUk5eGp4VmJx?=
 =?utf-8?B?MHM0QlBsalJObHYvcjBrUnpFbVlDazNpbzFtR1Q5SW5sb1plcG9raWEwUlUr?=
 =?utf-8?B?Y092a3FLQ3crbngrbGdkZHZGVklrdXNWYWxOdFF2Y1M4VnJaejY5SWlJS0ZF?=
 =?utf-8?B?cFVrdS8zMkZiemdnWmk0Wkp3c3V6QWN2NXlaNC8yUDVIL3grOERqN1c5aWU1?=
 =?utf-8?B?MzVtNjZGNDM4blBZd3IzT1ZHY2kwbnc2SXFQVHhWV2JFazdoQVdpaC81amth?=
 =?utf-8?B?a3JxMjl6MkwvczFHSzF2Qm1oOWk5ZG1LTVVwUlpXUG9BMEVHT1UwNERwdkF5?=
 =?utf-8?B?WTA0V2ZwandtNUNEckl4ODF6YzhrV3o1ZmdIc3I0a0VTZ096MUNydlczeGkz?=
 =?utf-8?B?MVI0VG5EaUlXdHJvYVEzeTBidjlsbXRSbytkUXpFZnlFSlJ6b01vQ0RMQWdE?=
 =?utf-8?B?YUczNThtbHhCNjFCS2diSDRGQnpSL2dhZFBXOGtaMHY3Ri85bHF3cmdhRW1Z?=
 =?utf-8?B?NEtiMWpGRDhKZzdFN3ZIWENyOEZFL1NiUkdSMW1qRThEUnVXaC9XUGVER1Vr?=
 =?utf-8?B?UmZxMlNOOTNpeFZtWGZsUHZzU0UwZ1puSktpcGdsTytaOVlyQ2J0TlpvejlY?=
 =?utf-8?B?d2NZcWcxL1Q1dFVDUWNMaVd0YkNqdU1NNDBNbUdiN1BoZEx1SDgwVzgzeGQ5?=
 =?utf-8?B?QitCSmp5WWVPc0FZR0d5akJpdnpXTGc3MDRTRnBDSWxBc0I4ZERnTDhsUFVt?=
 =?utf-8?B?Z3JNRzQycDdoUmpXNHVtMUc5a09ja1EzZkpaM0FWQWoyWXlFeHJDK3Fmd0NG?=
 =?utf-8?B?dXIwQ0xScUxhM3lka0I4RGUzMkVNUnF1cWhBMG05aUxMcFV5SlJiR1NZN0xL?=
 =?utf-8?B?Zjl3TTdpSFE4QkEzVHd6dGM1Q0FmMk95NEp4dW9hTk1XSGw1RjcxMlBOQlEx?=
 =?utf-8?B?Q04zclp0TW51bTFWbUt5R0dZQk43aVZ5UXVNVEJsRlM3VXExeWZKcncxcHRz?=
 =?utf-8?B?ZlJkQXpUeHZnSyt3bkI3OUk5SEdHU1k0dG5JS3ZOTmZodHdQSi9UeklhQllw?=
 =?utf-8?B?dHJmRkYyMTIxb0M4WmJoK0NCY01XakhxN2UwdFZHSWVPR3hkSzVHSExjVUFD?=
 =?utf-8?B?VEVuSVB0M1cwczRTQW9kQy94WGlFU05raEppUTJnUUtyaytXa0VOamZocEVm?=
 =?utf-8?B?UDZYbDQxZlM0NThZODVsdk5XTW1LOVRqQ0ZhNGgvT051ZmF4TVBLM24zc2dH?=
 =?utf-8?B?MmRUa1ZRblNtVzdsYm5VU0xWZUVtZExOTml2SW5KSHlkRGoyditERGZqcThy?=
 =?utf-8?B?MnFxa3BVTXpKMGNpZVpLSzIrMU1FbEV3Y20wUDYyWm13VmJ6bzNiTFVyRWNO?=
 =?utf-8?Q?1/yv8XqQW+cgb+3bHilvXAM=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fb09affa-e51e-4329-eb9a-08d9f2d6519f
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2022 12:00:55.7868
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o1DfpJcYBrJ2k+uYnKmqDt7BvhNBB/W2ADqmRauCGCe5w7IGuNOyOp9xhPz5eT0enq5R+2MpgyY9OLZ1H3Hsxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5406
X-OriginatorOrg: citrix.com

Add a workflow that performs a build like it's done by osstest
Coverity flight and uploads the result to Coverity for analysis. The
build process is exactly the same as the one currently used in
osstest, and it's also run at the same time (bi-weekly).

This has one big benefit over using osstest: we no longer have to care
about keeping the Coverity tools up to date in osstest.

Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 .github/workflows/coverity.yml | 35 ++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 .github/workflows/coverity.yml

diff --git a/.github/workflows/coverity.yml b/.github/workflows/coverity.yml
new file mode 100644
index 0000000000..12fc9c782b
--- /dev/null
+++ b/.github/workflows/coverity.yml
@@ -0,0 +1,35 @@
+name: Coverity Scan
+
+# We only want to test official release code, not every pull request.
+on:
+  schedule:
+    - cron: '18 9 * * WED,SUN' # Bi-weekly at 9:18 UTC
+
+jobs:
+  coverity:
+    runs-on: ubuntu-latest
+    steps:
+    - name: Install build dependencies
+      run: |
+        sudo apt-get install -y wget git bcc bin86 gawk bridge-utils \
+          iproute2 libcurl4-openssl-dev bzip2 libpci-dev build-essential \
+          make gcc libc6-dev libc6-dev-i386 linux-libc-dev zlib1g-dev \
+          libncurses5-dev patch libvncserver-dev libssl-dev libsdl-dev iasl \
+          libbz2-dev e2fslibs-dev git-core uuid-dev ocaml libx11-dev \
+          ocaml-findlib xz-utils gettext libyajl-dev libpixman-1-dev \
+          libaio-dev libfdt-dev cabextract libglib2.0-dev autoconf automake \
+          libtool libfuse-dev liblzma-dev ninja-build \
+          kpartx python3-dev python3-pip golang python-dev libsystemd-dev
+    - uses: actions/checkout@v2
+    - name: Configure Xen
+      run: |
+        ./configure
+    - name: Pre build stuff
+      run: |
+        make -C tools/firmware/etherboot all && make mini-os-dir
+    - uses: vapier/coverity-scan-action@v1
+      with:
+        command: make xen tools && make -C extras/mini-os/
+        project: XenProject
+        email: ${{ secrets.COVERITY_SCAN_EMAIL }}
+        token: ${{ secrets.COVERITY_SCAN_TOKEN }}
-- 
2.34.1


