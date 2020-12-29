Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF4012E7180
	for <lists+xen-devel@lfdr.de>; Tue, 29 Dec 2020 15:52:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.59954.105120 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kuGM2-0006Bq-08; Tue, 29 Dec 2020 14:52:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 59954.105120; Tue, 29 Dec 2020 14:52:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kuGM1-0006BT-T6; Tue, 29 Dec 2020 14:52:05 +0000
Received: by outflank-mailman (input) for mailman id 59954;
 Tue, 29 Dec 2020 14:52:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+dLv=GB=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kuGM0-0006BL-QB
 for xen-devel@lists.xenproject.org; Tue, 29 Dec 2020 14:52:04 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 19e7d749-2c96-4894-a514-bde4fa320967;
 Tue, 29 Dec 2020 14:52:03 +0000 (UTC)
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
X-Inumbo-ID: 19e7d749-2c96-4894-a514-bde4fa320967
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1609253523;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=45Txw/1OeEfF/CSE3TqbrpfP8FkmV+Y4xdDV1jj+5v4=;
  b=I6iXWPy9Br93g0VxAquKetYbbla9WXoz0KyNj0mROV1QXYLUR2n9JWXl
   rqT/dNwD3JtM9oFd+oxS+jEv1ZIzdVqZ8S1qIq87GpJxSbS3nboexV3gT
   ikEq3IFrbiFUhEDOZYZR3NqB3yqJzD+qIDtRdIcEDXEoBu20NTSMssEfN
   M=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: Lc4hhdAmPuGEJZmxk1ka6/1vrU2i5pf7A9UINy3dFKFh2kjbMpz42+zgVzW7b/3eoQYP2qomI3
 a+FqvPARf0XcpVXEKzTraFb4HEInx57ds/KtCxhUOj4VF5B88eDoLea3tQXsIZQBs4IODDeA4Z
 TIxQZ97SplDVInmukxDvXcnAJvZUgvi2rByfMM8zKbK/u5oMW6RRnNKymxHPm4zZRlvSAFBUMr
 ix2JG9wkLofLKWBbVqE108YpoqWEdtI5olaSfVPBcjxqWzZQjnB8LL0yhJUpH37arFkkxAArM3
 Yds=
X-SBRS: 5.2
X-MesageID: 34093730
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,458,1599537600"; 
   d="scan'208";a="34093730"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CYlKEAMiy5nc/HDhEeQF6G7IFSaDt3G6JbPMe+NjoSOuRkBd+aIol+MjEMB/rN8wPY3L9Boko2BpXhjNSw0Dp37q+SlVWOWyi9VHuydJoU03aFkrhgNQr77ftW6LLflM9zw5pEKMgxuWKjb0zz0Hk5Hr66BnV1bz1wPTuTktmW+eyDK+4KIGtdz/bCtEZiFyBmrMAaW6X65pI0cQH7T9AsOBs3UafpKCB8//nGo/Y7XRitYmt/I1IkvtfUgS4llZyptg++F5T14VUIeCsd90FX3+GN4f1n0s1UxRCm+5xZofSWOXzMrZxttbDs3yGQiQSqiyx6fO7Kh9B3Rd36UCNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zczBwuZiu0pOW8u1wPMKkqUHJLefuJuMntu7TSVTNho=;
 b=FgsO/ms39OaPbO4IoY13fvUq1+Ao2MlzlK3BhRhOPT12caCCB/FeK8eaewUT96HL1adwUBOgTxg1esukHV5aQLAmk4MX1jLE76OEB5c2IiCmrvd57E1fFeRXF6hN4U6PBJcRHXzB0N7zONWT/7ILSL6awhpkVixcU/ITBMqGmaw9dw5cxLmBx1lxgQN9A1jMgCx5IGN2S29yKRgE17Bdu/3VTtjYxK4O/lMMoByHwjFakEmIvSxXAvP6mo7lX0yFSU/CPnANxPgx2jRcrpkTRDXRDm+A4py/Amgp8wcUE7EzbNb8wyezA6YOMYCGfIDl3ua8/GCGGdy3rx6VvJBc6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zczBwuZiu0pOW8u1wPMKkqUHJLefuJuMntu7TSVTNho=;
 b=ZdR19TNZYnLC+5GhsXDTlly59TzhaICMfgLRQMXgk/21pRWZcuUzeQuGcC3eF1hz44FVEcXws/CMwPg4WL5qXDfNvW46r0QC9qC19ChJZ/R3vL0wMZGyTQQYKAAKDh4Jamyt2qQcVuECVU0Y1QHC81UVPshM/CEng0EshhsgXSM=
Date: Tue, 29 Dec 2020 15:51:55 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Manuel Bouyer <bouyer@netbsd.org>
CC: <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 20/24] If FILENAME_MAX is defined, use it instead of
 arbitrary value (fix format-truncation errors with GCC >= 7)
Message-ID: <20201229145155.5gwyyrb47p45ak3c@Air-de-Roger>
References: <20201214163623.2127-1-bouyer@netbsd.org>
 <20201214163623.2127-21-bouyer@netbsd.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201214163623.2127-21-bouyer@netbsd.org>
X-ClientProxiedBy: MRXP264CA0001.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:15::13) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9b2e55f5-69d7-49f2-c95f-08d8ac094bda
X-MS-TrafficTypeDiagnostic: DM5PR03MB3291:
X-Microsoft-Antispam-PRVS: <DM5PR03MB3291580E0DAB12E4772C6BE98FD80@DM5PR03MB3291.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: o+OhZ2ZSgqTM6dWLIJTBJKtLGfYfO2WfcfcX2wWO+YvI/2Nf2JrwWj5BD8VJuvKAPGs7mvDvFvxxte/VybOaU98AV61fuRjGx8JkWafu2kG9IaiBXO0irRXw/uxA2mlky16PCm1LefSXxVoeOuk6501/1z97uMGoXbVLNW9MjsbaHASsP0DszdX8E24gQNZcKRBFoSHLf6DgkOSOK64WD6FZ+eu10szHky2+yXzgH1VueUvqTXICUINAIkwnuZpl8VDWIuUthbKz70cGHyTZDsE1+k34BDSpjuo5gSnus8OBwtj7iVT3PtjWxuHduhhpNzvwc6MvNO+EbrJ/4joNMVoK9mf/c8CEMOBGEk5mpagR1110UdQf8gqL5vJ6hvrY5lEHhIy0cB11CftyechzTg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(366004)(39860400002)(376002)(346002)(136003)(396003)(6486002)(16526019)(66946007)(8936002)(8676002)(66476007)(6666004)(478600001)(9686003)(33716001)(5660300002)(66556008)(956004)(4326008)(26005)(86362001)(186003)(6916009)(2906002)(6496006)(85182001)(1076003)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?QXRxTkdDU21CQzQwU21IaW9qN0d1N2kxZTBUWnZaNGdrU0NwS2xEUEZqQUYv?=
 =?utf-8?B?M2JIMmNDM0ROU0ZKWXdRTC85MlBoSTBWSU5JUVExYzJEVytndnVnd1hFQ3c1?=
 =?utf-8?B?NWFKUEYvaHUxM2YwbUZUd1NyWmJaZjM2bnU3Q2s4eUtzL0pPdU1jTlpIb3FE?=
 =?utf-8?B?MHcvVm9lWFVHREFTN1FKVkNDUTUyOS9iYksvdiswdGNZT3BQTmgzbUpJbXgv?=
 =?utf-8?B?cWNSMS95V0I2QzR1WTBiaE9uZG1kZ2trYU9qbGJ6RGJzUC94bVRRdTArVHkx?=
 =?utf-8?B?OThPaXo2cWdKTStJYkNXRUY3RDJ6K2Z3NHRkdlJDdFVDRnYrWWRMUTZpV1Ra?=
 =?utf-8?B?YkFKaFlpb3FzditWY1V6Mk80b3pUVW1uNW42ZjRWcFRmOExBWG80N3lJS1Bn?=
 =?utf-8?B?SFFwVDZYd2NoN1psWEdtSk82RlhMaDNRSlhxQ0FSdlNlUWtEeWYvRnJtK0tv?=
 =?utf-8?B?dXJQWEdvYXBDVkkvOWFXNXF5U1cvQXhHN0Rldmo0Y2FrY0RNVlROMk1RNmZj?=
 =?utf-8?B?b2F3Ymh6cGJkTVJKMUoyRFo4eTFWV25NdGU2TzhndFhnaC9zNWEyRjZUa2Ra?=
 =?utf-8?B?dENCSVd6QkN0ZG1KWFJUaEZjbHNGT0JJaENoZEl1ekNDQjE3SmE0Q3A3Zkhy?=
 =?utf-8?B?SGpxSHVsQ3hmeXRDMEdkNXVseGFCcTNHSzlBR3lnNGlSV0NHcTNQYTJwOGlL?=
 =?utf-8?B?VmNySm1YRkVKeXQ4VTI1ZkVtUjNqd0dkZ3BKWFQ5WXJuSjg0T0dVWW5sK0xn?=
 =?utf-8?B?UDBOeTFyb1hHNWFORUxqTGZFVjBzNzlJVE9CSFM0ekdUcFBHSTNCTUxUdllB?=
 =?utf-8?B?dlBLZW1GSWJPRUd0Z1hzSEhwaUdvYTltbTNWQk1vNGI5RTl5U3NjR05QUkZn?=
 =?utf-8?B?dzZza1h1ZC9ST29xSG9ibHpCUmxFdHM5YmRlVG40MW4wVFhMSWY1dUdnMkVK?=
 =?utf-8?B?TWE3cUVTNG4vNEtVWCt3QXZ6QUlQbjVCVElISkpQdkFxVFFhd0ttRGR3QjVm?=
 =?utf-8?B?aDdCbXBEUUtQTkM0ZVcxSXRTQXllS3dVTks3dXRkZitsZW5XWkxPTm00M1dR?=
 =?utf-8?B?Ymt2V1lBRVBFVE10U3dubld0U2NEZTdTeFVvZXBjSHFZYktvdWVQZ2pRd3NL?=
 =?utf-8?B?S1M3SlF5Yytma05RenFFZ2VZbnNvUGYrd1RPaTBvUXhjb0tkdWxJRnhBdnZO?=
 =?utf-8?B?dTRJRXNTTUF0dGpHZUFCUG1WVGROU2lSRzFCS0NmeGNUemZuREl2MzQvdFF6?=
 =?utf-8?B?bVR6cUNJbVR3VXBmdzd6YTJFR2xFcXNtTmNrVWJYMXFBOHF3Q0UxOXY1T2RB?=
 =?utf-8?Q?TYzOlxtFxbFeqH3veBEQ+rh6/V0bKqz5nv?=
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Dec 2020 14:51:59.9132
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b2e55f5-69d7-49f2-c95f-08d8ac094bda
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SpNg/spkwqk99rrp1mdfNFHQ5hZ4atXb9Vq25V53AVNDgBX7mY3ssESHK/cQ/aKbXwuoNfexTPRp+vn0hmP36Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB3291
X-OriginatorOrg: citrix.com

On Mon, Dec 14, 2020 at 05:36:19PM +0100, Manuel Bouyer wrote:
> ---
>  tools/xenpmd/xenpmd.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/tools/xenpmd/xenpmd.c b/tools/xenpmd/xenpmd.c
> index 12b82cf43e..cfd22e64e3 100644
> --- a/tools/xenpmd/xenpmd.c
> +++ b/tools/xenpmd/xenpmd.c
> @@ -101,7 +101,11 @@ FILE *get_next_battery_file(DIR *battery_dir,
>  {
>      FILE *file = 0;
>      struct dirent *dir_entries;
> +#ifdef FILENAME_MAX
> +    char file_name[FILENAME_MAX];
> +#else
>      char file_name[284];
> +#endif
>      int ret;

I think it's dangerous to do this, specially on the stack, GNU libc
manual states:

Usage Note: Don’t use FILENAME_MAX as the size of an array in which to
store a file name! You can’t possibly make an array that big! Use
dynamic allocation (see Memory Allocation) instead.

I think it would be better to replace the snprintf calls with asprintf
and free the buffer afterwards. Setting file_name to 284 should be
fine however, as d_name is 256 max and the paths above are 26 maximum
I think (27 with the nul character).

Thanks, Roger.

