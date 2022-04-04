Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EACD44F1821
	for <lists+xen-devel@lfdr.de>; Mon,  4 Apr 2022 17:18:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.298406.508346 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbOSw-0006TC-Oz; Mon, 04 Apr 2022 15:18:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 298406.508346; Mon, 04 Apr 2022 15:18:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbOSw-0006RJ-KP; Mon, 04 Apr 2022 15:18:02 +0000
Received: by outflank-mailman (input) for mailman id 298406;
 Mon, 04 Apr 2022 15:18:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XwhO=UO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nbOSu-0006RD-Us
 for xen-devel@lists.xenproject.org; Mon, 04 Apr 2022 15:18:00 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6987a5e0-b42a-11ec-a405-831a346695d4;
 Mon, 04 Apr 2022 17:17:59 +0200 (CEST)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2053.outbound.protection.outlook.com [104.47.2.53]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-35-eLw67Z-XO1GfpfF6ppzaUw-1; Mon, 04 Apr 2022 17:17:55 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by AM0PR0402MB3332.eurprd04.prod.outlook.com (2603:10a6:208:22::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.31; Mon, 4 Apr
 2022 15:17:54 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476%7]) with mapi id 15.20.5123.031; Mon, 4 Apr 2022
 15:17:54 +0000
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
X-Inumbo-ID: 6987a5e0-b42a-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1649085479;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+6CoU2rRwczb21q8Va7JUfarj9XSiMD/HBppIkn9KAo=;
	b=FxOiuRK5XZSYtqgeRcA8WV8zEv0/QSfa6dy/XJhHlR8vIJWGNOn9cHIqyPLdQiifoC28Lw
	hFO3Mwt8c7n3OeuOmtJY0/q7sQKk0seUZRcyApIDPzzq2guCT25eS6vBmfShw/G1JvBVJl
	w/yE856put6Ue/bx3DmxbnO/2JfIK8Y=
X-MC-Unique: eLw67Z-XO1GfpfF6ppzaUw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YTha2m2IHaDFTrHORvKMZ57EHrnAFAxUopKGfCKJZUCQkCquIgUUcu8xNUQgTu3j2HY9uI1xmdHC7ca88G+Kan63yS47HM7z9BTwq72LTWCAYOhBiZuwbITWpoKoI9+C3yT++Pgqr6vXGIFZlSMU5x0VrW9nIya6QeGozyvcz1ZY3IKfIBqcr/XC+L6zTwzxxGa74tk/2zbdYzso7DIFMhvh8+rn6bUj85Gg2hbxELPhIjD6tG2tcHvQtby+PB6Nm/FBkvAlzdQuS8g/5/Rt1mtc/tEBSqhyjn96qgbWXb5hizFtOpeYTX7VvMDN1y+ii6pJ6W2lraQMIIxn26tuaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8Fjw+RuvsKwN1Lk+kT7VLLfY7fyuKPfG8qTanS8TrOM=;
 b=enZzrNUyyR8tChQ+HOGJ9Y0jsAlcPKSJ0/vly+cp6ZGJ2kGEVKRGlpG9cj/h89o4c//EhFnqT3pYDdDSV6pRgkv/XuR1WQRf+dfBlrEUIfMPCl9EAiiWZg3i8CW0578wzpsAKIreV7lZJrlUqtDYIF0E4wdsJitf3Oi+AKeI8nrLrQtQkJcDVa/XSFyyI5dI1ygiOunCSgVs3GLjiWPcOpwp6pfTju7bUQYzvv7Hk+zJX0906tUgETV1Mnl7ADMXNhvh+fkXvxO6tbKdRAyEQz1Lx3vOkwhKSLtotZFvIKCZOC64IQi8gLqPCwtYmFysjIThzi4/dWBm/Z4j98w82A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <54272d08-7ce1-b162-c8e9-1955b780ca11@suse.com>
Date: Mon, 4 Apr 2022 17:17:52 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 1/2] xsm: add ability to elevate a domain to privileged
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>
CC: xen-devel@lists.xenproject.org, scott.davis@starlab.io,
 jandryuk@gmail.com, Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>
References: <20220330230549.26074-1-dpsmith@apertussolutions.com>
 <20220330230549.26074-2-dpsmith@apertussolutions.com>
 <YkWgXhFVq/fD72CB@Air-de-Roger>
 <25c10763-36fa-34d4-05b6-655c08fdfee7@apertussolutions.com>
 <YksK9hIbJbOXkIYd@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YksK9hIbJbOXkIYd@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR06CA0164.eurprd06.prod.outlook.com
 (2603:10a6:20b:45c::15) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bf779b08-9af6-4aec-0188-08da164e4a77
X-MS-TrafficTypeDiagnostic: AM0PR0402MB3332:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR0402MB3332D2AB6DB0FD64D487D5A5B3E59@AM0PR0402MB3332.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	SNSyFvUut8wGJjTx3ox9MoQFQC0Iapt/pUygTLJpxUjUNkoc81MTGCVkChRRmum3xPd6d88UgJ9hRGSMMTHFr4STtN7LmC2U17FbDMEwXOITRg2IiaXe3GF49IbmoxEaisRg/FaZJblEIp6YR62EaCU1x1osjbbmflc1BUAUz5THzP2Y7tW2XYf3F7O6gq8g7TLeQ23hX5NeUfZeNYKJJaUnSu5ah1ZbEoGMkRbkAwRK1BNwdQAFC6iuykvbuwjmOmjNVBiDZ+qD32oY1fsS089SSkEOL5NCsBRwq0KbQxxyTYVphPQk2rwzUqDn2/abtKUxxbzYVdJlkZXZnPcdfF1ufPFm/LOl+E5pg4zs0Z4qMOfmHkaXY3puZ/IBo3/sF14Rh6TaZ61mDd8RDIEI5fgL4JHAgCN9QizGKZ0l5AuqWkqc3nNT5887GpYL+D5BDxCeaDuxIcVMVUqxgxZu1HHcrQ6lUCvaQ7oSrYkDIhkrBy50iHvMIrRdGXXFgmygK+8SJ014ptuhdoLAn3EhGUV15PvglFxc9qRDJ54UQdhfF2U5FFL7EYKt4j6PAamBaxEmn0AsF07zxgAa3TJ66TaBcjdNMkik+CX9IhNx77s20Zp6GvnZoStvptO6CQqInMXWqY6RvBGuptCMlVadqK51iwjxhUYHeY2Q8dVoZ13sHrjH8kWy8CXIs6Ej7hitSIhXp1mXKDILIWVATPzRihYoTrLm2zd/BEOG8oOaRyAYPgdIAvB+Mni4SlMrJbQP
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(2906002)(54906003)(83380400001)(110136005)(5660300002)(86362001)(508600001)(66946007)(31696002)(66476007)(66556008)(6486002)(4326008)(8676002)(2616005)(38100700002)(6512007)(36756003)(31686004)(316002)(53546011)(186003)(26005)(6506007)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0JvxoLi+qomxG+iNHdX4WsJPAyzUTeAXSpKGazA26fAbT78uFagQpFNlwE8v?=
 =?us-ascii?Q?0QefssPPNo6l+9wVIaY99lwnPwGA32sU9FeSTnljBVjOWcZ2qWun5xE8ArWJ?=
 =?us-ascii?Q?ZNp73EBchdbIDELxnZb4VBJUDsrCmcntDNYnS3fqg6Si+M4vmkqLgcWZ5w04?=
 =?us-ascii?Q?/7EeRNNiIu11sEFeYjJvIl9ScEtCjRuGqVVtNrXliXavzU9QfJQ9OfXjULGz?=
 =?us-ascii?Q?ONyDIiQC/mxYszu+hzxoK7l7C+t4b2aEYfSaHfyYIiCLP4BB7zFCP9vbfO13?=
 =?us-ascii?Q?aiaafyZtn3C0dW9uXcMrBwhpTxQxMM3HlZ0ImM94qxj03g2GPDeEZuv5y1yh?=
 =?us-ascii?Q?2bxmMVf63I4bM8GDlKx3sXftNkfFVOXyM1WsDaY+6P6aWb0/QcejuXKm3O+k?=
 =?us-ascii?Q?oXxaRvGjLi6BObceIEnWDH+SvdHEiRPSjuUyXwfZeeQkXlcDNzhGEl/flSsx?=
 =?us-ascii?Q?r4Q7DGP91CaX7D1IvLvE9MKRAGaarZpmSJp+cMo6JchiDnBwZHHm6geljitp?=
 =?us-ascii?Q?uojm230ELenyp9sLg83V11AKK8jZADoPyALSWnGaD4mAqjKjDtx8ggLuaEF/?=
 =?us-ascii?Q?AM6xJoNsr49FhgIu4OOzoeG23Oxof0CSKqhBiraHsfGaPRTX+EaCj7+psXQc?=
 =?us-ascii?Q?7pS2V0tpxCVdHhZDEwJe4yimvEH/e8+VE5Dj0YFZuhr9Y6b7/d+pKOrK0JAQ?=
 =?us-ascii?Q?rj/KJIJwzQZVt1VZSeSB0q2Y/qMnkyiMxAY7f28+zn+dbysAjnzgoiW7HLAd?=
 =?us-ascii?Q?xxLhGiOrSriQu0+ua+Q/vG9oya5oLpEk5F2hGjjDq0CBce1OJxAECPHyxKzw?=
 =?us-ascii?Q?JTOovJwVX56zymSEtqnWo1k/bRVZuYdQ7LdehKXz6toracVfzcvjiOKY3ToW?=
 =?us-ascii?Q?f+qe7nO0w+RgJENWhjZMVMNYVdj28RRRyL+bFOnhdSlsLFizCjn+T3hZvw4s?=
 =?us-ascii?Q?opn9P4+YiSR+Aesc9jRGp8JNPprNuxZxyD0dQnt87eRZRNOIwAiVwGj41g9r?=
 =?us-ascii?Q?uw/ZAIKWNTXn5DlZ1Jf5qmijiSHvd39K8RhJjXctT3GtLiFiRkS1ou4utK4B?=
 =?us-ascii?Q?zAf2Qo94bNEQ1I9wy0iik11QfkATMFNrofy60yQsd3BtcgGugTpotNa/ItY0?=
 =?us-ascii?Q?ObQxZxv06Phc7gnLKRVWvs45NrULVa9G2h1wQ6Jx5IhDUGpJ/ihagqrc2zxx?=
 =?us-ascii?Q?GF+xGVkKu0NYywnFCcIimVcUgddQ6ZbpisoJZ1/QHfET4bohamV9k4wuuru+?=
 =?us-ascii?Q?37F0TgoKQxvxnXovgrWfb3E0qdtQ3xVr9u+ivKZxSGJ4ZteWi+MGQi7c+NY6?=
 =?us-ascii?Q?J9OrT3GgtmSaisnf1qsIybHMmlRyPgtrYiBQtxoL///p0n+kljY/1XHRYtSj?=
 =?us-ascii?Q?NYedehfyN1eaAvl2CQ9GaBCxoMHqVyMA3jK19+CYYbPlM1pOq3OOQc80WAwI?=
 =?us-ascii?Q?zKdl3FdJ/W/1+pDOUNFaelYJG2E30zmfcIZF8YD6fkl9A82FQ3m7zN1nD5xH?=
 =?us-ascii?Q?/MhPAioc3JeX4SheM+1NQA7vxEXojt25ZvLKK9WODMzAXAteufR+YvaNlI2k?=
 =?us-ascii?Q?P+ObliG+YTqTijTifOy/2RYV1LTXbdFFKnl8KQpBxtCgIKoS7i+44eqV9LWY?=
 =?us-ascii?Q?Az8wz2lU/JDDFSYnZ/NgZmz/G4jmhbFZ3WI6G/s0rpweH++Aeb8FhYpanCKW?=
 =?us-ascii?Q?Z90RSFjdO8DQCshY8phArSPqxngo/rlxyVc2HoCbZIcxjpBSOZKN1IA9Njt3?=
 =?us-ascii?Q?jzRQ3yJ/Hw=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf779b08-9af6-4aec-0188-08da164e4a77
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2022 15:17:54.0012
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 96PHPqMJmJzPFwzHSBwX5x17FvBrljSAZ0pVdYrfjIe5HXy4wuv3C1bWNv8NWm7fc+unS6HhTFd3bYKJTrdklA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR0402MB3332

On 04.04.2022 17:12, Roger Pau Monn=C3=A9 wrote:
> On Mon, Apr 04, 2022 at 10:21:18AM -0400, Daniel P. Smith wrote:
>> On 3/31/22 08:36, Roger Pau Monn=C3=A9 wrote:
>>> On Wed, Mar 30, 2022 at 07:05:48PM -0400, Daniel P. Smith wrote:
>>>> There are now instances where internal hypervisor logic needs to make =
resource
>>>> allocation calls that are protected by XSM checks. The internal hyperv=
isor logic
>>>> is represented a number of system domains which by designed are repres=
ented by
>>>> non-privileged struct domain instances. To enable these logic blocks t=
o
>>>> function correctly but in a controlled manner, this commit introduces =
a pair
>>>> of privilege escalation and demotion functions that will make a system=
 domain
>>>> privileged and then remove that privilege.
>>>>
>>>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
>>>> ---
>>>>  xen/include/xsm/xsm.h | 22 ++++++++++++++++++++++
>>>
>>> I'm not sure this needs to be in xsm code, AFAICT it could live in a
>>> more generic file.
>>
>> From my perspective this is access control logic, thus why I advocate
>> for it to be under XSM. A personal goal is to try to get all security,
>> i.e. access control, centralized to the extent that it doing so does not
>> make the code base unnecessarily complicated.
>=20
> Maybe others have a different opinion, but IMO setting is_privileged
> is not XSM specific. It happens to solve an XSM issue, but that's no
> reason to place it in the xsm code base.

To be honest I can see justification for either placement.

>>>>  1 file changed, 22 insertions(+)
>>>>
>>>> diff --git a/xen/include/xsm/xsm.h b/xen/include/xsm/xsm.h
>>>> index e22d6160b5..157e57151e 100644
>>>> --- a/xen/include/xsm/xsm.h
>>>> +++ b/xen/include/xsm/xsm.h
>>>> @@ -189,6 +189,28 @@ struct xsm_operations {
>>>>  #endif
>>>>  };
>>>> =20
>>>> +static always_inline int xsm_elevate_priv(struct domain *d)
>>>
>>> I don't think it needs to be always_inline, using just inline would be
>>> fine IMO.
>>>
>>> Also this needs to be __init.
>>
>> AIUI always_inline is likely the best way to preserve the speculation
>> safety brought in by the call to is_system_domain().
>=20
> There's nothing related to speculation safety in is_system_domain()
> AFAICT. It's just a plain check against d->domain_id. It's my
> understanding there's no need for any speculation barrier there
> because d->domain_id is not an external input.

Whether is_system_domain() wants hardening really depends on where
it's used. It doesn't matter as much what specific check an is_...()
function performs, but what code paths it sits on where taking the
wrong branch of a conditional could reveal data which shouldn't be
visible.

Jan


