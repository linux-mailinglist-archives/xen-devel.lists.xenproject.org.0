Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6D9A3B91AE
	for <lists+xen-devel@lfdr.de>; Thu,  1 Jul 2021 14:36:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.148660.274718 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lyvur-0000Q6-UB; Thu, 01 Jul 2021 12:35:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 148660.274718; Thu, 01 Jul 2021 12:35:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lyvur-0000Ne-R8; Thu, 01 Jul 2021 12:35:37 +0000
Received: by outflank-mailman (input) for mailman id 148660;
 Thu, 01 Jul 2021 12:35:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xRek=LZ=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1lyvup-0000NY-8u
 for xen-devel@lists.xenproject.org; Thu, 01 Jul 2021 12:35:35 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d3d48362-da68-11eb-830f-12813bfff9fa;
 Thu, 01 Jul 2021 12:35:33 +0000 (UTC)
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
X-Inumbo-ID: d3d48362-da68-11eb-830f-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1625142933;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=IKAGF7D6OKxUEI5hSQIjI5M/65C8tk+mCvXLhbx6tbY=;
  b=Mtg6VTQlVw+UlzxsZE+YtzQZpxUD7neDwaFbkEQy3XpIs73VqtMwltaC
   ddZuDydZsPWipPv5DV4eb4qT6JziPVW005p0mIt5wzM8/ry3jC5+RErKP
   SakPgSWdqn1y9UW52V45UBXyOsQ1kogjv2V2YZH4srtuilqOmUqq0Z+EX
   k=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: vytxaQ/PTWbXs12TUrr1PT41/o/f2nLoNaPLOZ6OZqBUA59JDsmHiUa10ICiOqubdj8odXZsXM
 53jsR686OZTU+cxiwg5TKGKzd9+Ww0So5tSZwWtv2aJM6Xqi7gn5rd2qsSvEYJNHvljMSYFTkI
 zFhpwBvZf+GvSbelSv749CRF/crcE5yodde/MKSffV9kyBvEAcJP+Mjglgh0jiypa08mnVtrId
 sqNxg3DOXvjtTfwd+ZEWDMOIZrLnJ2bpqTaQaGiQWNILcS+DD6PgylfdZXMbyQyuLcAB3Teu0B
 +R8=
X-SBRS: 5.1
X-MesageID: 47744962
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:o2uHR68Wgs1wYCNCFjhuk+DcI+orL9Y04lQ7vn2ZOiYlF/Bw9v
 re+MjzsCWetN9/YgBGpTn+AtjifZqxz/JICPAqTNWftWrd1ldATrsSi7cKqgeIc0fDH4Vmup
 uIHZISNDQlNzlHZbCW2mmFL+o=
X-IronPort-AV: E=Sophos;i="5.83,314,1616472000"; 
   d="scan'208";a="47744962"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qsj8wdjrnLSeB62sRJPBATB+PmcPbbsIKZxXIKzvMAsYIUX3knIA+qAwP8myydXAsQgbqWuB31zYD4JRE9GPLTIhAUMOcMJJxUDuvgduUUCFTu3vkF02iJxH8je9t7zrPbsdsMbvAf9T5iHmHBSQHiIq8xVjKB0TjsH06iPXjIkJSLp20hIYtVegA+Qax8DSfOTLUooPF9n4Yz/zhDwK33Vl2Mi04MYPE0Z+jNORviYiifl36d9ahbRD/Kt5amfeZ5KovsLbitL3o2bU650ZQJxq2Q0OFBkX4aVxfdwb02RtHiRQcVO31JgwEFTU1fxm9sEk2voiEjZug4it/YQSPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IKAGF7D6OKxUEI5hSQIjI5M/65C8tk+mCvXLhbx6tbY=;
 b=itXhyXAywnUWEN6nFasFPBC1mHu2kzqWDzqgkKtCjcmCbC15HHnmQV7yV6jgFcsoEp6rvWrqqjUbnuz8sKbQREu8J0dG3K+imDppkXchqmgDodPZgKOwQVu1JIUo+225j3E7iaGxwjEhs0NwKIdQYKMCP5VW/rx1qejuJQjwwL1CzkmslHZbiO3T20fRZ4joKRtigDLOcJ20Ar/o3McVrPq9y3BUBpkIZeYq7U9VqOKlBuhFexXtqBNbJzZy1VEY1u0zC+vPEZAsZ9hjkRjYI5M19lFpMiDZJdu2lnP1dPw8w0JY7RX4yAYNSm7Ve5Gvt4IuAfw/25fdQ5wCfatzQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IKAGF7D6OKxUEI5hSQIjI5M/65C8tk+mCvXLhbx6tbY=;
 b=MM7dXUJ3+oAnp0omN7DNpvNWdV1qDKfS3aIW5XNLvy2SKk8QCKA5UZkMk2robbYViTtUoLEOg4COKu2vRCnharGuISOW3vSY0TRmiwpFm+9MpbZaQ1qr1RjTqsoCbOcLOyGTsxs6m1dYkT6ZRZ1s8X5q/IUGhoGNbGbK47A5ATg=
To: Olaf Hering <olaf@aepfle.de>
CC: <xen-devel@lists.xenproject.org>
References: <20210701125623.593fe3ae.olaf@aepfle.de>
 <20e828c9-e7dc-4401-9307-a6d72eb618d8@citrix.com>
 <20210701133628.1667a344.olaf@aepfle.de>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: XEN_SYSCTL_cpu_policy_hvm_default truncates leaf count
Message-ID: <67f50c0d-753c-936e-bf1e-11a708150851@citrix.com>
Date: Thu, 1 Jul 2021 13:35:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210701133628.1667a344.olaf@aepfle.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0026.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:151::13) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fa32f038-ec66-49b6-20d7-08d93c8cb472
X-MS-TrafficTypeDiagnostic: BYAPR03MB3861:
X-Microsoft-Antispam-PRVS: <BYAPR03MB38612A73FCE283D55146C50FBA009@BYAPR03MB3861.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bS1F6UHvmS6Ds3QJm6QgphrcsqALKQis5LlwFRr6ct3gjBRJep7VhfsMub0B59KraqJVlBd36Af2KwsWgTunbC1om77BhHtQ/L47MYCbuoVn4QBbzUAS2mBfKLBX/0CcuZg3PT1DysDu0XGnemHq/HJqvZktBYqixBjFgwCM4VXn4AqZK3bQIy9UfHz2IBqJ0QGkPrXqSByZ9ZQD+ilLFhPbv37crzi5oIPL1HhN2ybcy9DtTraMPfbJZ2+gWQWy06J0XeDJoD7Nos6l6NFt3fJnyo547mFgimmSt7blYhM5AI6CYrzDbV1a6yD1Bdn8nBDUt8WXn4VvegbE/pXRIRFE9SIEo2PUQeCd4N0T/mljaYqKO4tgNMYpW7L9Nsd5PYapEhLa7H5ivKQajt1rXvmtTkVGWzKb5WaUj9fdiwcrAknYMB4duE2J82KlMmIY6PRA6a4HmkeSlmRw4FKpgmSqdX8+511VT+ivAMGSH08e6AjEleTq3rpJf5AlFSAErIYeVEbgH6glJWL1qzeQz+UJDCVkXsI8oD203rvaQEGHGw5Tl4XkgZfgf/boI+V/HqtbqPAuM2knoDVlfqzoj5dkxdLQsDZCiqKmIu5QAi3ZMsrjDJJBPDgnZ56PaK2vfYvJVwRVAv5qv4CrDw4DC76ZVbXhy6kCgI1MR2fUTCYCzkK8DAgGE3UJE9OM70x8WAUJn8LabE0OCW4+F7eUkJMVB/Wc30c1cdHRnwfFod4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(136003)(346002)(366004)(376002)(396003)(6916009)(4326008)(4744005)(2616005)(66476007)(16526019)(26005)(38100700002)(66946007)(53546011)(6486002)(956004)(16576012)(316002)(186003)(6666004)(31696002)(66556008)(2906002)(8936002)(8676002)(5660300002)(86362001)(83380400001)(36756003)(31686004)(478600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UE9qUEQ0VmFsbmdicDJpOVdOMmdReFhQM1NJR2ppSWVUWjl0S3E4N0xRcFc2?=
 =?utf-8?B?VGlCMEFHYWJWMnpMQWNLWGdjZDFOUkJ6dkNyV0IwSlRRbXZXUVhqN201MGdJ?=
 =?utf-8?B?NytjMFhCV3haWG9Dc3k0T1hRazhLdUtUbUVkaC8xbUF1bG8ydzFHb1d3eDRJ?=
 =?utf-8?B?SzdzRkNGZndNekhQSm1hc2IwSm5zc1Y1NllqWjZWeFFRSnozS0JxdnI5bjRS?=
 =?utf-8?B?RjM5Q2pUTjZEWVdUeWU3MkdJd1JrcWNVMTdLMFFWNzFGRGxtb0dGbkVTeFpF?=
 =?utf-8?B?V3Zhc05aei9BNU9UQkNiSngwU0hjb0pGc2ZSSFAwVXcvWmZCRmFBSk0wbTk3?=
 =?utf-8?B?WkFvcGVRVUxLaGNxci9TV0Z2ZFZDWlBqcHRYMHpwUXZtMUR1MDdoUjduRmpG?=
 =?utf-8?B?OTFjNVFScWM0SlM3WEcrMTJDVjlURGJQbU1Ga25XTXBja3llVExEZzYzNDhi?=
 =?utf-8?B?czV0dTYzZVdFd01MS2RmSVBtakF5UFRXR1p5aU1QelF6eWNsTjJvSDBqNjA4?=
 =?utf-8?B?WlY5bWZWQ3NEK0xwdklHVlp4eUxOa1VXL0RQSWE2cDZwa3dUNWNpN3NsMVho?=
 =?utf-8?B?NUwwVGtZeUdvT2lieng3RXhReU1uVS9jQ1hTa1BUNDh3SXd0TWxsZTFtQzFB?=
 =?utf-8?B?b041cy9rL0dVYjhGNndHTnZQWVUyTitONHFRU2I4cDVWalMreTRyRmtlYWJM?=
 =?utf-8?B?d3RrUzVoNWxtaGZFdlJrVkpvamV0cmV2U3lxYy92enRpTERyc2JFZjZqc0V6?=
 =?utf-8?B?VE53ekNCRytRSXdZTS9qWW1xemUzN0lYYWJ0aDQ3OUN1OElxQ1ZYMk8xT2ZQ?=
 =?utf-8?B?UXEyU2FXMWo3SldvdExUalY5b3dDcVhZN0ZHelhBREFZRE1CSjl1QUN2SU5L?=
 =?utf-8?B?ODl4dm4zT1E1dkNFSnVJOE56RFVxbGppTitNekt4VHFBdVNxTEdjMlR3QXVn?=
 =?utf-8?B?MkwxYzM0aWhaS3JlSEJtTWNPTVBzRSt1akFSK3l2VFBNMWR5YnpvU2lScmJ6?=
 =?utf-8?B?YlZaakR5WVozdGFCVTdBU2lDZFRxa1laZVJpTXA3WDFZa09ZT1A5eFozNW1U?=
 =?utf-8?B?dnVPa2lNWTFWSk5HZ0JqV0JmekVzWXlYL1Yvc1BPb0VJZ014Mk0vcHVzQnd3?=
 =?utf-8?B?VzNhQ3FpOWJtRWdCL2w5NERHeVBvbVJWRHJDOHNtK2pWYUxObHhldDE2RUMx?=
 =?utf-8?B?OEpNVndkckJYV1ZHaWM0YURZNWdFdVJqcURwQnJZOHVrUXZPTytYZWZ2Qi9j?=
 =?utf-8?B?L29PcWQ3ZVlHQ2FhT0pFTFlUd3VVZGVFQnlMRkpFZXNOWmxpNHdBQWJEclpF?=
 =?utf-8?B?MFl1eGNtbytMWnI3ZnlSdGlQRVd0Wnkvc04xNDBCQzdyQWVVMEovNE1qY25X?=
 =?utf-8?B?R3JlQ2xQMmtVazBpS1Eva1hHMHYvWHN5Ry92WXFGWW43M052YmlLZVhrV1BI?=
 =?utf-8?B?ZzVmd0t3QlZFMmZiYk45ZVdtUE5iNmJzandPMWVDMlRza3dJZ1RyeUJvdkZr?=
 =?utf-8?B?TXZRUDJUSE42TlhFKzFBUmpRWXg5MWZEOW15a1Y2QjlaVFBmZVVrVWlxRGtR?=
 =?utf-8?B?UHZMR040dGJWMUwwWHlKcjNzbklyN1NidWhlTng1OFBmSEI1YVZXYUNvSmFw?=
 =?utf-8?B?NklycytuYzlnK0hKUS9jMC9DbUhKMmNsVW1jOXBoeGt0U2FkUWZxeXFNN0pn?=
 =?utf-8?B?eFZ5bmhkWk01Z2RZakZDWlNLSEQzbHRaL1RCVXpkY0hxUmhrQURCUmM2VUpi?=
 =?utf-8?Q?jad/msG43e7wxFGYFo3FGUaAZdwimpZa2Q8k1RJ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fa32f038-ec66-49b6-20d7-08d93c8cb472
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2021 12:35:27.3100
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5X6Ab17oDPzRCfQFjtITaRM3X6BoGqqlt4kgBAHID8HRv2U993I/bjgSjQZ57aWkaZ/WgRw17eMXPBa45jrwPCdEJw+v7btHr1xZkQjP+ek=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3861
X-OriginatorOrg: citrix.com

On 01/07/2021 12:36, Olaf Hering wrote:
> Am Thu, 1 Jul 2021 12:19:24 +0100
> schrieb Andrew Cooper <andrew.cooper3@citrix.com>:
>
>> This *ought* to be "grab default, edit a few details, send back to
>> Xen".=C2=A0 Where is the 51 leaves coming in?=C2=A0 Do you have cpuid=3D=
 lines in
>> the xl cfg file?
> No cpuid=3D or anything in domU.cfg or Xen cmdline.
> If I understand x86_cpuid_copy_to_buffer correctly, it copies all of basi=
c+extd and viridian+xen leaves, which is apparently more than 31.

It will copy the subset based on things like max_leaf, etc.

Can you grab xen-cpuid -p from this system please?

~Andrew


