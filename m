Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D35611D86B
	for <lists+xen-devel@lfdr.de>; Thu, 12 Dec 2019 22:19:12 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ifVpO-00071W-Fr; Thu, 12 Dec 2019 21:16:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=6iYZ=2C=xenproject.org=lars.kurth@srs-us1.protection.inumbo.net>)
 id 1ifVpN-00070s-DZ
 for xen-devel@lists.xenproject.org; Thu, 12 Dec 2019 21:16:53 +0000
X-Inumbo-ID: 764bf188-1d24-11ea-b6f1-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 764bf188-1d24-11ea-b6f1-bc764e2007e4;
 Thu, 12 Dec 2019 21:15:03 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <lars.kurth@xenproject.org>)
 id 1ifVnW-00015x-SP; Thu, 12 Dec 2019 21:14:58 +0000
Received: from localhost ([127.0.0.1] helo=localhost.localdomain)
 by xenbits.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <lars.kurth@xenproject.org>)
 id 1ifVnW-0000Bm-I0; Thu, 12 Dec 2019 21:14:58 +0000
From: Lars Kurth <lars.kurth@xenproject.org>
To: xen-devel@lists.xenproject.org
Date: Thu, 12 Dec 2019 21:14:33 +0000
Message-Id: <0f6a6c4217b5a9309623a385d81eda70a8a901cd.1576184325.git.lars.kurth@citrix.com>
X-Mailer: git-send-email 2.13.0
In-Reply-To: <cover.1576184325.git.lars.kurth@citrix.com>
References: <cover.1576184325.git.lars.kurth@citrix.com>
MIME-Version: 1.0
In-Reply-To: <cover.1576184325.git.lars.kurth@citrix.com>
References: <cover.1576184325.git.lars.kurth@citrix.com>
Subject: [Xen-devel] [PATCH v3 6/7] Add guide on Communication Best Practice
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Lars Kurth <lars.kurth@citrix.com>, xen-api@lists.xenproject.org,
 minios-devel@lists.xenproject.org, committers@xenproject.org,
 mirageos-devel@lists.xenproject.org, win-pv-devel@lists.xenproject.org
Content-Type: multipart/mixed; boundary="===============4316864232921199091=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============4316864232921199091==
Content-Type: text/plain; charset=Y
Content-Transfer-Encoding: 8bit

From: Lars Kurth <lars.kurth@citrix.com>

This guide covers the bulk on Best Practice related to code review
It primarily focusses on code review interactions
It also covers how to deal with Misunderstandings and Cultural
Differences

Changes since v2 (added in v2)
* Fix typos
* Extended "Verbose vs. terse"
* Added "Clarity over Verbosity"
* Broke "Identify the severity of an issue or disagreement" into two chapters
  - "Identify the severity and optionality of review comments" and made
    clarifications
  - "Identify the severity of a disagreement"
  - Expanded "Prioritize significant flaws"
* Added "Reviewers: Take account of previous reviewer(s) comments"
* Added prefixes such as "Reviewers:" where appropriate
* Fixed lien wrapping to 80 characters
* Replaced inline links with reference links

Signed-off-by: Lars Kurth <lars.kurth@citrix.com>
---
Cc: minios-devel@lists.xenproject.org
Cc: xen-api@lists.xenproject.org
Cc: win-pv-devel@lists.xenproject.org
Cc: mirageos-devel@lists.xenproject.org
Cc: committers@xenproject.org
---
 communication-practice.md | 504 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 504 insertions(+)
 create mode 100644 communication-practice.md

diff --git a/communication-practice.md b/communication-practice.md
new file mode 100644
index 0000000..0ae2426
--- /dev/null
+++ b/communication-practice.md
@@ -0,0 +1,504 @@
+# Communication Best Practice
+
+This guide provides communication Best Practice that helps you in
+* Using welcoming and inclusive language
+* Keeping discussions technical and actionable
+* Being respectful of differing viewpoints and experiences
+* Being aware of your own and counterpart’s communication style and culture
+* Show empathy towards other community members
+
+## Code reviews for **reviewers** and **patch authors**
+
+Before embarking on a code review, it is important to remember that
+* A poorly executed code review can hurt the contributors feeling, even when a
+  reviewer did not intend to do so. Feeling defensive is a normal reaction to
+  a critique or feedback. A reviewer should be aware of how the pitch, tone,
+  or sentiment of their comments could be interpreted by the contributor. The
+  same applies to responses of an author to the reviewer.
+* When reviewing someone's code, you are ultimately looking for issues. A good
+  code reviewer is able to mentally separate finding issues from articulating
+  code review comments in a constructive and positive manner: depending on your
+  personality this can be **difficult** and you may need to develop a technique
+  that works for you.
+* As software engineers we like to be proud of the solutions we came up with.
+  This can make it easy to take another people’s criticism personally. Always
+  remember that it is the code that is being reviewed, not you as a person.
+* When you receive code review feedback, please be aware that we have reviewers
+  from different backgrounds, communication styles and cultures. Although we
+  all trying to create a productive, welcoming and agile environment, we do
+  not always succeed.
+
+### Express appreciation
+
+As the nature of code review to find bugs and possible issues, it is very easy
+for reviewers to get into a mode of operation where the patch review ends up
+being a list of issues, not mentioning what is right and well done. This can
+lead to the code submitter interpreting your feedback in a negative way.
+
+The opening of a code review provides an opportunity to address this and also
+sets the tone for the rest of the code review. Starting **every** review on a
+positive note, helps set the tone for the rest of the review.
+
+For an initial patch, you can use phrases such as
+> Thanks for the patch
+> Thanks for doing this
+
+For further revisions within a review, phrases such as
+> Thank you for addressing the last set of changes
+
+If you believe the code was good, it is good practice to highlight this by
+using phrases such as
+> Looks good, just a few comments
+> The changes you have made since the last version look good
+
+If you think there were issues too many with the code to use one of the
+phrases, you can still start on a positive note, by for example saying
+> I think this is a good change
+> I think this is a good feature proposal
+
+It is also entirely fine to highlight specific changes as good. The best place
+to do this, is at the top of a patch, as addressing code review comments
+typically requires a contributor to go through the list of things to address
+and an in-lined positive comment is likely to break that workflow.
+
+You should also consider, that if you review a patch of an experienced
+contributor phrases such as *Thanks for the patch* could come across as
+patronizing, while using *Thanks for doing this* is less likely to be
+interpreted as such.
+
+Appreciation should also be expressed by patch authors when asking for
+clarifications to a review or responding to questions. A simple
+> Thank you for your feedback
+> Thank you for your reply
+> Thank you XXX!
+
+is normally sufficient.
+
+### Avoid opinion: stick to the facts
+
+The way how a reviewer expresses feedback, has a big impact on how the author
+perceives the feedback. Key to this is what we call **stick to the facts**.
+The same is true when a patch author is responding to a comment from a
+reviewer.
+
+One of our maintainers has been studying Mandarin for several years and has
+come across the most strongly-worded dictionary entry [he has ever seen][1].
+This example illustrates the problem of using opinion in code reviews vs.
+using facts extremely well.
+
+> 裹脚 (guo3 jiao3): foot-binding (a vile feudal practice which crippled women
+> both physically and spiritually)
+
+This is not something one is used to hearing from dictionary entries. Once you
+investigate the practice foot-binding, it is hard to disagree with the
+dictionary entry. However, the statement does not contain much information. If
+you read it without knowing what foot-binding is, it is hard to be convinced
+by this statement. The main take-away is that the author of the dictionary
+entry had strong opinions about this topic. It does not tell you why you
+should have the same opinion.
+
+Compare this to the [Wikipedia entry][2]
+
+> Foot binding was the custom of applying tight binding to the feet of young
+> girls to modify the shape and size of their feet. ... foot binding was a
+> painful practice and significantly limited the mobility of women, resulting
+> in lifelong disabilities for most of its subjects. ... Binding usually
+> started during the winter months since the feet were more likely to be numb,
+> and therefore the pain would not be as extreme. …The toes on each foot
+> were curled under, then pressed with great force downwards and squeezed
+> into the sole of the foot until the toes broke…
+
+Without going into the details of foot-binding, it is noticeable that none of
+what is written above uses opinion which could be interpreted as inflammatory
+language. It is a list of simple facts that are laid out in a way that make it
+obvious what the correct conclusion is.
+
+Because the Wikipedia entry is entirely fact based it is more powerful and
+persuasive then the dictionary entry. The same applies to code reviews.
+
+Making statements in code reviews such as
+> Your code is garbage
+> This idea is stupid
+
+besides being an opinion is rude and counter productive
+* It will make the patch author angry: instead of finding a solution to the
+  problem the author will spend time and mental energy wrestling with their
+  feelings
+* It does not contain any information
+* Facts are both more powerful and more persuasive
+
+Consider the following two pieces of feedback on a piece of code
+> This piece of code is confusing
+> It took me a long time to ﬁgure out what was going on here
+
+The first example expresses an opinion, whereas the second re-phrases the
+statement in terms of what you experienced, which is a fact.
+
+Other examples:
+> BAD: This is fragile
+> SOMEWHAT BETTER: This seems fragile to me
+> BEST: If X happens, Y will happen.
+
+A certain piece of code can be written in many different ways: this can lead to
+disagreements on the best architecture, design or coding pattern. As already
+pointed out in this section: avoid feedback that is opinion-based and thus
+does not add any value. Back your criticism (or idea on how to solve a
+problem) with a sensible rationale.
+
+### Review the code, not the person
+
+Without realizing it, it is easy to overlook the difference between insightful
+critique of code and personal criticism. Let's look at a theoretical function
+where there is an opportunity to return out of the function early. In this
+case, you could say
+
+> You should return from this function early, because of XXX
+
+On its own, there is nothing wrong with this statement. However, a code review
+is made up of multiple comments and using **You should** consistently can
+start to feel negative and can be mis-interpreted as a personal attack. Using
+something like avoids this issue:
+
+> Returning from this function early is better, because of XXX
+
+Without personal reference, a code review will communicate the problem, idea
+or issue without risking mis-interpretation.
+
+### Verbose vs. terse
+
+Due to the time it takes to review and compose code reviewer, reviewers often
+adopt a terse style. It is not unusual to see review comments such as
+> typo
+> s/resions/regions/
+> coding style
+> coding style: brackets not needed
+etc.
+
+Terse code review style has its place and can be productive for both the
+reviewer and the author. However, overuse can come across as unfriendly,
+lacking empathy and can thus create a negative impression with the author of a
+patch. This is in particular true, when you do not know the author or the
+author is a newcomer. Terse communication styles can also be perceived as rude
+in some cultures.
+
+If you tend to use a terse commenting style and you do not know whether the
+author is OK with it, it is often a good idea to compensate for it in the code
+review opening (where you express appreciation) or when there is a need for
+verbose expression. However, when you know are working with a seasoned code
+author, it is also entirely acceptable to drop niceties such as expressing
+appreciation with the goal to save the author and reviewer time.
+
+It is also entirely fine to mention that you have a fairly terse communication
+style and ask whether the author is OK with it. In almost all cases, they will
+be: by asking you are showing empathy that helps counteract a negative
+impression.
+
+### Clarity over verbosity
+
+When reading this document, you may get the impression that following the
+guidance outlined here takes more effort and time for both code reviewers and
+code authors. This is not the intention: much of this document aims to create
+clearer communication, which ultimately saves time by reducing unnecessary
+iterations during communication. We value **clarity over verbosity**.
+
+Areas which often create unecessary back-and-forth between reviewers and
+authors are
+* Unstated assumptions and goals
+* Leave suggestions, examples, and resources (such as links to existing code)
+* There is nothing more helpful for the thought process than example. It
+  guarantees that you have a shared understanding and reduces the questions
+  asked on a comment.
+
+### Code Review Comments should be actionable
+
+Code review comments should be actionable: in other words, it needs to be clear
+what the author of the code needs to do to address the issue you identified.
+
+Statements such as
+> BAD: This is wrong
+> BAD: This does not work
+> BETTER, BUT NOT GOOD: This does not work, because of XXX
+
+do not normally provide the author of a patch with enough information to send
+out a new patch version. By doing this, you essentially force the patch author
+to **find** and **implement** an alternative, which then may also not be
+acceptable to you as the **reviewer** of the patch.
+
+A better way to approach this is to say
+
+> This does not work, because of XXX
+> You may want to investigate YYY and ZZZ as alternatives
+
+In some cases, it may not be clear whether YYY or ZZZ are the better solution.
+As a reviewer you should be as up-front and possible in such a case and say
+something like
+
+> I am not sure whether YYY and ZZZ are better, so you may want to outline your
+> thoughts about both solutions by e-mail first, such that we can decide what
+> works best
+
+### Identify the severity and optionality of review comments
+
+By default, every comment which is made **ought to be addressed** by the
+author. However, sometimes reviewers note issues, which would be nice if they
+were addressed, but are not mandatory to fix.
+
+Typically, reviewers use terminology such as
+> This would be a nice-to-have
+> This is not a blocker
+
+Some maintainers use
+> NIT: XXX
+
+however, it is sometimes also used to indicate a minor issue that **must** be
+fixed. Also terminology such as **this is not a blocker** could be
+misinterpreted. It is important that **reviewers** use language that make
+clear whether a comment is an optional suggestion. Examples may be
+> NIT (optional): XXX
+> I think it would be good if X also did Y, not a requirement but nice-to-have
+
+### Identify the severity of a disagreement
+
+During a code review, it can happen that reviewer and author disagree on how
+to move forward. The default position when it comes to disagreements is that
+**both parties want to argue their case**. However, frequently one or both
+parties do not feel that strongly about a specific issue.
+
+Within the Xen Project, we have [a way][3] to highlight one's position on
+proposals, formal or informal votes using the following notation:
+> +2 : I am happy with this proposal, and I will argue for it
+> +1 : I am happy with this proposal, but will not argue for it
+> 0 : I have no opinion
+> -1 : I am not happy with this proposal, but will not argue against it
+> -2 : I am not happy with this proposal, and I will argue against it
+
+You can use a phrase such as
+> I am not happy with this suggestion, but will not argue against it
+
+to make clear where you stand, while recording your position. Conversely, a
+reviewer may do something similar
+> I am not happy with XYZ, but will not argue against it [anymore]
+> What we have now is good enough, but could be better
+
+### Authors: responding to review comments
+
+Typically patch authors are expected to **address all** review comments in the
+next version of a patch or patch series. In a smooth-running code review where
+you do not have further questions it is not at all necessary to acknowledge
+the changes you are going to make:
+* Simply send the next version with the changes addressed and record it in the
+  change-log
+
+When there is discussion, the normal practice is to remove the portion of the
+e-mail thread where there is agreement. Otherwise, the thread can become
+exceptionally long.
+
+In cases where there was discussion and maybe disagreement, it does however
+make sense to close the discussion by saying something like
+
+> ACK
+> Seems we are agreed, I am going to do this
+
+Other situations when you may want to do this are cases where the reviewer made
+optional suggestions, to make clear whether the suggestion will be followed or
+not.
+
+### Avoid uncommon words: not everyone is a native English speaker
+
+Avoid uncommon words both when reviewing code or responding to a review. Not
+everyone is a native English speaker. The use of such words can come across
+badly and can lead to misunderstandings.
+
+### Prioritize significant flaws
+
+If a patch or patch series has significant flaws, such as
+* It is built on wrong assumptions
+* There are issues with the architecture or the design
+
+it does not make sense to do a detailed code review. In such cases, it is best
+to focus on the major issues first and deal with style and minor issues in a
+subsequent review. Not all series have significant flaws, but most series have
+different classes of changes that are required for acceptance: covering a
+range of major code modifications to minor code style fixes. To avoid
+misunderstandings between reviewers and contributors, it is important to
+establish and agree whether a series or part of a series has a significant
+flaw and agree a course of action.
+
+A pragmatic approach would be to
+* Highlight problematic portions of a series in the cover letter
+* For the patch author and reviewer(s) to agree that for problematic to omit
+  style and minor issues in the review, until the significant flaw is addressed
+
+This saves both the patch author and reviewer(s) time. Note that some
+background is covered in detail in [Problematic Patch Reviews][4].
+
+
+### Reviewers: Welcome newcomers
+
+When reviewing the first few patches of a newcomer to the project, you may want
+spend additional time and effort in your code review. This contributes to a
+more **positive experience**, which ultimately helps create a positive working
+relationship in the long term.
+
+When someone does their first code submission, they will not be familiar with
+**all** conventions in the project. A good approach is to
+* Welcome the newcomer
+* Offer to help with specific questions, for example on IRC
+* Point to existing documentation: in particular if mistakes with the
+  submission itself were made. In most situations, following the submission
+  process makes the process more seamless for the contributor. So, you could
+  say something like
+
+> Hi XXX. Welcome to the community and thank you for the patch
+>
+> I noticed that the submission you made seems to not follow our process.
+> Are you aware of this document at YYY? If you follow the instructions the
+> entire code submission process and dealing with review comments becomes
+> much easier. Feel free to find me on IRC if you need specific help. My IRC
+> handle is ZZZ
+
+### Reviewers: Take account of previous reviewer(s) comments
+
+Sometimes multiple reviewers share reviewing a series. For example,
+reviewer John has reviewed the first 5 iterations of the series. The patch
+author has addressed all of John's comments and Susan comes in and picks up
+the series after iteration 5. In such cases it is possible that John and Susan
+have different styles, such as
+* different preferences on the code layout
+* different preferences on code style
+
+If Susan were to be strict on her own style and highlight her style
+preferences in subsequent reviews, this would cause additional re-work for the
+code author. In addition, it also causes extra work for Susan. The easiest way
+to avoid such situations, would be for Susan to focus on faulty code only and
+to disregard personal preferences when taking over the review of a series.
+
+### Reviewers: Review the code, then review the review
+
+As stated earlier it is often difficult to mentally separate finding issues
+from articulating code review comments in a constructive and positive manner.
+Even as an experienced code reviewer you can be in a bad mood, which can
+ impact your communication style.
+
+A good trick to avoid this, is to start and complete the code review and then
+**not send it immediately**. You can then have a final go over the code review
+at some later point in time and review your comments from the other author's
+point of view. This minimizes the risk of being misunderstood. The same
+applies when replying to a code review: draft your reply and give it a final
+scan before pressing the send button.
+
+Generally, it is a good idea for code reviewers to do this regularly, purely
+from the viewpoint of self-improvement and self-awareness.
+
+## Common Communication Pitfalls
+
+This section contains common communication issues and provides suggestions on
+how to avoid them and resolve them. These are **general** issues which affect
+**all** online communication. As such, we can only try and do our best.
+
+### Misunderstandings
+
+When you meet face to face, you can read a person’s emotions. Even with a
+phone call, someone’s tone of voice can convey a lot of information. Using
+on-line communication channels you are flying blind, which often leads to
+misunderstandings. [Research][5] shows that in up to 50% of email
+conversations, the tone of voice is misinterpreted.
+
+In code reviews and technical discussions in general we tend to see two things
+* The reviewer or author interprets an exchange as too critical, passive
+  aggressive, or other: this usually comes down to different cultures and
+  communication styles, which are covered in the next section
+* There is an actual misunderstanding of a subject under discussion
+
+In the latter case, the key to resolution is to **identify the
+misunderstanding** as quickly as possible and call it out and de-escalate
+rather than let the misunderstanding linger. This is inherently difficult and
+requires more care than normal communication. Typically you would start with
+* Showing appreciation
+* Highlighting the potential misunderstanding and verifying whether the other
+  person also feels that maybe there was a misunderstanding
+* Proposing a way forward: for example, it may make sense to move the
+  conversation from the mailing list to [IRC][6] either in private or public,
+  a community call or a private phone/video call.
+
+It is entirely acceptable to do this in a direct reply to your communication
+partner, rather than on a public e-mail list on or an otherwise public forum.
+
+A good approach is to use something like the following:
+> Hi XXX! Thank you for the insights you have given me in this code review
+> I feel that we are misunderstanding each other on the topic of YYY
+> Would you mind trying to resolve this on IRC. I am available at ZZZ
+
+Usually, technical misunderstandings come down two either
+1. Misinterpreting what the other person meant
+2. Different - usually unstated - assumptions on how something works or what
+   is to be achieved
+3. Different - usually unstated - objectives and goals, which may be
+   conflicting
+4. Real differences in opinion
+
+The goal of calling out a possible misunderstanding is to establish what
+caused the misunderstanding, such that all parties can move forward.
+Typically, 1 and 2 are easily resolved and will lead back to a constructive
+discussion. Whereas 3 and 4 may highlight an inherent disagreement, which may
+need to be resolved through techniques as
+outlined in [Resolving Disagreement][7].
+
+### Cultural differences and different communication styles
+
+The Xen Project is a global community with contributors from many different
+backgrounds. Typically, when we communicate with a person we know, we factor
+in past interactions. The less we know a person, the more we rely on cultural
+norms.
+
+However, different norms and value systems come into play when people from
+diverse cultural backgrounds interact. That can lead to misunderstandings,
+especially in sensitive situations such as conflict resolution, giving and
+receiving feedback, and consensus building.
+
+For example, giving direct feedback such as
+> [Please] replace XXX with YYY, as XXX does not do ZZZ
+
+is acceptable and normal in some cultures, whereas in cultures which value
+indirect feedback it would be considered rude. In the latter case, something
+like the following would be used
+> This looks very good to me, but I believe you should use YYY here,
+> because XXX would....
+
+The key to working and communicating well with people from different cultural
+backgrounds is **self-awareness**, which can then be used to either
+* Adapt your own communication style depending on who you talk to
+* Or to find a middle-ground that covers most bases
+
+A number of different theories in the field of working effectively are
+currently popular, with the most well-known one being
+[Erin Meyer's Culture Map][8]. A short overview can be found [here][9]
+(33 slides).
+
+### Code reviews and discussions are not competitions
+
+Code reviews on our mailing lists are not competitions on who can come up with
+the smartest solution or who is the real coding genius.
+
+In a code review - as well as in general - we expect that all stake-holders
+* Gracefully accept constructive criticism
+* Focus on what is best for the community
+* Resolve differences in opinion effectively
+
+The next section provides pointers on how to do this effectively.
+
+### Resolving Disagreement Effectively
+
+Common scenarios are covered our guide on [Resolving Disagreement][7], which
+lays out situations that can lead to dead-lock and shows common patterns on
+how to avoid and resolve issues.
+
+[1]: https://youtu.be/ehZvBmrLRwg?t=834
+[2]: https://en.wikipedia.org/wiki/Foot_binding
+[3]: https://xenproject.org/developers/governance/#expressingopinion
+[4]: resolving-disagreement.md#problems
+[5]: https://www.wired.com/2006/02/the-secret-cause-of-flame-wars/
+[6]: https://xenproject.org/help/irc/
+[7]: resolving-disagreement.md
+[8]: https://en.wikipedia.org/wiki/Erin_Meyer
+[9]: https://www.nsf.gov/attachments/134059/public/15LFW_WorkingWithMulticulturalTeams_LarsonC.pdf
\ No newline at end of file
-- 
2.13.0



--===============4316864232921199091==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============4316864232921199091==--
