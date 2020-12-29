Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CEDFF2E7306
	for <lists+xen-devel@lfdr.de>; Tue, 29 Dec 2020 19:33:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.60014.105238 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kuJnX-0001IH-8C; Tue, 29 Dec 2020 18:32:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 60014.105238; Tue, 29 Dec 2020 18:32:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kuJnX-0001Hs-4o; Tue, 29 Dec 2020 18:32:43 +0000
Received: by outflank-mailman (input) for mailman id 60014;
 Tue, 29 Dec 2020 18:32:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+dLv=GB=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kuJnV-0001Hn-DJ
 for xen-devel@lists.xenproject.org; Tue, 29 Dec 2020 18:32:41 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2c7733bb-8b8a-49f7-b9d7-24cb925fc9b6;
 Tue, 29 Dec 2020 18:32:39 +0000 (UTC)
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
X-Inumbo-ID: 2c7733bb-8b8a-49f7-b9d7-24cb925fc9b6
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1609266759;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=M/3y/3doC1ad70RgV8RfLGWLtEtk/a4Wi3U+sHbKEZY=;
  b=FDTRoYEzwmqznjnAXMcZjM8XO1r/lwNUTbl/kXyoTTUe8cIklV2L5v+f
   qJ/Eizc3nm/QaFfTyB6f71ouh6CyguvfT7cTf/MEKgHDCWfTfOvtRDhW9
   bEfFEHmgeppNZn7rKCKqjBpK5Q6d2fAeH17g+jlKUVXbl8vxH3QYl1bcs
   k=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: PkXk+qRCygNMickx0GXgk4gLLzVCPt2drp5cunWeLDokMD3Flma+2IbIep4i7vFHg27EHofCSK
 7t+pbGGZE5PdbcqX97uI9AKdqQ7hMIYfson67DWNAoxKaR5XVmS9y2PoFVkMZCXi0L026Nz4WU
 sCkQ9zDiCz/bst4oNU49tDEe5VsrMj6bAXvjqdXjPUP5Vm3Sx/lWcLCCnTEEcPygNeOYeqkkCQ
 RyYIC9rIvqxmWc2D8o63ANuU7N8FMZXpP6f+fgzOHiPJHe3jI5stvB6QycwEp4i533R9ANe6I1
 TPM=
X-SBRS: 5.2
X-MesageID: 34472537
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,458,1599537600"; 
   d="scan'208";a="34472537"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AMjVYJm93aquM2VZDhwxlOpyU/AJYFh6+wA7SPvNM9JvQMhLZYHGaxJGVqngUVEeOvWqcbOu5d+ufoiQwixspg6dPZMhRDivbxJuyTXlEHUh03sPdF6AUoxu3Act/zHkL46QDF8/e2nPZtTaOwjyzKPSEd9vcNIv7Chd+S7cphooR6llpQFqWhaaISq4guMlljieHDP8G3wyiXLXFHEPWAUtKupt/QCbKh90/RBnBrr6LWj+en3WJLLOIGmhqRGZGxbdtdUlA/xNN2E2F04nJAL1YhyrW7SaGvbyEqmXM77vIyczKF5C+3W4JJV+i39oN8A2qKQhLn2D8SLceURv4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lEZnW9igkVJyzeUjUge94HQbb/jeodQKBQk7yT/vmbI=;
 b=PxStWaT/7X8ndIO57aMOCBVSg7t/FuKdXrLU51ZPXHaojSrG2LQtcV8Y4CJK0ikL3T8JXk5X4yNHl0aD4/MRWKE0LaZOulsNlEcaZMQSrWuW0RvhI4mYl+1+Wudx3CRIIgHE0DcAYQ8ZwZWwt78kT5EqI9CqM46AbmmA9bYtUPHrGvzYb5j1ILswsSq1BxMd4J8/6wulLaNUZoIpcbhz5zIWsyzoMKIEI3PS6VN7cbqOxxr2K/1n42QDuBLJdFm2jC4F/wkW2sKlYYVFBxqApn1ooIeYYR4APIjVCo3pub7tWbbELt1imMyrpWGzW3VHZ9+azGSU9VVsacSR3SaqBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lEZnW9igkVJyzeUjUge94HQbb/jeodQKBQk7yT/vmbI=;
 b=EPLTs+l72lEIXihRyeVLPR+zmKk0Zf3jleHejYzntDtcoTgxjWrCm/x2a2gjs80zW3wk8aSZpv8quEE3wcfl3PTYHPTTJ8mnt+vdOVEKH14anEpG87QeojWOM4odGNLtjsJx1NNkEN70ce8TTafZHN36ZLVS9LT051bGFgAd8Fs=
Date: Tue, 29 Dec 2020 19:32:29 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: tosher 1 <akm2tosher@yahoo.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Oleksandr Andrushchenko
	<andr2000@gmail.com>, Paul Durrant <xadimgnik@gmail.com>
Subject: Re: PVH mode PCI passthrough status
Message-ID: <20201229183229.okhtyskjylm2bhx4@Air-de-Roger>
References: <943136031.5051796.1609179068383.ref@mail.yahoo.com>
 <943136031.5051796.1609179068383@mail.yahoo.com>
 <20201229081943.ifaiwrqyj5ojwufn@Air-de-Roger>
 <88957249.5342211.1609261310806@mail.yahoo.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <88957249.5342211.1609261310806@mail.yahoo.com>
X-ClientProxiedBy: MRXP264CA0025.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:14::13) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f1bf6e7a-abcc-40b2-9e2f-08d8ac281ce8
X-MS-TrafficTypeDiagnostic: DM6PR03MB4476:
X-Microsoft-Antispam-PRVS: <DM6PR03MB447663EA4859B6F19ADF742E8FD80@DM6PR03MB4476.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JQ75Hsd6J2kpgMWCPwo1EvTDInMQEjPnVJOdC6uZC7haWKrj2ze46MqSJ0ADZ9BfJ1BXZOK0gYgtXp3SKsDj+jJLWIV2E55dXZi0TeF4rvbxG1iDh3wE2eShjMfK1Hh148mR/xabqmMA5zalqbGZNV3yOEr2jQ4b+8Cty/VOsXC+0JJHmYugH6WaQMnAUVk4Lu4fgF7zEJ96QtuIwopKO/BiLfv9pJhGI1ar+lLErUbNiMLo20fkOvzYRBd2KGC7YTPzv+goiLgqkIFNZwBua3AN5aXIj8yMhum+TBnX14LoeZpd/ZmD6aqms0zXiCrLZMLjCg/db10TvoB6+MXg0I061z5DMScIC1hxZVv8olviG47c+w3uPz4W7kbryGKTFNQA9en+yM+pgpHmMZkneQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(396003)(346002)(376002)(366004)(136003)(39860400002)(66946007)(66476007)(5660300002)(1076003)(66556008)(85182001)(83380400001)(6496006)(16526019)(8936002)(4744005)(6486002)(86362001)(316002)(33716001)(9686003)(8676002)(4326008)(956004)(186003)(26005)(6916009)(6666004)(478600001)(2906002)(54906003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ejRGYkZLRXVXZnlKWVFnc2diVGpEL0w5OFhQMW9jaEI5RFVzdTZUMWNVSjU2?=
 =?utf-8?B?QXJZcE0xSmlTUUo0U2JVcFNpdkdBYm5XUG5YNHp1aTlaWkhaRHpJN2kxTkdS?=
 =?utf-8?B?L3BvK0RQeVJWOGJzVzUrbHZpN1VoNFVTb09ZTEdrK2J1M0hoekxmZzRyWStt?=
 =?utf-8?B?bURwY3pINHVHangyT2Z3NW5OazNHamsra1d2T3dGMS90Z2hWNHh6K21nS3E3?=
 =?utf-8?B?RUdYSTBUd1B0VzhGczNaRkdiZ2JQRHlKQlVubzc5bTdydndGcG52UzdRYlhM?=
 =?utf-8?B?T1Z3bzM1MXNUbThaQ0xwbGhsWi9WOW9Ycm5DVjFHK3dyMmVYOUhpYk4rSncr?=
 =?utf-8?B?TEpxT2VhWXZJUHE3RktsM0gvenhMcGExU3QxbW5XeWREQ3J6NG44WlQvRHRF?=
 =?utf-8?B?Y3dLUE9yUEhvQktjWFlrbHBWdkVXS1NKKy95RWFOQjUyb2xIbnFxalhXTGZt?=
 =?utf-8?B?ekY3dkJJWUR4a3pJUFkvYnA2YVNqUjNOeWx3ZHJmdDhRUmw4UzRtRzRJMWhC?=
 =?utf-8?B?MHpyMTNBVklSNjYzZzE3RjlJd1pFQzJpZUwrTjRYUjQwQUpLU3QzbGVNeVRl?=
 =?utf-8?B?WHhzaUMvUnZ4cUpOQldZNDJiZTBmdVN6WmZ0QjJqOXdCODhaTm9la1VZbnVR?=
 =?utf-8?B?Nllyb1BIK1IxVDdqYlNkMVZVNk1uMlA1YXlQTi8xeHJYOWRBVDZ1Nkd0Mm8z?=
 =?utf-8?B?ZVQ4L1JIUGRFaUFyeU9pRjkwZnQzOENxSUw3VGJ2Um0vWGlrUm5QeVdSVE1l?=
 =?utf-8?B?cnNpanlKWkdncEFYbTExaEE0cnh0S3IyOGZxbG45QjVMMUN4SUVWcW1BYVFO?=
 =?utf-8?B?OWhhUkZmSC96bDNNbUdkNUNrRnJsZXZ4L1dkMVphUnFic1p1YjZBdmJFREo0?=
 =?utf-8?B?cUJoVnpGOWN0NjIxVVBEVTdaQjlPdlMvZW1MQkYveU9UR1luSDVWNnowZkRm?=
 =?utf-8?B?dkJqS0ZnV09ybmlLd0tmUEJGZzJ4cEw5M1BheXpsU3FvOWpsbFlKQ2gwdGhq?=
 =?utf-8?B?SkFwRWUxNkpxcDdNZDg4U2NNVnAxMWRuZWJtSzZPanQyUGRBemZVcllCTTRL?=
 =?utf-8?B?T0NCeEluaWVncVlOOENPZmFKVFg5cmFxRDJjYTQ5QWw5SHVENldzNnYxUnJU?=
 =?utf-8?B?Q3I2ajRyUjJ4Wk53cUl1dnlyMkRxdnN1eHVrS3NWenZrNHpYU3dTQ2R0cnN3?=
 =?utf-8?B?Z2ZZTUhjbzZpYXQ3ZG43dytCK09kRWtaaG8yd2gyUVVJNktLZHFGeHBYMGlB?=
 =?utf-8?B?emtMWTBPY1hoZTBwQTBqZDMyS0VNb09FMGhSQmZteEIvMnZtUFRjVk1mYzlq?=
 =?utf-8?Q?Us+Mi/AlarCCOdv4iSnffDd1l5In9tqEd/?=
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Dec 2020 18:32:35.5864
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-Network-Message-Id: f1bf6e7a-abcc-40b2-9e2f-08d8ac281ce8
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d4l/AG7oZK/JU+B39II8/xGDvsxSpSyNWfcVWWuhm0LGnaCwZ0iJEUSoJ56ZwPgHk5UryafefMp6iu80wz2TSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4476
X-OriginatorOrg: citrix.com

On Tue, Dec 29, 2020 at 05:01:50PM +0000, tosher 1 wrote:
> Hi Roger,
> 
> > I think you meant PVH mode in the sentence above instead of PVM?
> 
> Sorry, that was a typo. I meant PVH.
> 
> > Arm folks are working on using vPCI for domUs, which could easily be picked up by x86 once ready. There's also the option to import xenpt [0] from Paul Durrant and use it with PVH, but it will likely require some work.
> 
> Thanks for your response. Do you have any timeline in mind on when support for x86 will be available? A rough estimate would help me with planning something.

I'm adding the relevant people working on this, Oleksandr for the vPCI
Arm work and Paul for xenpt.

The xenpt stuff shouldn't be complicated (Paul can correct me), as it
would mostly involve importing xenpt into the xen.git repository and
then wiring it up for the toolstack to use it, at least to get an
initial version working.

Roger.

