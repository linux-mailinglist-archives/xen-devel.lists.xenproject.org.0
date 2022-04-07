Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B36C4F8288
	for <lists+xen-devel@lfdr.de>; Thu,  7 Apr 2022 17:09:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.300877.513340 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncTl7-0002oy-7D; Thu, 07 Apr 2022 15:09:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 300877.513340; Thu, 07 Apr 2022 15:09:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncTl7-0002lS-3w; Thu, 07 Apr 2022 15:09:17 +0000
Received: by outflank-mailman (input) for mailman id 300877;
 Thu, 07 Apr 2022 15:09:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qv4n=UR=citrix.com=prvs=089d11f18=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ncTl5-0002lM-Iz
 for xen-devel@lists.xenproject.org; Thu, 07 Apr 2022 15:09:15 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ae6fbce6-b684-11ec-a405-831a346695d4;
 Thu, 07 Apr 2022 17:09:14 +0200 (CEST)
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
X-Inumbo-ID: ae6fbce6-b684-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1649344154;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=qyZG7BZzXEXMaZb0MTf1MEolA2NinnKxmmFqBBOBsuc=;
  b=fDCyJ/6ZYUChTQS/LCsg58x84DehL+/sbEDwLUMIYgOJM4PCpupnBuYh
   aqqQ4ra77LHr1GpSyUvrlg+Mx1cWN/VpwsgpxatvRMszIotDV/wlvJCR2
   cDjVoMBwgJTyzbs6Bz6XJUiyXiN2g+enKpKRNbTl6Vr2FIgpLWiLj4lay
   M=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 67696212
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:2Bber6wVuTy469pUejh6t+c3xirEfRIJ4+MujC+fZmUNrF6WrkUOm
 2IcXTrTb/+MMWKhLt5/O43lphxS7JPWnYIyTVdk/yAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnj/0bv656yMUOZigHtIQMsadUsxKbVIiGX9JZS5LwbZj2NY02YfhWWthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 Npl6rmPRzojffD1vqc9DUJ0L2Z8YvFf0eqSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DJoQQt2sm1TjEJf0nXYrCU+PB4towMDIY2J8QTKiEP
 pBxhTxHdg/8Q15/ChAuFcg6sMqlvlv4SRRigQfAzUYwyzeKl1EguFT3C/LFd9rPSchLk0Kwo
 mPd43+/EhwcLMaYyzeO7jSrnOCntSHxVZ8WFba43uV3m1DVzWsWYCD6TnPi/6P/0BTnHYsCd
 QpEoULCsJTe6mT0a+bzYhf7/Uei/T5CAPZsVO9ltBikn/+8DxmiOkAISTtIadoDvcAwRCA32
 lLho+4FFQCDo5XOFyvDq+78QSeafHFMcDRcPXNsoR4tuYGLnW0lsv7Yoj+P+oaRh8a9Jzz/y
 iviQMMW1+RK1p5jO0lWEDn6b9OQSnrhE1ZdCub/BDvNAuZFiGiNPdHABb/zt6soEWphZgPd1
 EXoYuDHhAz0MbmDlTaWXMIGF6yz6vCOPVX02AAzTsNxqmn9pCH6JOi8BQ2Swm8zb67onhezP
 ifuVf55vscPbBNGk4cpC25ONyja5fe5Tom0PhwlRtFPfoJwZGe6ENJGPiatM5TWuBF0y8kXY
 M7DGe71VCpyIfk3nVKeGrZGuZd2l39W+I8mbc2ip/hR+eHFPyD9pHZsGAbmU93VG4vY+F6Fr
 IsFb5LiJtc2eLSWXxQ7OLU7dDgiBXM6GYr3u4pQcOuCKRBhA2YvF7naxrZJRmCvt/k9ejvgl
 p1lZnJl9Q==
IronPort-HdrOrdr: A9a23:hjYdOq/3DIq1gsA1iLtuk+E6db1zdoMgy1knxilNoENuHfBwxv
 rDoB1E73LJYVYqOU3Jmbi7Sc69qFfnhORICO4qTMqftWjdyRCVxeRZg7cKrAeQeREWmtQtsJ
 uINpIOdOEYbmIK/PoSgjPIaurIqePvmMvD5Za8854ud3ATV0gJ1XYGNu/xKDwReOApP+tcKH
 LKjfA32AZINE5nJviTNz0gZazuttfLnJXpbVovAAMm0hCHiXeN5KThGxaV8x8CW3cXqI1Su1
 Ttokjc3OGOovu7whjT2yv66IlXosLozp9mCNaXgsYYBz3wgkKDZZhnWZeFoDcpydvfo2oCoZ
 3pmVMNLs5z43TeciWcpgbs4RDp1HIU53rr2Taj8AzeiP28YAh/J9tKhIpffBecwVEnpstA3K
 VC2H/cn4ZLDDvb9R6NqOTgZlVPrA6ZsHAimekcgzh0So0FcoJcqoQZ4Qd8DIoAJiTn84oqed
 MeQP003MwmMG9yUkqp/lWGmLeXLzcO91a9MwU/U/WuonZrdCsT9Tpb+CQd9k1wgK7VBaM0ot
 gsCZ4Y542mfvVmHZ6VO91xM/dfKla9Ny4kY1jiaGgOKsk8SgfwQtjMkfEI2N0=
X-IronPort-AV: E=Sophos;i="5.90,242,1643691600"; 
   d="scan'208";a="67696212"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fshvUTyl1AR8Ok+9K1ODFO8m4v4yohPpdgC90kkZT1QbDkCjVuvFbUQ+Z7W2JU2AEU9hYBclnhvTRLckbLyf0oCkwx5L/Eufo10+08bvKcXYu6vMCFOjCy5zrP7dHL/gow3xgTzcjs0vSm1uxQ7f+mHtTtBjoiWKZVuzcpxYw2cZJuXheLjpO45tzn5ugA2ZvQXTOayhwFKyegbaYSkRI2dOtqc5XHedycICEOpJUDGKDUtfDWf5fQWliWojPJQMTlX93E9B8ybC7alCNFh/x3ljgtKVbj6HUC8Z0OjGjZoCcis6JmbMnaN7QcE9NIUmoYGWLaoBXkVKuHfIQlrV0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y/FbFEWhY9PbV5wZOuV7ziLlYJTmx9SuC5JkI5h0Ioc=;
 b=JavIoTCWGgYL5qGP57Fls+03AijvXjDCbmb6mE2FmV6zjX/piun3Kg9CND1vrgS8EWVYx5u+zqaLw4BOHqmYNGv0z64Aux0uFPljG5kWF6w9+wgTkAXP/4r56Nd2bMKo5kBvUgcvnhgfLS2uq2npLt6gGzZTzh6A+OSCth1St+F4dwnrnp+rkUWjvRYKCzC4IBt1zUIm2S6549BFdSYkL5Bf82wRhTgEKcGaH4AOV9sSVZ6KrDEeNMe4E0EfFkksU7YqnXa5EGDzld07w2anufi85pwZENpg5tqEWwAxFUAQY4ScCQqgKo99pwBJAdxxM60uV5eUittH6OkMWqDVgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y/FbFEWhY9PbV5wZOuV7ziLlYJTmx9SuC5JkI5h0Ioc=;
 b=fHReCqUO307rK6Q+ULCUGsYHcb2ppbjAeCz3V/QXgAhVlKyzk5mG67e7QZuc9lDfn6e6vJIRF7oowmElJgSv4kqQl9qgJrw5q7m8kDPcEjhYKqSI352TCsBG79ckqJxH2V2ubdVHNQl8gu8qNfBA3YAyWPEhwLYa6qX7jSY1ck8=
Date: Thu, 7 Apr 2022 17:09:05 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 4.14] vPCI: replace %pp
Message-ID: <Yk7+kTmkVNl4WJWz@Air-de-Roger>
References: <36f65270-8807-323f-c1bd-d14dc742ee74@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <36f65270-8807-323f-c1bd-d14dc742ee74@suse.com>
X-ClientProxiedBy: LO3P123CA0005.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:ba::10) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dfd61e37-be00-43cc-a504-08da18a890d5
X-MS-TrafficTypeDiagnostic: BY5PR03MB4966:EE_
X-Microsoft-Antispam-PRVS: <BY5PR03MB4966BFC827769341DDE3BD158FE69@BY5PR03MB4966.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aXC9JKjRQwvDIATrClgKlCGnQx5ozAcjmWtm3GRsXq3YASEJ7cPsfEImbiMoAv5+Lw1ExgbIikz6jQYzawwSZT3QqnvhDQXK2gLx7OkEU4VCZOtul+mk5ZLnyBiAUVmhRVtkC2ssdMq8BnWe76742Q9PwFktSwbySqxdlRrjJTpD044mwSUVqL2j8zyN9CG62SoSpEmhC2wAvS9RU+G6sHes1iWy80D4LCdwj+WWdE73babp5FvV17hfEvO58uWH8EalTQOX9lutEF+0n+Eor2Cr6Ycu7mV+L4HXOYGnwau4+jjCHi5PqFHgTzQ3mpFgXu4gdqTMt/ysMvF26Pe8Kovp9gZWrn/535+yLgYjbAHsU/fasx2Rs0bR1UlF4KivMd+hXkiYBAJ04PzTriY3r5sscRJfvp6zADeiUbx7V2RipnKwxbrvYxqZpB61c2qEuduedZimSwfrE6uMThngKcxiGaHWbWxYYvA2e8P+nS1CoEuOKDNyNNUj4AM4LnXNHvtRJPdZ43yVU51exDc2XLtZsnlg2oIP5T0ze3WvmRgcmB5PoPDF4lti4LftPQJrarVp91JrRjQEronuwUhGNvLMsTNFDKm+DJp6Yk/E7QxKbGFtDce3HUf9d5xl49rc+nqfwxMX69WFFWdLYIbEYYRPLOYhI02vEIWyE+ov3OC48OYvT2W0pQixEw6vKGjaCr4XTrPRVpPj6ORUt+jjuQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(38100700002)(316002)(82960400001)(85182001)(6916009)(33716001)(2906002)(6486002)(6512007)(9686003)(508600001)(83380400001)(86362001)(5660300002)(6666004)(8936002)(6506007)(26005)(8676002)(66556008)(66946007)(558084003)(66476007)(4326008)(186003)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eUpQbFY2TGNoNXlxVlpObCtUVkRaZXZPYkwzamNCSll6anl6Q3lPWWxsalQ1?=
 =?utf-8?B?aGVrS1RGSnhrcUV3eFRWQnR2dmlQZ2IrbWZDem5JZW5UMUdkb1dhb0N2aitI?=
 =?utf-8?B?dVd5Z0NJVFlzTGpHYzZ0SlMvOWlucUZ1YlBlVVd0VFh1emh1TUJINXBEdGxx?=
 =?utf-8?B?UXhLR29ubzdaZVdwNDlxYU9Sb2F0K3JsZHhzK3JsbnRIRTFsb21LVncwZ000?=
 =?utf-8?B?dTJRdUZvcUw3ZTgwRUVWZ1EvRjMxbGNSSE0zMHZtdTBiV1RMY0x1bG1QSjBx?=
 =?utf-8?B?Y2JNSnRPWGx0SlRiOXhwWndTczUzcGp0TFZtME0vRjcySlZRMWMrbHJOd3Z6?=
 =?utf-8?B?WlpTWXNsZTZRSlgvQ3BMSWtvaTF6K2RTZ1pmQ05jcWw4bWU1NTNLQ2lPeGdF?=
 =?utf-8?B?RGxPMFduL01PWTlBOHhJN2FsOGVQUkdObmlSZjB2TDBHKzdjSGVidlVualFx?=
 =?utf-8?B?ZmNtR1VzZXh6U0dqTlRTY3hDYksvUnVjK0tPK3dWbk1SZ0xOZk5uMzNNYUdU?=
 =?utf-8?B?TlZnTTUvR2J6dkZ4aXRtUExHcDB4eHoweGdoRmVveU5sRyt2VDBRY280blFn?=
 =?utf-8?B?TkcyM083aWZzK28vSENsMzN3cEpjbXJKVE5rQUNlOWZuY2NabFRBM1N4Y0FU?=
 =?utf-8?B?YXI0aExKdHlTL1NSV0FVSkZRUkdYc0EybXlpVXNlVm16VTc5eDFOOGVhbldE?=
 =?utf-8?B?VzZvSHltREEwQTJKYksvMDV5dHk0bGJwUm9kcFNSUldiN3F0VXF3SlVaSHFu?=
 =?utf-8?B?ZjBtMWpzSUI2Q3J0S1RSNW9iOVNRTEptNUdvRUIzaXBuQVZ3L1IzR1BhU0tL?=
 =?utf-8?B?TlBycUpLTlV3eE1HSnVQK04ybWR6MGNSMGd1QTBEd005VTNVSy9SUmlxRjVk?=
 =?utf-8?B?WGYvWUY5V3BuQVdqWnZCSnd4SnlxQURNYzhxeVdPaFJ0bm5oOXFydEkyNnoy?=
 =?utf-8?B?bk1jN3VXRnNaUjlqSWVhUlk2QmdOaFRXYUUrYzlJL2lWV1NzdVQzaFNCUkdv?=
 =?utf-8?B?b0dRWkN3UXVwNW1qVmJJRGhNNWIyNTBacHFackl6NW14YjFxcXRlREw0N0R1?=
 =?utf-8?B?TjFQdmE1ZVpyNXNtUWVNYzkweWgzTEdIUjM1ZEFxd1FET2FGcnRaRm41NjdU?=
 =?utf-8?B?c1V0bXFwcno3S1kwQVNMTTl1eGFGKzI4WHp6ZFFsOTFZY0xSVld5emZGYlE4?=
 =?utf-8?B?WTlNbDc1NXlsYUtnMEJCNm54ZEhOYmtMem9pYkpvbXZQUzNrZUZ0RDNody8x?=
 =?utf-8?B?S3ZhdWQyRW5QK2Z2cDlqT3VieVhweHdjamNKcExFMzJKejNzenMvbkFWM0FT?=
 =?utf-8?B?L1lyQndBcTZKRW9tY25NaDgvbnhrVkpQYm93SkdCc2R1UGhrWHNEUzVyc05M?=
 =?utf-8?B?VStnUnBCWTRaV3JlRmJON285Q1RBWHZUTXBjTDVvOVFZYXpuVEJKT05jNTZO?=
 =?utf-8?B?VENuQWxZRlZiTVNNdXIrY1dPK1VkaG5aWi9aUUEyS0RrZkQzM2MrS1dva1Rk?=
 =?utf-8?B?aS9MTU1sS2c3T3NpeHE1ZkVvdU5FWDNlUTRXMUdvOFNlZXJQdnc2R1JpWUJR?=
 =?utf-8?B?TkI3aEhEYmE3WXlUeFRkVmRhamRGWTltUVRoTlJmdk1tTUtMa1J3ejJHNzZt?=
 =?utf-8?B?azRQUU5HM3BsVGRyMG9MQm1YT054QXNjejBpRkRMb2JuR3dFaTdpRjVtUlNR?=
 =?utf-8?B?ZUJJeU50Z1A3L0lwZDRYT1ovWG1KdWZXQ0M5T2Fya1d1VVhiaFR3Z2hmRXpw?=
 =?utf-8?B?NG5qVzBhNGI2OFYrQmFJaU0vVFVaMzVYNTV1MzVkOE9uT1R0V0JSZy9pRUNY?=
 =?utf-8?B?aVh6dTI2NldESncvSEFGaS9jTGRRSFJzbjJDS1Z3eURGeUJxc255cEI0UHdt?=
 =?utf-8?B?djFkVlAyMEY1ZXJxZlFFQ0ppeXl0N1dEVzFIZ0dSeWpwT0JwY09FalZvZGJU?=
 =?utf-8?B?UVAyR0x2RDRjSHprNlovUlBGUC9SMVArQ0VtVnJjVS9HQ2dDWjJNakNOWVB6?=
 =?utf-8?B?WDlZMkd0OGhSYzNrTUxCUkhZUWFBWkxzNkF3RDAyU1RxTWxFdjErS2R4a043?=
 =?utf-8?B?cEVqRnN0bHJOckdqNkd6Q1hEOWxsZzZSV1NCRUI0Snp6aGRBcjRickZSNTdK?=
 =?utf-8?B?Wkc2c2gzYm92UjBFSVNueDJVSEozTWFCK3RIdGdBMG1Da09tUU42VmkwQUVL?=
 =?utf-8?B?ZE1WcXgyNVZCY25idU5EcU9McXlqYVQ3aHVjUmlHekFzQk12TTVaaVJ5bjFo?=
 =?utf-8?B?TWhNbXFkTTFTRWNiMHk4VE9jaUdJVEdPN1FaeTRRbUJXU1RkMCtVREFtNHdi?=
 =?utf-8?B?RGFRNCs1N3UrMlZ6Uk9wQ3pwVTQyVHo3UU0xMC94Y1JTT0M2eTh4SENTRmZt?=
 =?utf-8?Q?9wAt9s9skiyAefkk=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dfd61e37-be00-43cc-a504-08da18a890d5
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2022 15:09:09.1401
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y99DCDQ/JKVQpp6Hr6MfmresH81sWUSV96+MiBLO/8jLMMPIdL6T4sMby0b09fzFQ8+DcuHiifoeWMLM6JftDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB4966
X-OriginatorOrg: citrix.com

On Thu, Apr 07, 2022 at 05:04:04PM +0200, Jan Beulich wrote:
> 4.14 doesn't know of this format specifier extension yet.
> 
> Fixes: 47188b2fdcc6 ("vpci/msix: fix PBA accesses")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

